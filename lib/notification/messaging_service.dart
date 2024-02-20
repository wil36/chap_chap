// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;
FirebaseFunctions functions = FirebaseFunctions.instance;

class MessagingService {
  static getToken() {
    messaging.getToken().then((_token) {
      print(_token);
    });
  }

  static checkPersmission() async {
    var settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings;
  }

  static getCurrentTopic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var programmesNotification =
        prefs.getBool('ProgrammesNotification') ?? false;
    var routinesNotification = prefs.getBool('RoutinesNotification') ?? false;
    var articlesNotification = prefs.getBool('ArticlesNotification') ?? false;
    if (programmesNotification) {
      await messaging.subscribeToTopic('ProgrammesNotification');
    }
    if (routinesNotification) {
      await messaging.subscribeToTopic('RoutinesNotification');
    }
    if (articlesNotification) {
      await messaging.subscribeToTopic('ArticlesNotification');
    }
  }

  Future<void> semaine1ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prêt(e) pour ton premier Wash-Day du Programme Chap Chap ?',
      },
    );
  }

  Future<void> semaine2ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prends soin de tes cheveux de manière rapide & efficace !',
      },
    );
  }

  Future<void> semaine3ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Aujourd’hui, c’est le moment de nourrir tes cheveux en profondeur !',
      },
    );
  }

  Future<void> semaine4ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'On sait que tu as un peu la flemme mais on se motive !!',
      },
    );
  }

  Future<void> semaine5ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'T’es motivé(e) pour une petite clarification aujourd’hui ?',
      },
    );
  }

  Future<void> semaine6ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prêt(e) pour ton Wash-Day ?',
      },
    );
  }

  Future<void> semaine7ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'C’est le moment de prendre soin de toi !',
      },
    );
  }

  Future<void> semaine8ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'C’est le moment de renforcer tes cheveux avec un bon soin protéiné !',
      },
    );
  }

  Future<void> semaine9ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Quoi de mieux qu’une petite clarification pour repartir de 0 ?',
      },
    );
  }

  Future<void> semaine10ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prends soin de tes cheveux de manière rapide & efficace !',
      },
    );
  }

  Future<void> semaine11ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Tu arrives au bout du programme Chap Chap, plus que 2 wash day !',
      },
    );
  }

  Future<void> semaine12ProgrammesChapChapNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Dernier Wash-Day du programme Chap Chap , bravo !!',
      },
    );
  }

  Future<void> semaine01ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Méthode de l’inversion",
        'message': 'Prêt(e) pour la méthode de l’inversion ?',
      },
    );
  }

  Future<void> semaine02ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Méthode de l’inversion",
        'message': 'Prêt(e) pour la méthode de l’inversion ?',
      },
    );
  }

  Future<void> semaine03ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Méthode de l’inversion",
        'message': 'Prêt(e) pour la méthode de l’inversion ?',
      },
    );
  }

  Future<void> semaine04ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Méthode de l’inversion",
        'message': 'Prêt(e) pour la méthode de l’inversion ?',
      },
    );
  }

  Future<void> semaine05ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Méthode de l’inversion",
        'message': 'Prêt(e) pour la méthode de l’inversion ?',
      },
    );
  }

  Future<void> semaine06ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Méthode de l’inversion",
        'message': 'Prêt(e) pour la méthode de l’inversion ?',
      },
    );
  }

  Future<void> semaine1ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prêt(e) pour ton premier Wash-Day du Programme Pousse ?',
      },
    );
  }

  Future<void> semaine2ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prends soin de tes cheveux de manière rapide & efficace !',
      },
    );
  }

  Future<void> semaine3ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Aujourd’hui, c’est le moment de nourrir tes cheveux en profondeur !',
      },
    );
  }

  Future<void> semaine4ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'On sait que tu as un peu la flemme mais on se motive !!',
      },
    );
  }

  Future<void> semaine5ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prêt(e) pour ton Wash-Day ?',
      },
    );
  }

  Future<void> semaine6ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'T’es motivé(e) pour une petite clarification aujourd’hui ?',
      },
    );
  }

  Future<void> semaine7ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'C’est le moment de prendre soin de toi !',
      },
    );
  }

  Future<void> semaine8ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Les efforts payent toujours !',
      },
    );
  }

  Future<void> semaine9ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'C’est le moment de renforcer tes cheveux avec un bon soin protéiné !',
      },
    );
  }

  Future<void> semaine10ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Toujours motivé(e) à accélérer la pousse de tes cheveux ?',
      },
    );
  }

  Future<void> semaine11ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Bientôt la fin du programme Pousse, on lâche rien !',
      },
    );
  }

  Future<void> semaine12ProgrammesPousseNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Dernier Wash-Day du programme Pousse , bravo !!',
      },
    );
  }

  Future<void> semaine1ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Prêt(e) pour ton premier Wash-Day du Programme Transition ?',
      },
    );
  }

  Future<void> semaine2ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'La transition n’est pas toujours facile mais tu vas y arriver !',
      },
    );
  }

  Future<void> semaine3ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Aujourd’hui, c’est le moment de nourrir tes cheveux en profondeur !',
      },
    );
  }

  Future<void> semaine4ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'On sait que tu as un peu la flemme mais on se motive !!',
      },
    );
  }

  Future<void> semaine5ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'T’es motivé(e) pour une petite clarification aujourd’hui ?',
      },
    );
  }

  Future<void> semaine6ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prêt(e) pour ton Wash-Day ?',
      },
    );
  }

  Future<void> semaine7ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'C’est le moment de prendre soin de toi !',
      },
    );
  }

  Future<void> semaine8ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'C’est le moment de renforcer tes cheveux avec un bon soin protéiné !',
      },
    );
  }

  Future<void> semaine9ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Quoi de mieux qu’une petite clarification pour repartir de 0 ?',
      },
    );
  }

  Future<void> semaine10ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Prends soin de tes cheveux de manière rapide & efficace !',
      },
    );
  }

  Future<void> semaine11ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message':
            'Tu arrives au bout du programme Transition, plus que 2 wash day !',
      },
    );
  }

  Future<void> semaine12ProgrammesTransitionNotification() async {
    HttpsCallable callable = functions.httpsCallable('ProgrammesNotification');
    await callable.call(
      <String, dynamic>{
        "title": "Wash-Day !",
        'message': 'Dernier Wash-Day du programme Transition , bravo !!',
      },
    );
  }
}
