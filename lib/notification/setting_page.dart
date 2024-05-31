// ignore_for_file: non_constant_identifier_names

import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/notification/messaging_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../backend/backend.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MizzUpIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: MizzUpTheme.tertiaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Paramètres',
                  style: MizzUpTheme.title1.override(
                    fontFamily: 'IBM',
                    color: Colors.black,
                    useGoogleFonts: false,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Text(
              'Selectionnez les sujets pour lesquels vous souhaitez recevoir des notifications',
              style: MizzUpTheme.title1.override(
                fontFamily: 'IBM',
                color: Colors.black,
                useGoogleFonts: false,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  title: Text(
                    'Programmes',
                    style: MizzUpTheme.title1.override(
                      fontFamily: 'IBM',
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      useGoogleFonts: false,
                      fontSize: 14,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: MizzUpTheme.primaryColor,
                    value: _programmesNotification,
                    onChanged: (bool value) async {
                      setState(() {
                        _programmesNotification = value;
                        prefs.setBool('ProgrammesNotification', value);
                      });
                      if (value) {
                        if (currentUserDocument?.recevoirNotif != true) {
                          final usersUpdateData = createUsersRecordData(
                            recevoirNotif: true,
                          );
                          await currentUserReference!.update(usersUpdateData);
                        }
                        await messaging
                            .subscribeToTopic('ProgrammesNotification');
                        
                      } else {
                        await messaging
                            .unsubscribeFromTopic('ProgrammesNotification');
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Divider(),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Routines',
                    style: MizzUpTheme.title1.override(
                      fontFamily: 'IBM',
                      color: Colors.black,
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: MizzUpTheme.primaryColor,
                    value: _routinesNotification,
                    onChanged: (bool value) async {
                      setState(() {
                        _routinesNotification = value;
                         prefs.setBool('RoutinesNotification', value);
                      });
                      if (value) {
                        if (currentUserDocument?.recevoirNotif != true) {
                          final usersUpdateData = createUsersRecordData(
                            recevoirNotif: true,
                          );
                          await currentUserReference!.update(usersUpdateData);
                        }
                        await messaging
                            .subscribeToTopic('RoutinesNotification');
                      } else {
                        await messaging
                            .unsubscribeFromTopic('RoutinesNotification');
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Divider(),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Articles',
                    style: MizzUpTheme.title1.override(
                      fontFamily: 'IBM',
                      color: Colors.black,
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: MizzUpTheme.primaryColor,
                    value: _articlesNotification,
                    onChanged: (bool value) async {
                      setState(() {
                        _articlesNotification = value;
                         prefs.setBool('ArticlesNotification', value);
                      });
                      if (value) {
                        if (currentUserDocument?.recevoirNotif != true) {
                          final usersUpdateData = createUsersRecordData(
                            recevoirNotif: true,
                          );
                          await currentUserReference!.update(usersUpdateData);
                        }
                        await messaging
                            .subscribeToTopic('ArticlesNotification');
                      } else {
                        await messaging
                            .unsubscribeFromTopic('ArticlesNotification');
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
