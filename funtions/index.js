/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

const db = admin.firestore();
const messaging = admin.messaging();

exports.dailyNotificationsSender = functions
  .runWith({ timeoutSeconds: 300 })
  .pubsub.schedule("every 24 hours")
  .onRun(async (context) => {
    console.log("Initialisation de l'envoi");

    const notifRef = db.collection("Notification");
    const snapshot = await notifRef.where("date", "<=", Date.now()).get();
    snapshot.forEach(async (doc) => {
      console.log("Notification : ", doc.id, " en cours d'envoi");
      try {
        await messaging.send({
          notification: {
            title: doc.data().title,
            body: doc.data().message,
          },
          token: doc.data().token,
        });
        console.log("Message envoyé");
        await notifRef.doc(doc.id).delete();
        console.log("Document supprimé");
      } catch (ex) {
        console.log("Message non envoyé : ", ex);
      }
    });
    console.log("Requête terminée");
    return true;
  });

// Permet d'essayer via requête HTTP le bon fonctionnement de la requête

exports.test = functions
  .runWith({ timeoutSeconds: 300 })
  .https.onRequest(async () => {
    console.log("Initialisation de l'envoi");

    const notifRef = db.collection("Notification");
    const snapshot = await notifRef.where("date", "<=", Date.now()).get();
    snapshot.forEach(async (doc) => {
      console.log("Notification : ", doc.id, " en cours d'envoi");
      try {
        await messaging.send({
          notification: {
            title: doc.data().title,
            body: doc.data().message,
          },
          token: doc.data().token,
        });
        console.log("Message envoyé");
        await db.collection("Notification").doc(doc.id).delete();
        console.log("Document supprimé");
      } catch (ex) {
        console.log("Message non envoyé : ", ex);
      }
    });
    return true;
  });

exports.notifyUser = functions.https.onCall(async (data, _) => {
  try {
    await messaging.send({
      notification: {
        title: data.messageTitle,
        body: data.messageBody,
      },
      token: data.targetDevices,
    });

    return true;
  } catch (ex) {
    return ex;
  }
});

// exports.notifyUserTest = functions.https.onCall(async (data, _) => {
//   try {
//     // Send the message to the user's device
//     await messaging.send({
//       notification: {
//         title: data.title,
//         body: data.body,
//       },
//       data: {
//         url: data.url,
//       },
//       token: data.token,
//     });

//     return true;
//   } catch (error) {
//     console.log(error);
//     return error;
//   }
// });

exports.sendNotificationOnNewField = functions.firestore
  .document("notification_user/{docId}")
  .onCreate(async (snap, context) => {
    const newValue = snap.data();

    // Assurez-vous que les champs nécessaires existent dans le document
    if (newValue.userRef && newValue.Titre && newValue.description) {
      try {
        // Obtenez la référence du document utilisateur
        const userRef = newValue.userRef;
        const userSnapshot = await userRef.get();

        if (!userSnapshot.exists) {
          console.error("User document not found");
          return null;
        }

        const userData = userSnapshot.data();

        // Assurez-vous que le champ token existe dans le document utilisateur
        if (
          userData.token &&
          userData.recevoirNotif &&
          userData.recevoirNotif == true
        ) {
          const payload = {
            notification: {
              title: newValue.Titre,
              body: newValue.description,
            },
            token: userData.token,
          };

          // Envoyez la notification
          const response = await admin.messaging().send(payload);
          console.log("Notification sent successfully:", response);
        } else {
          console.error("No token found in user document");
        }
      } catch (error) {
        console.error("Error sending notification:", error);
      }
    } else {
      console.error("Missing required fields in notification_user document");
    }

    return null;
  });
