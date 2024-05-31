// ignore_for_file: avoid_print

import 'package:chap_chap/notification/notification_user_model.dart';
import 'package:chap_chap/notification/setting_page.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
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

  Stream<List<NotificationUserModel>> stream = FirebaseFirestore.instance
      .collection('notification_user')
      .where('userRef', isEqualTo: currentUserReference)
      .where('lu', isEqualTo: false)
      .orderBy('create_time', descending: true)
      .snapshots()
      .map((querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return NotificationUserModel.fromJson(data);
    }).toList();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<NotificationUserModel>>(
        stream: NotificationUserModel.getAllNotifications(),
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
          List<NotificationUserModel?> notificationNotificationsRecordList =
              snapshot.data!;
          print(notificationNotificationsRecordList.length);
          // ignore: unused_local_variable
          int notificationNotificationsRecord = 0;
          notificationNotificationsRecord = notificationNotificationsRecordList
              .where((element) => element!.lu == false)
              .length;
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
                    notificationNotificationsRecordList.length == 0
                        ? "Tu n'as pas de nouvelle notification"
                        : 'Tu as ${notificationNotificationsRecord} nouvelle(s) notification(s)',
                    style: MizzUpTheme.subtitle2.override(
                      fontFamily: 'IBM',
                      color: Colors.black,
                      useGoogleFonts: false,
                    ),
                  ),
                ),
                notificationNotificationsRecordList.isNotEmpty
                    ? Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.only(top: 10),
                                //   child: Material(
                                //     elevation: 4,
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(20)),
                                //     child: Container(
                                //       width: 300,
                                //       decoration: BoxDecoration(
                                //         color: MizzUpTheme.secondaryColor,
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(20)),
                                //       ),
                                //       child: Padding(
                                //         padding: EdgeInsets.only(
                                //             left: 10, right: 10),
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             SizedBox(
                                //               width: 200,
                                //               child: Row(
                                //                 children: [
                                //                   IconButton(
                                //                     onPressed: () {
                                //                       print('ok');
                                //                     },
                                //                     color: MizzUpTheme
                                //                         .secondaryColor,
                                //                     iconSize: 15,
                                //                     icon: Icon(
                                //                         Icons.notifications,
                                //                         color: MizzUpTheme
                                //                             .primaryColor),
                                //                   ),
                                //                   Expanded(
                                //                     child: Text(
                                //                       'Ma notification est cel ?',
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //             Text('14h30'),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                ...notificationNotificationsRecordList
                                    .asMap()
                                    .entries
                                    .map<Widget>((entry) {
                                  int index = entry.key;
                                  return InkWell(
                                    onTap: () async {
                                      if (notificationNotificationsRecordList[
                                                  index]!
                                              .type ==
                                          "Recettes") {
                                        RecettesRecord.getDocumentOnceNull(
                                                notificationNotificationsRecordList[
                                                        index]!
                                                    .docNotifRef)
                                            .then((value) async {
                                          final containerRecettesRecord = value;
                                          if (containerRecettesRecord == null) {
                                            return;
                                          }
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RecetteSuite2Widget(
                                                description:
                                                    containerRecettesRecord
                                                        .description!,
                                                dureePrepa:
                                                    containerRecettesRecord
                                                        .dureePrepa!,
                                                etapes: containerRecettesRecord
                                                    .etapes!,
                                                listeIngredients:
                                                    containerRecettesRecord
                                                        .listeIngredients!,
                                                niveauDifficulte:
                                                    containerRecettesRecord
                                                        .niveauDifficulte!,
                                                photoPrincipale:
                                                    containerRecettesRecord
                                                        .photoPrincipale!,
                                                titre: containerRecettesRecord
                                                    .titre!,
                                                nbIngredients:
                                                    containerRecettesRecord
                                                        .nbIngredients!,
                                                recetteRef:
                                                    containerRecettesRecord
                                                        .reference!,
                                              ),
                                            ),
                                          );
                                        });
                                      }

                                      NotificationUserModel.markAsRead(
                                          notificationNotificationsRecordList[
                                                  index]!
                                              .id);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),

                                      // decoration: const BoxDecoration(
                                      //   border: Border(
                                      //     top: BorderSide(
                                      //       width: 1,
                                      //       color: Colors.grey,
                                      //     ),
                                      //     // bottom: BorderSide(
                                      //     //   width: 1,
                                      //     //   color: Colors.grey,
                                      //     // ),
                                      //   ),
                                      // ),
                                      child: Material(
                                        elevation: 1,
                                        child: ListTile(
                                          title: Text(
                                            notificationNotificationsRecordList[
                                                    index]!
                                                .title,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                          subtitle: Text(
                                            notificationNotificationsRecordList[
                                                    index]!
                                                .message,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          trailing: Icon(
                                              Icons.arrow_forward_ios_rounded),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          )
                        ],
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
