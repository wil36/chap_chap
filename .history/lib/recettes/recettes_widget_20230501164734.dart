// ignore_for_file: duplicate_import

import 'package:chap_chap/components/condition_hygiene_widget.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_widgets.dart';
import 'package:chap_chap/recettes/recette_suite.dart';
import 'package:chap_chap/recettes/recetteRef.dart';
import 'package:chap_chap/recettes/recette_suite.dart';
import 'package:chap_chap/recettes/searchAllRecettes.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../notification/notification_widget.dart';
import 'recette_suite2_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RecettesWidget extends StatefulWidget {
  const RecettesWidget({Key? key}) : super(key: key);

  @override
  _RecettesWidgetState createState() => _RecettesWidgetState();
}

class _RecettesWidgetState extends State<RecettesWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    pageViewController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: MizzUpTheme.tertiaryColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
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
                            builder: (context) => const NotificationWidget(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Découvre nos toz !',
                      textAlign: TextAlign.start,
                      style: MizzUpTheme.title1.override(
                        fontFamily: 'IBM',
                        color: Colors.white,
                        fontSize: 21,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 4, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentUserDocument!.member == true
                            ? FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SearchAllRecetteWidget(),
                                    ),
                                  );
                                },
                                text: 'Rechercher',
                                icon: const Icon(
                                  Icons.search,
                                  color: MizzUpTheme.primaryColor,
                                  size: 15,
                                ),
                                options: MizzUpOptionButton(
                                  width: 290,
                                  height: 40,
                                  color: Colors.white,
                                  textStyle: MizzUpTheme.subtitle2.override(
                                    fontFamily: 'IBM',
                                    color: MizzUpTheme.primaryColor,
                                    useGoogleFonts: false,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              )
                            : FFButtonWidget(
                                onPressed: () async {},
                                text: 'Rechercher',
                                icon: const Icon(
                                  Icons.search,
                                  color: MizzUpTheme.primaryColor,
                                  size: 15,
                                ),
                                options: MizzUpOptionButton(
                                  width: 290,
                                  height: 40,
                                  color: Colors.white,
                                  textStyle: MizzUpTheme.subtitle2.override(
                                    fontFamily: 'IBM',
                                    color: MizzUpTheme.primaryColor,
                                    useGoogleFonts: false,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Recettes à la une',
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<UsersRecord?>(
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
                        return Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                            child: FutureBuilder<List<RecettesRecord?>>(
                              future: queryRecettesRecordOnce(
                                queryBuilder: (recettesRecord) => recettesRecord.where('isUp', isEqualTo: true),
                                limit: 4,
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
                                List<RecettesRecord?> pageViewRecettesRecordList = snapshot.data!;
                                return SizedBox(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height * 0.35,
                                  child: Stack(
                                    children: [
                                      PageView.builder(
                                        controller: pageViewController ??= PageController(initialPage: min(0, pageViewRecettesRecordList.length - 1)),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: pageViewRecettesRecordList.length,
                                        itemBuilder: (context, pageViewIndex) {
                                          final pageViewRecettesRecord = pageViewRecettesRecordList[pageViewIndex]!;
                                          return Visibility(
                                            visible: (pageViewRecettesRecord.hided) == false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  alignment: const AlignmentDirectional(1, -1),
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width,
                                                        height: MediaQuery.of(context).size.height * 0.29,
                                                        decoration: const BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  showModalBottomSheet(
                                                                    isScrollControlled: true,
                                                                    backgroundColor: Colors.transparent,
                                                                    context: context,
                                                                    builder: (context) {
                                                                      return Padding(
                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                        child: Container(
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
                                                                  ).then((value) => setState(() {}));
                                                                },
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  child: Image.asset(pageViewRecettesRecord.photoPrincipale!, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: const AlignmentDirectional(0.75, 0),
                                                      child: Material(
                                                        color: Colors.transparent,
                                                        elevation: 10,
                                                        shape: const CircleBorder(),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: ToggleIcon(
                                                            onPressed: () async {
                                                              final favorisRecettesElement = pageViewRecettesRecord.reference;
                                                              final favorisRecettesUpdate = currentUserDocument!.favorisRecettes!.toList().contains(favorisRecettesElement)
                                                                  ? FieldValue.arrayRemove([favorisRecettesElement])
                                                                  : FieldValue.arrayUnion([favorisRecettesElement]);
                                                              final usersUpdateData = {
                                                                'favorisRecettes': favorisRecettesUpdate,
                                                              };
                                                              await currentUserDocument!.reference!.update(usersUpdateData);
                                                            },
                                                            value: currentUserDocument!.favorisRecettes!.toList().contains(pageViewRecettesRecord.reference),
                                                            onIcon: const Icon(
                                                              Icons.favorite_sharp,
                                                              color: MizzUpTheme.primaryColor,
                                                              size: 20,
                                                            ),
                                                            offIcon: const Icon(
                                                              Icons.favorite_border,
                                                              color: MizzUpTheme.primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
                                                    child: Text(
                                                      pageViewRecettesRecord.titre!,
                                                      style: MizzUpTheme.bodyText1.override(
                                                        fontFamily: 'IBM',
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(0, 1),
                                        child: SmoothPageIndicator(
                                          controller: pageViewController ??= PageController(initialPage: min(0, pageViewRecettesRecordList.length - 1)),
                                          count: pageViewRecettesRecordList.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) {
                                            pageViewController!.animateToPage(
                                              i,
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: const SlideEffect(
                                            spacing: 8,
                                            radius: 16,
                                            dotWidth: 8,
                                            dotHeight: 8,
                                            dotColor: MizzUpTheme.secondaryColor,
                                            activeDotColor: MizzUpTheme.primaryColor,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 10, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Text(
                              'Catégories de recettes',
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: MizzUpTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 13, 10),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecetteSuiteWidget(
                                        recetteRef: RecetteRef.shampoing,
                                        recetteVisibleRef: RecetteRef.shampoingVisibleName,
                                        recetteListImages: RecetteRef.shampoingListImages,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Shampoing',
                                      style: MizzUpTheme.title1.override(
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontSize: 14,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: MizzUpTheme.primaryColor,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: MizzUpTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: Container(
                                width: double.infinity,
                                color: const Color(0x00000000),
                                child: ExpandableNotifier(
                                  initialExpanded: false,
                                  child: ExpandablePanel(
                                    header: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                      child: Text(
                                        'Masques',
                                        style: MizzUpTheme.title1.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          fontSize: 14,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                    collapsed: Container(),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => RecetteSuiteWidget(
                                                    recetteRef: RecetteRef.masqueHydratant,
                                                    recetteVisibleRef: RecetteRef.masqueHydratantVisibleName,
                                                    recetteListImages: RecetteRef.masqueHydratantListImages,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Hydratants',
                                                  style: MizzUpTheme.bodyText1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(50, 10, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => RecetteSuiteWidget(
                                                    recetteRef: RecetteRef.masqueNourissant,
                                                    recetteVisibleRef: RecetteRef.masqueNourissantVisibleName,
                                                    recetteListImages: RecetteRef.masqueNourissantListImages,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Nourissants',
                                                  style: MizzUpTheme.bodyText1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(50, 10, 0, 15),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => RecetteSuiteWidget(
                                                    recetteRef: RecetteRef.masqueProteine,
                                                    recetteVisibleRef: RecetteRef.masqueProteineVisibleName,
                                                    recetteListImages: RecetteRef.masqueProteineListImages,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Protéinés',
                                                  style: MizzUpTheme.bodyText1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    theme: const ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: true,
                                      tapBodyToCollapse: true,
                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                      expandIcon: Icons.arrow_forward_ios,
                                      collapseIcon: Icons.arrow_downward,
                                      iconSize: 24,
                                      iconColor: MizzUpTheme.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: MizzUpTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 13, 10),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecetteSuiteWidget(
                                      recetteRef: RecetteRef.gel,
                                      recetteVisibleRef: RecetteRef.gelVisibleName,
                                      recetteListImages: RecetteRef.gelListImages,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Gel',
                                    style: MizzUpTheme.title1.override(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: MizzUpTheme.primaryColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: MizzUpTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 13, 10),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecetteSuiteWidget(
                                      recetteRef: RecetteRef.leaveIn,
                                      recetteVisibleRef: RecetteRef.leaveInVisibleName,
                                      recetteListImages: RecetteRef.leaveInListImages,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Leave-in',
                                    style: MizzUpTheme.title1.override(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: MizzUpTheme.primaryColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: MizzUpTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 13, 10),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecetteSuiteWidget(
                                      recetteRef: RecetteRef.sprayLotion,
                                      recetteVisibleRef: RecetteRef.sprayLotionVisibleName,
                                      recetteListImages: RecetteRef.sprayLotionListImages,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Spray et Lotion',
                                    style: MizzUpTheme.title1.override(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: MizzUpTheme.primaryColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: MizzUpTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 13, 10),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecetteSuiteWidget(
                                      recetteRef: RecetteRef.rincage,
                                      recetteVisibleRef: RecetteRef.rincageVisibleName,
                                      recetteListImages: RecetteRef.rincageListImages,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Eau de rinçage',
                                    style: MizzUpTheme.title1.override(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: MizzUpTheme.primaryColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: MizzUpTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 13, 10),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecetteSuiteWidget(
                                      recetteRef: RecetteRef.gommage,
                                      recetteVisibleRef: RecetteRef.gommageVisibleName,
                                      recetteListImages: RecetteRef.gommageListImages,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Gommage',
                                    style: MizzUpTheme.title1.override(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: MizzUpTheme.primaryColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.7,
                                  child: const ConditionHygieneWidget(),
                                ),
                              );
                            },
                          );
                        },
                        text: 'Voir les conditions d\'hygiène',
                        options: MizzUpOptionButton(
                          width: 300,
                          height: 40,
                          color: MizzUpTheme.primaryColor,
                          textStyle: MizzUpTheme.subtitle1.override(
                            fontFamily: 'IBM',
                            color: Colors.white,
                            fontSize: 16,
                            useGoogleFonts: false,
                          ),
                          elevation: 5,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
