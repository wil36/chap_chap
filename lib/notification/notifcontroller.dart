import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotifController {
  /// Ajoute un document "Notification" dans Firestore
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<bool> unsuscribeToProgram() async {
    bool isSuccess = true;

    String? deviceToken = await messaging.getToken();

    final dbase = FirebaseFirestore.instance;
    await dbase
        .collection('Notification')
        .where('token', isEqualTo: deviceToken)
        .get()
        .then((value) async {
      for (var ds in value.docs) {
        if (ds.data()['programRef']! != "routine") {
          await ds.reference.delete();
        }
      }
    }).onError((error, stackTrace) {
      isSuccess = false;
    });

    return isSuccess;
  }

  Future<bool> unsuscribeToRoutine() async {
    bool isSuccess = true;

    String? deviceToken = await messaging.getToken();

    final dbase = FirebaseFirestore.instance;
    await dbase
        .collection('Notification')
        .where('token', isEqualTo: deviceToken)
        .get()
        .then((value) async {
      for (var ds in value.docs) {
        if (ds.data()['programRef']! == "routine") {
          await ds.reference.delete();
        }
      }
    }).onError((error, stackTrace) {
      isSuccess = false;
    });

    return isSuccess;
  }

  Future<bool> addDocToNotification(Timestamp timestamp, String titletext,
      String messagetext, String programRef) async {
    // Le  token permet de cibler l'appareil ( il n'est réinitialisé que dans de rares cas )
    // Stocker la timesstamp sous forme de milliSeconds, permet de la comparer directement par le serveur node.js ( Date.now() en js retourne une timestamp en milliseconds )
    String? deviceToken = await messaging.getToken();
    bool result = true;
    int time = timestamp.millisecondsSinceEpoch;
    String title = titletext;
    String message = messagetext;

    final dbase = FirebaseFirestore.instance;
    CollectionReference docRef = dbase.collection("Notification");

    final data = {
      'date': time,
      'title': title,
      'message': message,
      'token': deviceToken,
      'programRef': programRef
    };
    try {
      await docRef.add(data);
    } catch (e) {
      result = false;
    }

    return result;
  }

  /// Fonction à personnaliser pour s'abonner à une série de notifications ( une par semaine )
  /// La raccorder à la logique de l'app d'origine en passant par une date
  Future subscribeToChapChapProgram(DateTime date) async {
    DateTime firstDate = date;
    String programRef = "chapchap";

    Timestamp timestamp = Timestamp.fromDate(firstDate);
    String titletext = "Wash-Day !";
    String messagetext = "Prêt(e) pour ton premier Wash-Day du Programme ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 7)));
    titletext = "Wash-Day !";
    messagetext = "Prends soin de tes cheveux de manière rapide & efficace !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 14)));
    titletext = "Wash-Day !";
    messagetext =
        "Aujourd’hui, c’est le moment de nourrir tes cheveux en profondeur !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 21)));
    titletext = "Wash-Day !";
    messagetext = "On sait que tu as un peu la flemme mais on se motive !!";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 21)));
    titletext = "Wash-Day !";
    messagetext = "T’es motivé(e) pour une petite clarification aujourd’hui ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 28)));
    titletext = "Wash-Day !";
    messagetext = "Prêt(e) pour ton Wash-Day ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 35)));
    titletext = "Wash-Day !";
    messagetext = "C’est le moment de prendre soin de toi !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 42)));
    titletext = "Wash-Day !";
    messagetext =
        "C’est le moment de renforcer tes cheveux avec un bon soin protéiné !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 49)));
    titletext = "Wash-Day !";
    messagetext =
        "Quoi de mieux qu’une petite clarification pour repartir de 0 ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 56)));
    titletext = "Wash-Day !";
    messagetext = "Prends soin de tes cheveux de manière rapide & efficace !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 63)));
    titletext = "Wash-Day !";
    messagetext = "Tu arrives au bout du programme, plus que 2 wash day !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 70)));
    titletext = "Wash-Day !";
    messagetext = "Dernier Wash-Day du programme, bravo !!";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);
  }

  Future subscribeToPousseProgram(DateTime date) async {
    DateTime firstDate = date;
    String programRef = "pousse";

    Timestamp timestamp =
        Timestamp.fromDate(firstDate.add(const Duration(days: 1)));
    String titletext = "Méthode de l’inversion";
    String messagetext = "Prêt(e) pour la méthode de l’inversion ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 2)));
    titletext = "Méthode de l’inversion";
    messagetext = "Prêt(e) pour la méthode de l’inversion ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 3)));
    titletext = "Méthode de l’inversion";
    messagetext = "Prêt(e) pour la méthode de l’inversion ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 4)));
    titletext = "Méthode de l’inversion";
    messagetext = "Prêt(e) pour la méthode de l’inversion ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 5)));
    titletext = "Méthode de l’inversion";
    messagetext = "Prêt(e) pour la méthode de l’inversion ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 6)));
    titletext = "Méthode de l’inversion";
    messagetext = "Prêt(e) pour la méthode de l’inversion ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 7)));
    titletext = "Wash-Day !";
    messagetext = "Prêt(e) pour ton premier Wash-Day du Programme Pousse ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 14)));
    titletext = "Wash-Day !";
    messagetext = "Prends soin de tes cheveux de manière rapide & efficace !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 21)));
    titletext = "Wash-Day !";
    messagetext =
        "Aujourd’hui, c’est le moment de nourrir tes cheveux en profondeur !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 28)));
    titletext = "Wash-Day !";
    messagetext = "On sait que tu as un peu la flemme mais on se motive !!";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 35)));
    titletext = "Wash-Day !";
    messagetext = "Prêt(e) pour ton Wash-Day ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 42)));
    titletext = "Wash-Day !";
    messagetext = "T’es motivé(e) pour une petite clarification aujourd’hui ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 49)));
    titletext = "Wash-Day !";
    messagetext = "C’est le moment de prendre soin de toi !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 56)));
    titletext = "Wash-Day !";
    messagetext = "Les efforts payent toujours !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 63)));
    titletext = "Wash-Day !";
    messagetext =
        "C’est le moment de renforcer tes cheveux avec un bon soin protéiné !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 70)));
    titletext = "Wash-Day !";
    messagetext = "Toujours motivé(e) à accélérer la pousse de tes cheveux ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 77)));
    titletext = "Wash-Day !";
    messagetext = "Bientôt la fin du programme Pousse, on lâche rien !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 84)));
    titletext = "Wash-Day !";
    messagetext = "Dernier Wash-Day du programme Pousse , bravo !!";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);
  }

  Future subscribeToTransitionProgram(DateTime date) async {
    DateTime firstDate = date;
    String programRef = "transition";

    Timestamp timestamp = Timestamp.fromDate(firstDate);
    String titletext = "Wash-Day !";
    String messagetext =
        "Prêt(e) pour ton premier Wash-Day du Programme Transition ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 7)));
    titletext = "Wash-Day !";
    messagetext =
        "La transition n’est pas toujours facile mais tu vas y arriver !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 14)));
    titletext = "Wash-Day !";
    messagetext =
        "Aujourd’hui, c’est le moment de nourrir tes cheveux en profondeur !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 21)));
    titletext = "Wash-Day !";
    messagetext = "On sait que tu as un peu la flemme mais on se motive !!";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 21)));
    titletext = "Wash-Day !";
    messagetext = "T’es motivé(e) pour une petite clarification aujourd’hui ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 28)));
    titletext = "Wash-Day !";
    messagetext = "Prêt(e) pour ton Wash-Day ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 35)));
    titletext = "Wash-Day !";
    messagetext = "C’est le moment de prendre soin de toi !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 42)));
    titletext = "Wash-Day !";
    messagetext =
        "C’est le moment de renforcer tes cheveux avec un bon soin protéiné !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 49)));
    titletext = "Wash-Day !";
    messagetext =
        "Quoi de mieux qu’une petite clarification pour repartir de 0 ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 56)));
    titletext = "Wash-Day !";
    messagetext = "Prends soin de tes cheveux de manière rapide & efficace !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 63)));
    titletext = "Wash-Day !";
    messagetext =
        "Tu arrives au bout du programme Transition, plus que 2 wash day !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 70)));
    titletext = "Wash-Day !";
    messagetext = "Dernier Wash-Day du programme Transition , bravo !!";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);
  }

  Future subscribeToRoutineProgram(DateTime date) async {
    DateTime firstDate = date;
    String programRef = "routine";

    Timestamp timestamp = Timestamp.fromDate(firstDate);
    String titletext = "Wash-Day !";
    String messagetext = "Ta routine t'attends !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);
  }

  Future subscribeToDecouverteProgram(DateTime date) async {
    DateTime firstDate = date;
    String programRef = "decouverte";

    Timestamp timestamp = Timestamp.fromDate(firstDate);
    String titletext = "Wash-Day !";
    String messagetext = "Prêt(e) pour ton premier Wash-Day du Programme ?";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);

    timestamp = Timestamp.fromDate(firstDate.add(const Duration(days: 7)));
    titletext = "Wash-Day !";
    messagetext = "C’est le moment de prendre soin de toi !";
    await addDocToNotification(timestamp, titletext, messagetext, programRef);
  }
}
