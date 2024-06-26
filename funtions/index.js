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

// const db = admin.firestore();
// const messaging = admin.messaging();

// exports.dailyNotificationsSender = functions
//     .runWith({timeoutSeconds: 300})
//     .pubsub.schedule("every 24 hours")
//     .onRun(async (context) => {
//       console.log("Initialisation de l'envoi");

//       const notifRef = db.collection("Notification");
//       const snapshot = await notifRef.where("date", "<=", Date.now()).get();
//       snapshot.forEach(async (doc) => {
//         console.log("Notification : ", doc.id, " en cours d'envoi");
//         try {
//           await messaging.sendToDevice(doc.data().token, {
//             notification: {
//               title: doc.data().title,
//               body: doc.data().message,
//             },
//           });
//           console.log("Message envoyé");
//           await notifRef.doc(doc.id).delete();
//           console.log("Document supprimé");
//         } catch (ex) {
//           console.log("Message non envoyé : ", ex);
//         }
//       });
//       console.log("Requête terminée");
//       return true;
//     });

// // Permet d'essayer via requête HTTP le bon fonctionnement de la requête

// exports.test = functions
//     .runWith({timeoutSeconds: 300})
//     .https.onRequest(async () => {
//       console.log("Initialisation de l'envoi");

//       const notifRef = db.collection("Notification");
//       const snapshot = await notifRef.where("date", "<=", Date.now()).get();
//       snapshot.forEach(async (doc) => {
//         console.log("Notification : ", doc.id, " en cours d'envoi");
//         try {
//           await messaging.sendToDevice(doc.data().token, {
//             notification: {
//               title: doc.data().title,
//               body: doc.data().message,
//             },
//           });
//           console.log("Message envoyé");
//           await db.collection("Notification").doc(doc.id).delete();
//           console.log("Document supprimé");
//         } catch (ex) {
//           console.log("Message non envoyé : ", ex);
//         }
//       });
//       return true;
//     });

// exports.notifyUser = functions.https.onCall(async (data, _) => {
//   try {
//     await messaging.sendToDevice(data.targetDevices, {
//       notification: {
//         title: data.messageTitle,
//         body: data.messageBody,
//       },
//     });

//     return true;
//   } catch (ex) {
//     return ex;
//   }
// });

// exports.notifyUserTest = functions.https.onCall(async (data, _) => {
//   try {
//     // Send the message to the user's device
//     await messaging.sendToDevice(data.token, {
//       notification: {
//         title: data.title,
//         body: data.body,
//       },
//       data: {
//         url: data.url,
//       },
//     });

//     return true;
//   } catch (error) {
//     console.log(error);
//     return error;
//   }
// });

exports.notifyAllUsersOnNewComment = functions.firestore
  .document("forum_comments/{commentId}")
  .onCreate(async (snapshot, context) => {
    const commentData = snapshot.data();
    const forumId = commentData.forumId;

    try {
      // Récupérer le titre du forum
      const forumSnapshot = await admin
        .firestore()
        .collection("forum")
        .doc(forumId)
        .get();
      const forumData = forumSnapshot.data();
      const forumTitle = forumData.titre;

      // Récupérer les tokens des utilisateurs
      const t = admin.firestore();
      const tokensSnapshot = await t.collection("users").get();
      const tokens = [];

      tokensSnapshot.forEach((doc) => {
        const data = doc.data();
        if (
          data.token &&
          data.recevoirNotifForum &&
          data.recevoirNotifForum == true &&
          data.uid != commentData.userId
        ) {
          tokens.push(data.token);
        }
      });

      // Préparer la notification
      const payload = {
        notification: {
          title: `Nouveau commentaire sur le forum ${forumTitle}`,
          body: "Un nouveau commentaire a été ajouté.",
        },
      };

      if (tokens.length > 0) {
        await admin.messaging().sendToDevice(tokens, payload);
      }
    } catch (error) {
      console.error(
        "Erreur lors de la récupération du titre du " +
          "forum ou de l'envoi de la notification:",
        error
      );
    }
  });

exports.notifyUserOnReply = functions.firestore
  .document("forum_comments_reply/{replyId}")
  .onCreate(async (snapshot, context) => {
    const replyData = snapshot.data();
    const forumCommentId = replyData.forumCommentId;

    try {
      // Récupérer le commentaire d'origine
      const commentSnapshot = await admin
        .firestore()
        .collection("forum_comments")
        .doc(forumCommentId)
        .get();
      const commentData = commentSnapshot.data();
      const userId = commentData.userId;
      const forumId = commentData.forumId;

      // Récupérer le titre du forum
      const forumSnapshot = await admin
        .firestore()
        .collection("forum")
        .doc(forumId)
        .get();
      const forumData = forumSnapshot.data();
      const forumTitle = forumData.titre;

      // Récupérer le token de l'utilisateur
      const userSnapshot = await admin
        .firestore()
        .collection("users")
        .doc(userId)
        .get();
      const userData = userSnapshot.data();
      const token = userData.token;

      // Préparer la notification
      const payload = {
        notification: {
          title: `Nouvelle réponse à votre commentaire`,
          body: `Quelqu'un a répondu à votre commentaire sur le forum 
          ${forumTitle}.`,
        },
      };

      if (
        token &&
        userData.recevoirNotifForum &&
        userData.recevoirNotifForum == true &&
        userData.uid != userId
      ) {
        await admin.messaging().sendToDevice(token, payload);
      }
    } catch (error) {
      console.error(
        "Erreur lors de la récupération du commentaire, " +
          "du titre du forum ou de l'envoi de la notification:",
        error
      );
    }
  });

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
          };

          // Envoyez la notification
          const response = await admin
            .messaging()
            .sendToDevice(userData.token, payload);
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
