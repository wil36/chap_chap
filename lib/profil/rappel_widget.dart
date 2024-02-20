// ignore_for_file: unused_field

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

_unSubscribeToTopic() async {
  await messaging.unsubscribeFromTopic('ProgrammesNotification');
  await messaging.unsubscribeFromTopic('RoutinesNotification');
  await messaging.unsubscribeFromTopic('ArticlesNotification');
}

_subscribeToTopic() async {
  await messaging.subscribeToTopic('ProgrammesNotification');
  await messaging.subscribeToTopic('RoutinesNotification');
  await messaging.subscribeToTopic('ArticlesNotification');
}

class RappelWidget extends StatefulWidget {
  const RappelWidget({Key? key}) : super(key: key);

  @override
  _RappelWidgetState createState() => _RappelWidgetState();
}

class _RappelWidgetState extends State<RappelWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences prefs;
  bool _programmesNotification = false;
  bool _routinesNotification = false;
  bool _articlesNotification = false;

  @override
  void initState() {
    super.initState();
    getTopic();
  }

  getTopic() async {
    prefs = await SharedPreferences.getInstance();
    _programmesNotification = prefs.getBool('ProgrammesNotification') ?? false;
    _routinesNotification = prefs.getBool('RoutinesNotification') ?? false;
    _articlesNotification = prefs.getBool('ArticlesNotification') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MizzUpIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: MizzUpTheme.tertiaryColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Mes rappels',
                      style: MizzUpTheme.title3.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                child: Text(
                  'Pour ne rien manquer des nouveautés Chap Chap, tu peux activer les notifications ou t\'abonner à notre newsletter !',
                  style: MizzUpTheme.bodyText1.override(
                    fontFamily: 'IBM',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    useGoogleFonts: false,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: MizzUpTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                        color: MizzUpTheme.primaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      'Recevoir les notifications',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(1, 0),
                    child: CupertinoSwitch(
                      activeColor: MizzUpTheme.primaryColor,
                      value: currentUserDocument!.recevoirNotif ?? false,
                      onChanged: (bool value) async {
                        setState(() {
                          _programmesNotification = value;
                          _routinesNotification = value;
                          _articlesNotification = value;
                          prefs.setBool('ProgrammesNotification', value);
                          prefs.setBool('RoutinesNotification', value);
                          prefs.setBool('ArticlesNotification', value);
                        });
                        final usersUpdateData = createUsersRecordData(
                          recevoirNotif: value,
                        );
                        await currentUserReference!.update(usersUpdateData);
                        if (value) {
                          _subscribeToTopic();
                        } else {
                          _unSubscribeToTopic();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: MizzUpTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: MizzUpTheme.primaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      'Recevoir la newsletter',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(1, 0),
                    child: CupertinoSwitch(
                        activeColor: MizzUpTheme.primaryColor,
                        value: currentUserDocument!.recevoirNewsletter ?? true,
                        onChanged: (bool value) async {
                          final usersUpdateData = createUsersRecordData(
                            recevoirNewsletter:
                                !currentUserDocument!.recevoirNewsletter!,
                          );
                          await currentUserDocument!.reference!
                              .update(usersUpdateData);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
