import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:chap_chap/articles/articles_widget.dart';
import 'package:chap_chap/backend/backend.dart';
// import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:chap_chap/decouvrir_programme/decouvrir_programme_widget.dart';
import 'package:chap_chap/forum/forum_widget.dart';
import 'package:chap_chap/recettes/recettes_widget.dart';
import 'package:chap_chap/start/launch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
import 'MizzUp_Code/MizzUp_util.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'package:chap_chap/start/start_widget.dart';
import 'package:chap_chap/pagedaccueil/pagedaccueil_widget.dart';
import 'MizzUp_Code/MizzUp_theme.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'notification/messaging_service.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  MessagingService.checkPersmission();
  MessagingService.getCurrentTopic();
  if (Platform.isIOS) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }

  await FirebaseAppCheck.instance.activate();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MizzUpTheme.tertiaryColor,
    systemNavigationBarColor: MizzUpTheme.secondaryColor,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  MessagingService.getToken();
  runApp(
    MyApp(),
  );
}

const MaterialColor customColor = MaterialColor(
  0xFFB77E65,
  <int, Color>{
    50: Color(0xFFB77E65),
    100: Color(0xFFB77E65),
    200: Color(0xFFB77E65),
    300: Color(0xFFB77E65),
    400: Color(0xFFB77E65),
    500: Color(0xFFB77E65),
    600: Color(0xFFB77E65),
    700: Color(0xFFB77E65),
    800: Color(0xFFB77E65),
    900: Color(0xFFB77E65),
  },
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final appCheck = FirebaseAppCheck.instance;
  Stream<ChapChapFirebaseUser>? userStream;
  ChapChapFirebaseUser? initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((user) {});

  Future<void> setupInteractedMessage(BuildContext context) async {
    initialize(context);
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      debugPrint(
          'Message also contained a notification: ${initialMessage.notification!.body}');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        debugPrint('Message data 1 : ${message.data}');
        display(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('On message app');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        display(message);
      }
    });
  }

  Future<void> initialize(BuildContext context) async {
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );

    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  void display(RemoteMessage message) async {
    print(message.notification!.title);
    print(message.notification!.body);
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "01",
        "chap_chap",
        importance: Importance.max,
        icon: '@mipmap/ic_launcher',
        priority: Priority.high,
        enableVibration: true,
      ));

      await FlutterLocalNotificationsPlugin().show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: jsonEncode(message.data),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    userStream = chapChapFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(const Duration(seconds: 1),
        () => setState(() => displaySplashImage = false));

if(initialUser != null){
    final FirebaseMessaging _messaging = FirebaseMessaging.instance;
    String userId = FirebaseAuth.instance.currentUser!.uid;

    _messaging.getToken().then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'token': value!});
    });
    setupInteractedMessage(context); 
}
  }

  @override
  void dispose() async {
    authUserSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chap Chap',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: customColor)
              .copyWith(background: customColor)),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => const ListViewPassParameterWidget(),
              ),
            )
          : currentUser!.loggedIn
              ? const NavBarPage(index: 2)
              : const StartWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  PageController? _pageController;
  int _index = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final screen = [
    const DecouvrirProgrammeWidget(),
    const RecettesWidget(),
    const PagedaccueilWidget(),
    const ArticlesWidget(),
    const ForumWidget(),
    const PagedaccueilWidget()
  ];

  @override
  void initState() {
    super.initState();
    _index = widget.index;
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MizzUpTheme.tertiaryColor,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await Navigator.push(
      //       context,
      //       PageTransition(
      //         type: PageTransitionType.fade,
      //         duration: Duration(milliseconds: 500),
      //         reverseDuration: Duration(milliseconds: 500),
      //         child: NavBarPage(index: 5),
      //       ),
      //     );
      //   },
      //   backgroundColor: MizzUpTheme.secondaryColor,
      //   elevation: 8,
      //   child: const MizzUpIconButton(
      //     borderColor: Colors.transparent,
      //     borderRadius: 30,
      //     borderWidth: 1,
      //     buttonSize: 60,
      //     icon: Icon(
      //       Icons.calendar_today_sharp,
      //       color: MizzUpTheme.primaryColor,
      //       size: 30,
      //     ),
      //   ),
      // ),
      body: PageView(
        controller: _pageController,
        children: screen,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        elevation: 10,
        color: MizzUpTheme.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 85,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.home_filled),
                      color: MizzUpTheme.primaryColor,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: NavBarPage(index: 5),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Accueil',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: MizzUpTheme.primaryColor,
                        fontSize: 11,
                      ),
                    ),
                    Visibility(
                        visible: _index == 5,
                        child: Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MizzUpTheme.primaryColor,
                          ),
                        )),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.pending_actions),
                      color: MizzUpTheme.primaryColor,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: NavBarPage(index: 0),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Programmes',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: MizzUpTheme.primaryColor,
                        fontSize: 11,
                      ),
                    ),
                    Visibility(
                        visible: _index == 0,
                        child: Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MizzUpTheme.primaryColor,
                          ),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      color: MizzUpTheme.primaryColor,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: NavBarPage(index: 3),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Articles',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: MizzUpTheme.primaryColor,
                        fontSize: 11,
                      ),
                    ),
                    Visibility(
                        visible: _index == 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MizzUpTheme.primaryColor,
                          ),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.menu_book_outlined),
                      color: MizzUpTheme.primaryColor,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: NavBarPage(index: 1),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Recettes',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: MizzUpTheme.primaryColor,
                        fontSize: 11,
                      ),
                    ),
                    Visibility(
                        visible: _index == 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MizzUpTheme.primaryColor,
                          ),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline_rounded),
                      color: MizzUpTheme.primaryColor,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: NavBarPage(index: 4),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Forum',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: MizzUpTheme.primaryColor,
                        fontSize: 11,
                      ),
                    ),
                    Visibility(
                        visible: _index == 4,
                        child: Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MizzUpTheme.primaryColor,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }
}
