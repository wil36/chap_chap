// ignore_for_file: avoid_print, unnecessary_statements
import 'package:chap_chap/articles/page_de_article_widget.dart';
import 'package:chap_chap/components/pas_de_prog_en_cours_widget.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_Calendar.dart';
import 'package:chap_chap/decouvrir_programme/fiche_programme_widget.dart';
import 'package:chap_chap/decouvrir_programme/prenium_widget.dart';
import 'package:chap_chap/decouvrir_programme/programme_suite_widget.dart';
import 'package:chap_chap/main.dart';
import 'package:chap_chap/profil/profil_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:table_calendar/table_calendar.dart';
import '../auth/auth_util.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
import '../backend/backend.dart';
import 'package:flutter_svg/svg.dart';
import '../components/nouvelle_routine_widget.dart';
import '../components/supprimer_programme_widget.dart';
import '../components/supprimer_routines_widget.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../notification/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagedaccueilWidget extends StatefulWidget {
  const PagedaccueilWidget({Key? key}) : super(key: key);

  @override
  _PagedaccueilWidgetState createState() => _PagedaccueilWidgetState();
}

class _PagedaccueilWidgetState extends State<PagedaccueilWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.week;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<DateTime> dateProg = [DateTime.now()];
  List<dynamic> dateRoutine = [DateTime.now()];
  List<DateTime> dateRoutineOther = [DateTime.now()];
  DateTime recurrencePoint = DateTime.now();
  ScrollController scrollController = new ScrollController();
  final Query<Map<String, dynamic>> collectionProg = FirebaseFirestore.instance
      .collection('progUser')
      .where('userRef', isEqualTo: currentUserReference);
  final Query<Map<String, dynamic>> collectionRoutines = FirebaseFirestore
      .instance
      .collection('routines')
      .where('userRef', isEqualTo: currentUserReference);

  int defaultChoiceIndex = 0;
  final List<String> _choicesList = [
    'Tout',
    'Zoom produits et ingrédients',
    'Astuces et conseils',
    'Chit Chat',
  ];

  final Map<String, String> categoryIds = {
    'Tout': '',
    'Zoom produits et ingrédients': '75',
    'Astuces et conseils': '76',
    'Chit Chat': '74',
  };

  @override
  void initState() {
    super.initState();
    getProgPoint(collectionProg);
    getRoutinePoint(collectionRoutines);
    //  endSubscription();
  }

  String? getProgImage(String titre) {
    if (titre == 'Programme Pousse') {
      return 'assets/programmes/pousse.jpg';
    } else if (titre == 'Programme Chap Chap') {
      return 'assets/programmes/chapchap.jpg';
    } else if (titre == 'Programme Mom') {
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: MizzUpTheme.tertiaryColor,
      ),
      child: StreamBuilder<UsersRecord?>(
          stream: UsersRecord.getDocument(currentUserReference!),
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
            final bool isAdmin = snapshot.data!.member!;
            return SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MizzUpIconButton(
                          borderColor: MizzUpTheme.secondaryColor,
                          borderRadius: 20,
                          buttonSize: 40,
                          fillColor: MizzUpTheme.secondaryColor,
                          icon: const FaIcon(
                            FontAwesomeIcons.bell,
                            color: MizzUpTheme.primaryColor,
                            size: 20,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationWidget(),
                              ),
                            );
                          },
                        ),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 5, 20, 10),
                          child: GestureDetector(
                            onTap: () async {
                              // Récupère la référence de la collection "users"
                              final usersCollection = FirebaseFirestore.instance
                                  .collection('users');
                              print(usersCollection);

                              // Récupère la référence de la collection "likes"
                              final likesCollection = FirebaseFirestore.instance
                                  .collection('likes');
                              print(likesCollection);

                              await addLikesFromUsers(
                                  usersCollection, likesCollection);
                            },
                            child: Text(
                              'Bonjour $currentUserDisplayName',
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 10),
                          child: Text(
                            'Bienvenue sur ton appli Chap chap, l’application pour prendre soin de tes cheveux sans te prendre la tête',
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
                      Align(
                        alignment: const AlignmentDirectional(-0.8, 0),
                        child: Container(
                          width: double.infinity,
                          // height: MediaQuery.of(context).size.height * 1,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mon calendrier",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          calendarFormat = calendarFormat ==
                                                  CalendarFormat.month
                                              ? CalendarFormat.week
                                              : CalendarFormat.month;
                                        });
                                      },
                                      child: Text(
                                        calendarFormat == CalendarFormat.month
                                            ? "Voir moins"
                                            : "Voir plus",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(18.0),
                                  elevation: 2,
                                  color: Colors.white,
                                  shadowColor: MizzUpTheme.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        calendarMini(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        progUser(),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Recettes",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 500),
                                            reverseDuration:
                                                Duration(milliseconds: 500),
                                            child: NavBarPage(index: 1),
                                          ),
                                        );
                                        // await Navigator.pushAndRemoveUntil(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         const ProfilchapWidget(),
                                        //   ),
                                        //   (r) => false,
                                        // );
                                      },
                                      child: Text(
                                        "Voir plus",
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: FutureBuilder<List<RecettesRecord?>>(
                                  future: queryRecettesRecordOnce(
                                    queryBuilder: (recettesRecord) =>
                                        recettesRecord.where('isUp',
                                            isEqualTo: true),
                                    limit: 6,
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
                                    List<RecettesRecord?>
                                        pageViewRecettesRecordList =
                                        snapshot.data!;
                                    return SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: Stack(
                                        children: [
                                          ListView.builder(
                                            // controller: scrollController,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                pageViewRecettesRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, pageViewIndex) {
                                              final pageViewRecettesRecord =
                                                  pageViewRecettesRecordList[
                                                      pageViewIndex]!;
                                              return Visibility(
                                                visible: (pageViewRecettesRecord
                                                        .hided) ==
                                                    false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1, -1),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  10, 0, 10, 0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.5,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.29,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Stack(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0,
                                                                          20,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.of(context).size.height * 0.9,
                                                                              child: RecetteSuite2Widget(
                                                                                description: pageViewRecettesRecord.description!,
                                                                                dureePrepa: pageViewRecettesRecord.dureePrepa!,
                                                                                etapes: pageViewRecettesRecord.etapes!,
                                                                                listeIngredients: pageViewRecettesRecord.listeIngredients!,
                                                                                niveauDifficulte: pageViewRecettesRecord.niveauDifficulte!,
                                                                                photoPrincipale: pageViewRecettesRecord.photoPrincipale!,
                                                                                titre: pageViewRecettesRecord.titre!,
                                                                                nbIngredients: pageViewRecettesRecord.nbIngredients!,
                                                                                recetteRef: pageViewRecettesRecord.reference!,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then(
                                                                          (value) {
                                                                        if (mounted) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      });
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      child: Image.asset(
                                                                          pageViewRecettesRecord
                                                                              .photoPrincipale!,
                                                                          width: double
                                                                              .infinity,
                                                                          height: double
                                                                              .infinity,
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: valueOrDefault(
                                                              pageViewRecettesRecord
                                                                  .isNew!,
                                                              false),
                                                          child: Align(
                                                            alignment:
                                                                const Alignment(
                                                                    -1, 0),
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 15,
                                                                      top: 30),
                                                              child: Center(
                                                                child: Text(
                                                                    "New",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12)),
                                                              ),
                                                              width: 40,
                                                              height: 20,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: MizzUpTheme
                                                                    .primaryColor,
                                                                // shape: BoxShape.circle,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.75, 0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 10,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  final favorisRecettesElement =
                                                                      pageViewRecettesRecord
                                                                          .reference;
                                                                  final favorisRecettesUpdate = currentUserDocument!
                                                                          .favorisRecettes!
                                                                          .toList()
                                                                          .contains(
                                                                              favorisRecettesElement)
                                                                      ? FieldValue
                                                                          .arrayRemove([
                                                                          favorisRecettesElement
                                                                        ])
                                                                      : FieldValue
                                                                          .arrayUnion([
                                                                          favorisRecettesElement
                                                                        ]);
                                                                  final usersUpdateData =
                                                                      {
                                                                    'favorisRecettes':
                                                                        favorisRecettesUpdate,
                                                                  };
                                                                  await currentUserDocument!
                                                                      .reference!
                                                                      .update(
                                                                          usersUpdateData);
                                                                },
                                                                value: currentUserDocument!
                                                                    .favorisRecettes!
                                                                    .toList()
                                                                    .contains(
                                                                        pageViewRecettesRecord
                                                                            .reference),
                                                                onIcon:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/profil/saved_recipe_full_icon.svg',
                                                                  width: 20,
                                                                  height: 20,
                                                                ),
                                                                offIcon:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/profil/saved_recipe_icon.svg',
                                                                  width: 20,
                                                                  height: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  15, 5, 0, 0),
                                                          child: Text(
                                                            pageViewRecettesRecord
                                                                .titre!,
                                                            style: MizzUpTheme
                                                                .bodyText1
                                                                .override(
                                                              fontFamily: 'IBM',
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Programmes",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 500),
                                            reverseDuration:
                                                Duration(milliseconds: 500),
                                            child: NavBarPage(index: 0),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Voir plus",
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              StreamBuilder<List<ProgrammesRecord?>>(
                                stream: queryProgrammesRecord(
                                  queryBuilder: (programmesRecord) =>
                                      programmesRecord.orderBy('create_time',
                                          descending: true),
                                  limit: 5,
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
                                  List<ProgrammesRecord?>
                                      wrapProgrammesRecordList = snapshot.data!;
                                  return ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                    0.45 +
                                                20,
                                        minHeight: 56.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          wrapProgrammesRecordList.length,
                                      itemBuilder: (context, wrapIndex) {
                                        final wrapProgrammesRecord =
                                            wrapProgrammesRecordList[
                                                wrapIndex]!;
                                        return StreamBuilder<ProgrammesRecord?>(
                                          stream: ProgrammesRecord.getDocument(
                                              wrapProgrammesRecord.reference!),
                                          builder: (context, snapshot) {
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
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              width: MediaQuery.of(context)
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0, 20, 0, 0),
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
                                                            child: ClipRRect(
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
                                                              child:
                                                                  Image.asset(
                                                                getProgImage(
                                                                    containerProgrammesRecord
                                                                        .titre!)!,
                                                                cacheHeight: ((MediaQuery.of(context).size.width *
                                                                            0.37) *
                                                                        (MediaQuery.of(context)
                                                                            .devicePixelRatio))
                                                                    .round(),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: isAdmin ==
                                                                  false &&
                                                              containerProgrammesRecord
                                                                      .free ==
                                                                  false,
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.6, -1),
                                                            child:
                                                                MizzUpIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 40,
                                                              fillColor: MizzUpTheme
                                                                  .tertiaryColor,
                                                              icon: const Icon(
                                                                Icons
                                                                    .lock_outlined,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const PreniumWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: valueOrDefault(
                                                              containerProgrammesRecord
                                                                      .isNew ??
                                                                  false,
                                                              false),
                                                          child: Align(
                                                            alignment:
                                                                const Alignment(
                                                                    -1, 0),
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 15,
                                                                      top: 30),
                                                              child: Center(
                                                                child: Text(
                                                                    "New",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12)),
                                                              ),
                                                              width: 40,
                                                              height: 20,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: MizzUpTheme
                                                                    .primaryColor,
                                                                // shape: BoxShape.circle,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              5, 10, 0, 0),
                                                      child: Text(
                                                        containerProgrammesRecord
                                                            .titre!,
                                                        style: MizzUpTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'IBM',
                                                          color: MizzUpTheme
                                                              .primaryColor,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              5, 5, 35, 0),
                                                      child: Text(
                                                        containerProgrammesRecord
                                                            .sousTitre!,
                                                        style: MizzUpTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'IBM',
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Articles",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 500),
                                            reverseDuration:
                                                Duration(milliseconds: 500),
                                            child: NavBarPage(index: 3),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Voir plus",
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              StreamBuilder<List<ArticlesRecord?>>(
                                stream: queryArticlesRecord(
                                  queryBuilder: (articlesRecord) =>
                                      articlesRecord
                                          .orderBy('create_time',
                                              descending: true)
                                          .where('categorie',
                                              isEqualTo: defaultChoiceIndex != 0
                                                  ? categoryIds[_choicesList[
                                                      defaultChoiceIndex]]
                                                  : null)
                                          .limit(4),
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
                                  List<ArticlesRecord?> rowArticlesRecordList =
                                      snapshot.data!;
                                  print(categoryIds[
                                      _choicesList[defaultChoiceIndex]]);

                                  return ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                    0.45 +
                                                20,
                                        minHeight: 56.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: rowArticlesRecordList.length,
                                      itemBuilder: (context, index) {
                                        final rowArticlesRecord =
                                            rowArticlesRecordList[index]!;
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, right: 10, left: 10),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PageDeArticleWidget(
                                                    detailArticle:
                                                        rowArticlesRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1, -1),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 20, 0, 0),
                                                      child: Material(
                                                        elevation: 0,
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.5,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(2),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  child: Image
                                                                      .network(
                                                                    rowArticlesRecord
                                                                        .imagePrincipale!,
                                                                    width: double
                                                                        .infinity,
                                                                    height: 200,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                        child: Html(
                                                                            data: '<div style="text-align: left; color: #844631;"><strong>' +
                                                                                HtmlUnescape().convert(rowArticlesRecord.titre!) +
                                                                                '</strong></div>')),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 10,
                                                      shape:
                                                          const CircleBorder(),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: ToggleIcon(
                                                          onPressed: () async {
                                                            favoriteScript(
                                                                rowArticlesRecord);
                                                          },
                                                          value: currentUserDocument!
                                                              .favorisArticles!
                                                              .toList()
                                                              .contains(
                                                                  rowArticlesRecord
                                                                      .reference),
                                                          onIcon: const Icon(
                                                            Icons
                                                                .favorite_sharp,
                                                            color: MizzUpTheme
                                                                .primaryColor,
                                                            size: 20,
                                                          ),
                                                          offIcon: const Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: MizzUpTheme
                                                                .primaryColor,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),

                              // addRoutine(),

                              // routineUser(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Future<List<DateTime>?> getProgPoint(
      Query<Map<String, dynamic>> collection) async {
    var querySnapshot = await collection.where('create_time').get();
    var tut = querySnapshot.docs
        .map((doc) => doc.get('create_time').toDate())
        .toList();
    if (mounted) {
      setState(() {
        dateProg = tut.cast<DateTime>();
      });
    }
    return dateProg;
  }

  Future<List<DateTime>?> getRoutinePoint(
      Query<Map<String, dynamic>> collection) async {
    var querySnapshot = await collection.get();
    var tut =
        querySnapshot.docs.map((doc) => doc.get('reccurenceTime')).toList();
    for (var doc in tut) {
      final allDataFirst = doc;
      final listPointFirst =
          allDataFirst.map((allData1) => allData1.toDate()).toList();
      for (var doc2 in listPointFirst) {
        if (mounted) {
          setState(() {
            dateRoutineOther.add(doc2);
          });
        }
      }
    }
    for (var doc in querySnapshot.docs) {
      final allData = doc["reccurenceTime"];
      final listPointSecond =
          allData.map((allData) => allData.toDate()).toList();
      if (mounted) {
        setState(() {
          dateRoutine = listPointSecond;
        });
      }
    }

    return dateRoutineOther;
  }

  Future<void> endSubscription() async {
    if (currentUserDocument?.member == true) {
      if (currentUserDocument?.dateFinAbo != null) {
        if (currentUserDocument!.dateFinAbo! < DateTime.now()) {
          final usersUpdateData = createUsersRecordData(
            member: false,
          );
          await currentUserReference!.update(usersUpdateData);
        }
      }
    }
  }

  Widget calendar() {
    return TableCalendar(
      locale: "fr",
      firstDay: kFirstDay,
      lastDay: kLastDay,
      eventLoader: (day) {
        DateTime dayTolocal = DateTime(day.year, day.month, day.day);
        if (dateProg.contains(dayTolocal)) {
          (date, locale) => DateFormat.E(locale).format(date).toCapitalized();

          return [const Event('Cyclic event')];
        }
        if (dateProg.contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateProg.contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine.contains(dayTolocal)) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine.contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine
            .contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther
            .contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther
            .contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther.contains(dayTolocal)) {
          return [const Event('Cyclic event')];
        }

        return [];
      },
      focusedDay:
          DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day),
      weekendDays: const [DateTime.saturday, DateTime.sunday],
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: const TextStyle(
          fontSize: 17.0,
          fontFamily: 'IBM',
          color: MizzUpTheme.primaryColor,
          fontWeight: FontWeight.w700,
        ),
        formatButtonTextStyle:
            const TextStyle(fontSize: 17.0, fontFamily: 'IBM'),
        formatButtonDecoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        headerMargin: const EdgeInsets.all(0.0),
        headerPadding: const EdgeInsets.symmetric(vertical: 8.0),
        formatButtonPadding: const EdgeInsets.all(10.0),
        leftChevronPadding: const EdgeInsets.all(12.0),
        rightChevronPadding: const EdgeInsets.all(12.0),
        leftChevronMargin: const EdgeInsets.symmetric(horizontal: 8.0),
        rightChevronMargin: const EdgeInsets.symmetric(horizontal: 8.0),
        leftChevronIcon: const Icon(Icons.chevron_left),
        rightChevronIcon: const Icon(Icons.chevron_right),
        leftChevronVisible: true,
        rightChevronVisible: true,
        decoration: const BoxDecoration(),
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMMM(locale).format(date).toCapitalized(),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date).toCapitalized(),
      ),
      calendarStyle: const CalendarStyle(
        markerSize: 4,
        markerMargin: EdgeInsets.symmetric(vertical: 5),
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        todayDecoration: BoxDecoration(
          color: MizzUpTheme.secondaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        selectedDecoration: BoxDecoration(
          color: MizzUpTheme.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = selectedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  Widget calendarMini() {
    return TableCalendar(
      locale: "fr",
      firstDay: kFirstDay,
      lastDay: kLastDay,
      eventLoader: (day) {
        DateTime dayTolocal = DateTime(day.year, day.month, day.day);
        if (dateProg.contains(dayTolocal)) {
          (date, locale) => DateFormat.E(locale).format(date).toCapitalized();

          return [const Event('Cyclic event')];
        }
        if (dateProg.contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateProg.contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine.contains(dayTolocal)) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine.contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine
            .contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther
            .contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther
            .contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther.contains(dayTolocal)) {
          return [const Event('Cyclic event')];
        }

        return [];
      },
      focusedDay:
          DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day),
      weekendDays: const [DateTime.saturday, DateTime.sunday],
      calendarFormat: calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        titleCentered: false,
        formatButtonVisible: false,
        formatButtonShowsNext: false,
        titleTextStyle: const TextStyle(
          fontSize: 17.0,
          fontFamily: 'IBM',
          color: MizzUpTheme.primaryColor,
          fontWeight: FontWeight.w700,
        ),
        formatButtonTextStyle:
            const TextStyle(fontSize: 17.0, fontFamily: 'IBM'),
        formatButtonDecoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        headerMargin: const EdgeInsets.only(left: 10, bottom: 12),
        headerPadding: const EdgeInsets.symmetric(vertical: 8.0),
        formatButtonPadding: const EdgeInsets.all(10.0),
        leftChevronPadding: const EdgeInsets.all(12.0),
        rightChevronPadding: const EdgeInsets.all(12.0),
        leftChevronMargin: const EdgeInsets.symmetric(horizontal: 8.0),
        rightChevronMargin: const EdgeInsets.symmetric(horizontal: 8.0),
        leftChevronIcon: const Icon(Icons.chevron_left),
        rightChevronIcon: const Icon(Icons.chevron_right),
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMMM(locale).format(date).toCapitalized(),
      ),
      availableGestures: AvailableGestures.horizontalSwipe,
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date).toCapitalized(),
      ),
      calendarStyle: CalendarStyle(
        markerSize: 5,
        markerMargin: EdgeInsets.symmetric(vertical: 5),
        // defaultDecoration: BoxDecoration(
        //   backgroundBlendMode: BlendMode.color,
        //   color: Colors.white,
        // ),
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        todayDecoration: BoxDecoration(
          color: MizzUpTheme.secondaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        selectedDecoration: BoxDecoration(
          color: MizzUpTheme.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = selectedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  Widget addRoutine() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 25, 10),
          child: Material(
            color: Colors.transparent,
            elevation: 5,
            shape: const CircleBorder(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: MizzUpIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                fillColor: MizzUpTheme.secondaryColor,
                icon: const Icon(
                  Icons.add,
                  color: MizzUpTheme.primaryColor,
                  size: 20,
                ),
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 1,
                          child: const NouvelleRoutineWidget(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget progUser() {
    return FutureBuilder<List<ProgUserRecord?>>(
      future: queryProgUserRecordOnce(
        queryBuilder: (progUserRecord) =>
            progUserRecord.where('dateAffichage1', arrayContainsAny: [
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)
              .toLocal(),
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)
              .toLocal()
              .add(const Duration(hours: 1)),
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)
              .toLocal()
              .subtract(const Duration(hours: 1))
        ]).where('userRef', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 0,
              height: 0,
              // child: CircularProgressIndicator(
              //   color: MizzUpTheme.primaryColor,
              // ),
            ),
          );
        }

        List<ProgUserRecord?> columnProgUserRecordList = snapshot.data!;

        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return SizedBox(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * 0.15,
            child: const PasDeProgEnCoursWidget(),
          );
        }
        final columnProgUserRecord = columnProgUserRecordList.isNotEmpty
            ? columnProgUserRecordList.first
            : null;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: FutureBuilder<DetailsWeekProgRecord?>(
                future: DetailsWeekProgRecord.getDocumentOnce(
                    columnProgUserRecord!.semaineShow!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 0,
                        height: 0,
                        child: CircularProgressIndicator(
                          color: MizzUpTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  // ignore: unused_local_variable
                  final containerDetailsWeekProgRecord = snapshot.data;

                  return Material(
                    color: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8E7DE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FutureBuilder<ProgrammesRecord?>(
                        future: ProgrammesRecord.getDocumentOnce(
                            columnProgUserRecord.progRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 0,
                                height: 0,
                                child: CircularProgressIndicator(
                                  color: MizzUpTheme.primaryColor,
                                ),
                              ),
                            );
                          }
                          final columnProgrammesRecord = snapshot.data;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProgrammeSuiteWidget(
                                        detailsProg: columnProgrammesRecord,
                                        detailsWeek:
                                            containerDetailsWeekProgRecord!,
                                        detailsProgUser: columnProgUserRecord,
                                        date: _selectedDay,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: NeverScrollableScrollPhysics(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 20, 0, 20),
                                            child: Container(
                                              width: 100,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFFEEEEEE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            columnProgrammesRecord!
                                                                .imagePrincipale!,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/z0582h302sn8/Rectangle_29_(1).png',
                                                          ),
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  columnProgrammesRecord.titre!,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: MizzUpTheme.title1
                                                      .override(
                                                    fontFamily: 'IBM',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          child:
                                                              const SupprimerProgrammeWidget(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.more_vert,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget routineUser() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 200),
      child: FutureBuilder<List<RoutinesRecord?>>(
        future: queryRoutinesRecordOnce(
          queryBuilder: (routinesRecord) => routinesRecord
              .where('userRef', isEqualTo: currentUserReference)
              .where('reccurenceTime', arrayContainsAny: [
            DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)
                .toLocal(),
            DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)
                .toLocal()
                .add(
                  const Duration(hours: 1),
                ),
          ]),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  color: MizzUpTheme.primaryColor,
                ),
              ),
            );
          }
          List<RoutinesRecord?>? columnRoutinesRecordList = snapshot.data!;
          // Return an empty Container when the document does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final columnRoutinesRecord = columnRoutinesRecordList.isNotEmpty
              ? columnRoutinesRecordList.first!
              : null;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8E7DE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30, 20, 0, 20),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          valueOrDefault<String?>(
                                            columnRoutinesRecord!.photo1,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/r8nmesqrsycy/Rectangle_13_(1).png',
                                          )!,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 20, 20, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ((columnRoutinesRecord
                                                .soinNourissant) ==
                                            true)
                                          Text(
                                            'Soin Nourissant',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord
                                                .shampoingClarifiant) ==
                                            true)
                                          Text(
                                            'Shampoing clarifiant',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord
                                                .shampoingDoux) ==
                                            true)
                                          Text(
                                            'Shampoing doux',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.coWash) ==
                                            true)
                                          Text(
                                            'Co wash',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.noPoo) ==
                                            true)
                                          Text(
                                            'No poo',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord
                                                .apresShampoing) ==
                                            true)
                                          Text(
                                            'Après shampoing',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord
                                                .soinHydratant) ==
                                            true)
                                          Text(
                                            'Soin Hydratant',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord
                                                .soinNourissant) ==
                                            true)
                                          Text(
                                            'Soin protéiné',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                columnRoutinesRecord.recurrence!,
                                style: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  fontSize: 10,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: SupprimerRoutinesWidget(
                                      detailRoutine: columnRoutinesRecord,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 0),
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Définit une fonction asynchrone pour récupérer les favoris de chaque utilisateur
  Future<void> addLikesFromUsers(usersCollection, likesCollection) async {
    // Récupère tous les documents de la collection "users"
    final usersSnapshots = await usersCollection.get();

    // Pour chaque document d'utilisateur
    for (final userSnapshot in usersSnapshots.docs) {
      // Récupère le champ "favorisRecettes" sous forme de liste
      if (userSnapshot.data()['favorisRecettes'] == null) {
        continue;
      }
      final favorisRecettes =
          List<DocumentReference>.from(userSnapshot.data()['favorisRecettes']);

      // Divise la liste de favoris en lots de moins de 500 éléments
      final recetteBatches = <List<DocumentReference>>[];
      while (favorisRecettes.isNotEmpty) {
        recetteBatches.add(favorisRecettes.take(500).toList());
        favorisRecettes.removeRange(0, min(500, favorisRecettes.length));
      }

      // Crée un nouveau batch pour les opérations à réaliser pour ce user
      final batch = FirebaseFirestore.instance.batch();

      // Pour chaque lot de favoris de recettes
      for (final recetteBatch in recetteBatches) {
        // Crée un nouveau document dans la collection "likes"
        final likeDocument = likesCollection.doc();

        // Convertit la liste de DocumentReference en une liste de Map pour le batch
        final recettesData = recetteBatch.map((ref) => {'ref': ref}).toList();

        // Ajoute les champs "recette_id" et "user_id" au nouveau document
        batch.set(
          likeDocument,
          {
            'recette_id': FieldValue.arrayUnion(recettesData),
            'user_id': userSnapshot.reference,
          },
        );
      }

      // Exécute le batch pour ajouter les documents de "likes" pour ce user
      await batch.commit();
    }
  }

  Future favoriteScript(rowArticlesRecord) async {
    final favorisArticlesElement = rowArticlesRecord.reference;
    final favorisArticlesUpdate = currentUserDocument!.favorisArticles!
            .toList()
            .contains(favorisArticlesElement)
        ? FieldValue.arrayRemove([favorisArticlesElement])
        : FieldValue.arrayUnion([favorisArticlesElement]);
    final usersUpdateData = {
      'favorisArticles': favorisArticlesUpdate,
    };
    await currentUserDocument!.reference!.update(usersUpdateData);
  }
}
