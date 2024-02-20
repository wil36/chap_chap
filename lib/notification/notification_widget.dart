// ignore_for_file: avoid_print

import 'package:chap_chap/notification/setting_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List _notifications = [];

  @override
  void initState() {
    super.initState();
    getForegroundNotifications();
  }

  getForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      if (message.notification != null) {
        print('Notification: ${message.notification!.title}');
        _notifications.add({
          'token': currentJwtToken,
          'title': message.notification!.title,
          'content': message.notification!.body,
        });
        showMessage();
      }
    });
  }

  showMessage() {
    setState(() {
      const snackBar = SnackBar(
        content: Text('Nouvelle notification!'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationsRecord?>>(
      stream: queryNotificationsRecord(
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where('userRef', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        }
        List<NotificationsRecord?> notificationNotificationsRecordList =
            snapshot.data!;
        // ignore: unused_local_variable
        final notificationNotificationsRecord =
            notificationNotificationsRecordList.isNotEmpty
                ? notificationNotificationsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -0.86),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
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
                            onPressed: () async {
                              var collection = FirebaseFirestore.instance
                                  .collection('users')
                                  .where('uid', isEqualTo: currentUserUid);
                              var querySnapshots = await collection.get();
                              for (var doc in querySnapshots.docs) {
                                await doc.reference.update({
                                  'userNotifications': 0,
                                });
                              }
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            'Notifications',
                            style: MizzUpTheme.title1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        MizzUpIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: const Icon(
                            Icons.settings,
                            color: MizzUpTheme.tertiaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingPage(),
                              ),
                            );
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                child: Text(
                  currentUserDocument?.userNotifications == 0
                      ? "Tu n'as pas de nouvelle notification"
                      : 'Tu as ${currentUserDocument?.userNotifications} nouvelle(s) notification(s)',
                  style: MizzUpTheme.subtitle2.override(
                    fontFamily: 'IBM',
                    color: Colors.black,
                    useGoogleFonts: false,
                  ),
                ),
              ),
              _notifications.isNotEmpty
                  ? Column(
                      children: [
                       Container(
  margin: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Column(children: [
    Padding( 
      padding: EdgeInsets.only(top:10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: MizzUpTheme.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print('ok');
                        },
                        color: MizzUpTheme.secondaryColor,
                        iconSize: 15,
                        icon: Icon(Icons.notifications, color: MizzUpTheme.primaryColor),
                      ),
                      Expanded(
                        child: Text(
                          'Ma notification est cel ?',
                        ),
                      ),
                    ],
                  ),
                ),
                Text('14h30'),
              ],
            ),
          ),
        ),
      ),
    ),
  ]
                              /*
                      _notifications.map((_notification) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey.shade200),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              _notification['title'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text(
                              _notification['content'],
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      }).toList(),
                      */
                              ),
                        )
                      ],
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
