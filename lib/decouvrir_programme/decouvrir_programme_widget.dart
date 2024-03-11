import 'package:chap_chap/profil/profil_widget.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import 'fiche_programme_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'prenium_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DecouvrirProgrammeWidget extends StatefulWidget {
  const DecouvrirProgrammeWidget({Key? key}) : super(key: key);

  @override
  _DecouvrirProgrammeWidgetState createState() =>
      _DecouvrirProgrammeWidgetState();
}

class _DecouvrirProgrammeWidgetState extends State<DecouvrirProgrammeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> isUpImage = [
    'assets/programmes/chapchap.jpg',
    'assets/programmes/decouverte.jpg',
    'assets/programmes/pousse.jpg',
    'assets/programmes/transition.jpg'
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in isUpImage) {
      Image myImage = Image.asset(
        image,
        cacheWidth: 300,
        cacheHeight: 300,
      );
      precacheImage(myImage.image, context);
    }
  }

  String? getProgImage(String titre) {
    if (titre == 'Programme Pousse') {
      return 'assets/programmes/pousse.jpg';
    } else if (titre == 'Programme Chap Chap') {
      return 'assets/programmes/chapchap.jpg';
    } else if (titre == 'Programme Découverte') {
      return 'assets/programmes/decouverte.jpg';
    } else if (titre == 'Programme Transition') {
      return 'assets/programmes/transition.jpg';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: MizzUpTheme.tertiaryColor,
          ),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MizzUpIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: MizzUpTheme.secondaryColor,
                      icon: const FaIcon(
                        FontAwesomeIcons.user,
                        color: MizzUpTheme.primaryColor,
                        size: 20,
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilWidget(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 5, 0, 10),
                      child: GestureDetector(
                        onTap: () async {
                          // Récupère la référence de la collection "users"
//                         final usersCollection =
//                             FirebaseFirestore.instance.collection('users');
//                         print(usersCollection);

// // Récupère la référence de la collection "likes"
//                         final likesCollection =
//                             FirebaseFirestore.instance.collection('likes');
//                         print(likesCollection);

//                         await addLikesFromUsers(
//                             usersCollection, likesCollection);
                        },
                        child: Text(
                          'Bonjour $currentUserDisplayName!',
                          textAlign: TextAlign.start,
                          style: MizzUpTheme.title1.override(
                            fontFamily: 'IBM',
                            color: Colors.white,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 10),
                      child: Text(
                        'Bienvenue dans ton appli Chap Chap',
                        style: MizzUpTheme.bodyText1.override(
                          fontFamily: 'IBM',
                          color: Colors.white,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  currentUserDocument!.member == true
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              25, 2, 10, 0),
                                      child: StreamBuilder<
                                          List<ProgrammesRecord?>>(
                                        stream: queryProgrammesRecord(
                                          queryBuilder: (programmesRecord) =>
                                              programmesRecord.orderBy(
                                                  'create_time',
                                                  descending: true),
                                          limit: 10,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProgrammesRecord?>
                                              wrapProgrammesRecordList =
                                              snapshot.data!;
                                          return Wrap(
                                            spacing: 0,
                                            runSpacing: 0,
                                            alignment:
                                                WrapAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                wrapProgrammesRecordList.length,
                                                (wrapIndex) {
                                              final wrapProgrammesRecord =
                                                  wrapProgrammesRecordList[
                                                      wrapIndex]!;
                                              return StreamBuilder<
                                                  ProgrammesRecord?>(
                                                stream: ProgrammesRecord
                                                    .getDocument(
                                                        wrapProgrammesRecord
                                                            .reference!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 60,
                                                        height: 60,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final containerProgrammesRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.43,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                FicheProgrammeWidget(
                                                              detailsProgramme:
                                                                  containerProgrammesRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(0,
                                                                    20, 0, 0),
                                                            child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            20),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20),
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    getProgImage(
                                                                        containerProgrammesRecord
                                                                            .titre!)!,
                                                                    cacheHeight:
                                                                        ((MediaQuery.of(context).size.width * 0.37) *
                                                                                (MediaQuery.of(context).devicePixelRatio))
                                                                            .round(),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                )),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(5,
                                                                    10, 0, 0),
                                                            child: Text(
                                                              containerProgrammesRecord
                                                                  .titre!,
                                                              style: MizzUpTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                    'IBM',
                                                                color: MizzUpTheme
                                                                    .primaryColor,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(5,
                                                                    5, 35, 0),
                                                            child: Text(
                                                              containerProgrammesRecord
                                                                  .sousTitre!,
                                                              style: MizzUpTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                    'IBM',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  elevation: 0,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              25, 2, 10, 0),
                                      child: StreamBuilder<
                                          List<ProgrammesRecord?>>(
                                        stream: queryProgrammesRecord(
                                          queryBuilder: (programmesRecord) =>
                                              programmesRecord.orderBy(
                                                  'create_time',
                                                  descending: true),
                                          limit: 10,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProgrammesRecord?>
                                              wrapProgrammesRecordList =
                                              snapshot.data!;
                                          return Wrap(
                                            spacing: 0,
                                            runSpacing: 0,
                                            alignment:
                                                WrapAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                wrapProgrammesRecordList.length,
                                                (wrapIndex) {
                                              final wrapProgrammesRecord =
                                                  wrapProgrammesRecordList[
                                                      wrapIndex]!;
                                              return StreamBuilder<
                                                  ProgrammesRecord?>(
                                                stream: ProgrammesRecord
                                                    .getDocument(
                                                        wrapProgrammesRecord
                                                            .reference!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 60,
                                                        height: 60,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final containerProgrammesRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.43,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                FicheProgrammeWidget(
                                                              detailsProgramme:
                                                                  containerProgrammesRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20),
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                          height: MediaQuery.of(context).size.height *
                                                                              0.3,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0),
                                                                              bottomRight: Radius.circular(0),
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(20),
                                                                              bottomRight: Radius.circular(20),
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20),
                                                                            ),
                                                                            child:
                                                                                Image.asset(
                                                                              getProgImage(containerProgrammesRecord.titre!)!,
                                                                              cacheHeight: ((MediaQuery.of(context).size.width * 0.37) * (MediaQuery.of(context).devicePixelRatio)).round(),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          )),
                                                                ),
                                                                Visibility(
                                                                  visible:
                                                                      containerProgrammesRecord
                                                                              .free ==
                                                                          false,
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.6,
                                                                            -1),
                                                                    child:
                                                                        MizzUpIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          40,
                                                                      fillColor:
                                                                          Colors
                                                                              .white,
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .lock_outlined,
                                                                        color: MizzUpTheme
                                                                            .tertiaryColor,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const PreniumWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(5,
                                                                    10, 0, 0),
                                                            child: Text(
                                                              containerProgrammesRecord
                                                                  .titre!,
                                                              style: MizzUpTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                    'IBM',
                                                                color: MizzUpTheme
                                                                    .primaryColor,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(5,
                                                                    5, 35, 0),
                                                            child: Text(
                                                              containerProgrammesRecord
                                                                  .sousTitre!,
                                                              style: MizzUpTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                    'IBM',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PreniumWidget(),
                                      ),
                                    );
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                        color: MizzUpTheme.secondaryColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 7, 10, 7),
                                        child: Text(
                                          'Passer à la version Premium pour accéder aux programmes',
                                          textAlign: TextAlign.center,
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ]),
          ),
        ));
  }
}
