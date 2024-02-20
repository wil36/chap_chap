const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp()

const db = admin.firestore();
const messaging = admin.messaging();

exports.dailyNotificationsSender = functions.runWith({ timeoutSeconds: 300 }).pubsub.schedule("every 24 hours").onRun(async (context) => {

    console.log("Initialisation de l'envoi");

    const notifRef = db.collection('Notification');
    const snapshot = await notifRef.where("date", "<=", Date.now()).get();
    snapshot.forEach(async doc => {

        console.log('Notification : ', doc.id, ' en cours d\'envoi');
        try {
            await messaging.sendToDevice(doc.data().token, {
                notification:
                {
                    title: doc.data().title,
                    body: doc.data().message
                }
            });
            console.log("Message envoyé");
            await notifRef.doc(doc.id).delete();
            console.log("Document supprimé");

        }
        catch (ex) {
            console.log('Message non envoyé : ', ex);
        }

    });
    console.log("Requête terminée");
    return true;

});

// Permet d'essayer via requête HTTP le bon fonctionnement de la requête

exports.test = functions.runWith({ timeoutSeconds: 300 }).https.onRequest(async () => {

    console.log("Initialisation de l'envoi");

    const notifRef = db.collection('Notification');
    const snapshot = await notifRef.where("date", "<=", Date.now()).get();
    snapshot.forEach(async doc => {

        console.log('Notification : ', doc.id, ' en cours d\'envoi');
        try {
            await messaging.sendToDevice(doc.data().token, {
                notification:
                {
                    title: doc.data().title,
                    body: doc.data().message
                }
            });
            console.log("Message envoyé");
            await db.collection('Notification').doc(doc.id).delete();
            console.log("Document supprimé");

        }
        catch (ex) {
            console.log('Message non envoyé : ', ex);
        }

    });
    return true;

});

exports.notifyUser = functions.https.onCall(async (data, _) => {
    try {
        await messaging.sendToDevice(data.targetDevices, {
            notification: {
                title: data.messageTitle,
                body: data.messageBody
            }
        });

        return true;
    } catch (ex) {
        return ex;
    }
});

exports.notifyUserTest = functions.https.onCall(async (data, _) => {
    try {
        // Send the message to the user's device
        await messaging.sendToDevice(data.token, {
            notification: {
                title: data.title,
                body: data.body
            },
            data: {
                url: data.url
            }
        });

        return true;
    } catch (error) {
        console.log(error);
        return error;
    }
});

