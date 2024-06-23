// ignore_for_file: avoid_print

import 'package:chap_chap/forum/Models/forum_model.dart';
import 'package:chap_chap/forum/detail_forum_widget.dart';
import 'package:chap_chap/notification/notification_user_model.dart';
import 'package:chap_chap/notification/setting_page.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List _notifications = [];
  var groupByDate = {};
  String dateText = "";
  int lastIndex = 0;
  String nowDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).toString().substring(0, 10);
  String beforeDay = DateTime(
    DateTime.now().subtract(const Duration(days: 1)).year,
    DateTime.now().subtract(const Duration(days: 1)).month,
    DateTime.now().subtract(const Duration(days: 1)).day,
  ).toString().substring(0, 10);
  ScrollController scrollController = new ScrollController();

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
          // ignore: unused_local_variable

          if (notificationNotificationsRecordList.length != 0) {
            groupByDate = groupBy(
                notificationNotificationsRecordList,
                (NotificationUserModel? obj) =>
                    obj!.createTime.toDate().toString().substring(0, 10));
          }
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              controller: scrollController,

              // physics: NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, -0.86),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
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
                          : 'Tu as ${notificationNotificationsRecordList.length} nouvelle(s) notification(s)',
                      style: MizzUpTheme.subtitle2.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                  notificationNotificationsRecordList.isNotEmpty
                      ? SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
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

                                    ListView.builder(
                                        controller: scrollController,
                                        itemCount: groupByDate.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index1) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                  groupByDate.keys.toList()[
                                                              index1] ==
                                                          nowDate
                                                      ? 'Aujourd\'hui'
                                                      : groupByDate.keys
                                                                      .toList()[
                                                                  index1] ==
                                                              beforeDay
                                                          ? 'Hier'
                                                          : '${groupByDate.keys.toList()[index1]}',
                                                  style: TextStyle(
                                                      color: MizzUpTheme
                                                          .tertiaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              ListView.builder(
                                                  controller: scrollController,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: groupByDate[
                                                          groupByDate.keys
                                                                  .toList()[
                                                              index1]]!
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    NotificationUserModel
                                                        notif =
                                                        groupByDate[groupByDate
                                                                .keys
                                                                .toList()[
                                                            index1]]![index];
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10),
                                                          child: Dismissible(
                                                            key: UniqueKey(),
                                                            confirmDismiss:
                                                                (direction) async {
                                                              if (direction ==
                                                                  DismissDirection
                                                                      .endToStart) {
                                                                showDialog<
                                                                        bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return Theme(
                                                                        data:
                                                                            ThemeData(
                                                                          useMaterial3:
                                                                              false,
                                                                        ),
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              Text('Confirmation'),
                                                                          content:
                                                                              Text('Voulez-vous supprimer ?'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop(false);
                                                                              },
                                                                              child: Text('Non'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () async {
                                                                                await Future.delayed(const Duration(milliseconds: 500));

                                                                                NotificationUserModel.deleteNotification(notif.id);
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('Oui'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    });
                                                                return false;
                                                              } else {
                                                                return false;
                                                              }
                                                            },
                                                            background:
                                                                Container(
                                                              color: MizzUpTheme
                                                                  .secondaryColor,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: MizzUpTheme
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                if (notif
                                                                        .type ==
                                                                    "Recettes") {
                                                                  RecettesRecord
                                                                          .getDocumentOnceNull(notif
                                                                              .docNotifRef)
                                                                      .then(
                                                                          (value) async {
                                                                    final containerRecettesRecord =
                                                                        value;
                                                                    if (containerRecettesRecord ==
                                                                        null) {
                                                                      return;
                                                                    }
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                RecetteSuite2Widget(
                                                                          description:
                                                                              containerRecettesRecord.description!,
                                                                          dureePrepa:
                                                                              containerRecettesRecord.dureePrepa!,
                                                                          etapes:
                                                                              containerRecettesRecord.etapes!,
                                                                          listeIngredients:
                                                                              containerRecettesRecord.listeIngredients!,
                                                                          niveauDifficulte:
                                                                              containerRecettesRecord.niveauDifficulte!,
                                                                          photoPrincipale:
                                                                              containerRecettesRecord.photoPrincipale!,
                                                                          titre:
                                                                              containerRecettesRecord.titre!,
                                                                          nbIngredients:
                                                                              containerRecettesRecord.nbIngredients!,
                                                                          recetteRef:
                                                                              containerRecettesRecord.reference!,
                                                                        ),
                                                                      ),
                                                                    );

                                                                    NotificationUserModel
                                                                        .markAsRead(
                                                                            notif.id);
                                                                  });
                                                                } else if (notif
                                                                        .type ==
                                                                    "Forum") {
                                                                  await notif
                                                                      .docNotifRef
                                                                      .get()
                                                                      .then(
                                                                          (value) {
                                                                    if (value
                                                                            .data() !=
                                                                        null) {
                                                                      ForumModel
                                                                          item =
                                                                          ForumModel.fromJson(value.data() as Map<
                                                                              String,
                                                                              dynamic>);
                                                                      item.id =
                                                                          value
                                                                              .id;
                                                                      print(
                                                                          'Helllo ${item.description}');
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              DetailForumWidget(
                                                                            forumModel:
                                                                                item,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  });
                                                                  NotificationUserModel
                                                                      .markAsRead(
                                                                          notif
                                                                              .id);
                                                                }
                                                              },
                                                              child: Material(
                                                                color: notif.lu ==
                                                                        false
                                                                    ? MizzUpTheme
                                                                        .secondaryColor
                                                                        .withOpacity(
                                                                            0.3)
                                                                    : Colors
                                                                        .white,
                                                                elevation: 0,
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5,
                                                                          top:
                                                                              5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      ListTile(
                                                                    subtitle:
                                                                        Text(
                                                                      notif
                                                                          .message,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                    trailing:
                                                                        Text(
                                                                      DateFormat('HH:mm').format(notif
                                                                          .createTime
                                                                          .toDate()),
                                                                    ),
                                                                    leading:
                                                                        Container(
                                                                      width: 30,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          color: MizzUpTheme
                                                                              .primaryColor,
                                                                          shape:
                                                                              BoxShape.circle),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .notifications_none_outlined,
                                                                        size:
                                                                            20,
                                                                        color: MizzUpTheme
                                                                            .secondaryColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ],
                                          );
                                        })
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
