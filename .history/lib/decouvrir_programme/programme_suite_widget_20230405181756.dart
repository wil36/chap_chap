// ignore_for_file: unused_local_variable, avoid_print

import 'package:chap_chap/recettes/recetteRef.dart';
import 'package:chap_chap/recettes/recette_suite.dart';
import 'package:styled_text/styled_text.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../main.dart';
import '../articles/page_de_article_widget.dart';
import '../recettes/recette_suite2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgrammeSuiteWidget extends StatefulWidget {
  const ProgrammeSuiteWidget({
    Key? key,
    required this.detailsProg,
    required this.detailsWeek,
    required this.detailsProgUser,
    required this.date,
  }) : super(key: key);

  final ProgrammesRecord detailsProg;
  final DetailsWeekProgRecord detailsWeek;
  final ProgUserRecord detailsProgUser;
  final DateTime date;

  @override
  _ProgrammeSuiteWidgetState createState() => _ProgrammeSuiteWidgetState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class _ProgrammeSuiteWidgetState extends State<ProgrammeSuiteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord?>(
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
        final programmeSuiteUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: StreamBuilder<ProgrammesRecord?>(
            stream: ProgrammesRecord.getDocument(widget.detailsProg.reference!),
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
              final detailsProgProgrammesRecord = snapshot.data;
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: StreamBuilder<DetailsWeekProgRecord?>(
                  stream: DetailsWeekProgRecord.getDocument(widget.detailsWeek.reference!),
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
                    final detailsWeekDetailsWeekProgRecord = snapshot.data;
                    final lienPousse = detailsWeekDetailsWeekProgRecord!.texte1!.replaceAll('\\n', '\n');
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: StreamBuilder<ProgUserRecord?>(
                        stream: ProgUserRecord.getDocument(widget.detailsProgUser.reference!),
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
                          final detailsProgUserProgUserRecord = snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 40, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        MizzUpIconButton(
                                          borderColor: const Color(0x00FFFFFF),
                                          borderRadius: 30,
                                          buttonSize: 40,
                                          fillColor: MizzUpTheme.secondaryColor,
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            color: MizzUpTheme.primaryColor,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const NavBarPage(index: 2),
                                              ),
                                              (r) => false,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        MizzUpIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: const Icon(
                                            Icons.calendar_today,
                                            color: MizzUpTheme.primaryColor,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Text(
                                          dateTimeFormat('MMMMEEEEd', widget.date).capitalize(),
                                          style: MizzUpTheme.bodyText1.override(
                                            fontFamily: 'IBM',
                                            color: MizzUpTheme.primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-0.75, 0),
                                    child: Text(
                                      detailsProgProgrammesRecord!.titre!,
                                      textAlign: TextAlign.center,
                                      style: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'IBM',
                                        color: MizzUpTheme.primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height * 0.35,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          detailsProgProgrammesRecord.imagePrincipale!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                                      child: Text(
                                        'Aujourd’hui c’est ton jour de Wash day, voici les différentes étapes à suivre pour prendre soin de tes cheveux',
                                        style: MizzUpTheme.bodyText1.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: StreamBuilder<List<ArticlesRecord?>>(
                                      stream: queryArticlesRecord(
                                        queryBuilder: (articlesRecord) => articlesRecord.where('Titre', isEqualTo: 'Stimuler la pousse de ses cheveux grâce à la méthode de l\'inversion'),
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
                                        List<ArticlesRecord?> containerArticlesRecordList = snapshot.data!;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerArticlesRecord = containerArticlesRecordList.isNotEmpty ? containerArticlesRecordList.first : null;
                                        return Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                                alignment: const AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                  child: StyledText(
                                                    newLineAsBreaks: true,
                                                    text: lienPousse,
                                                    style: MizzUpTheme.bodyText1.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                                    tags: {
                                                      'g': StyledTextTag(
                                                          style: MizzUpTheme.bodyText1
                                                              .override(fontFamily: 'IBM', color: MizzUpTheme.primaryColor, useGoogleFonts: false, fontWeight: FontWeight.bold, fontSize: 12)),
                                                      'link': StyledTextActionTag(
                                                        (_, attrs) async => await Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PageDeArticleWidget(
                                                              detailArticle: containerArticlesRecord,
                                                            ),
                                                          ),
                                                          (willHandlePopInternally) => true,
                                                        ),
                                                        style: const TextStyle(decoration: TextDecoration.underline, color: MizzUpTheme.primaryColor, fontWeight: FontWeight.bold),
                                                      ),
                                                    },
                                                  ),
                                                )));
                                      },
                                    ),
                                  ),
                                  if (detailsWeekDetailsWeekProgRecord.titreEtape3!.startsWith(RegExp('Faire un gommage du cuir'))) ...{
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 50),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Facultatif : ',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.primaryColor,
                                                  fontWeight: FontWeight.w700,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                  child: Text(
                                                    detailsWeekDetailsWeekProgRecord.titreEtape3!,
                                                    style: MizzUpTheme.bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
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
                                                  text: 'Voir les gommages',
                                                  options: MizzUpOptionButton(
                                                    width: 200,
                                                    height: 40,
                                                    color: MizzUpTheme.secondaryColor,
                                                    textStyle: MizzUpTheme.subtitle2.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
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
                                    ),
                                  },
                                  StreamBuilder<RecettesRecord?>(
                                    stream: RecettesRecord.getDocument(detailsWeekDetailsWeekProgRecord.recette1!),
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
                                      final containerRecettesRecord = snapshot.data;
                                      return Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Visibility(
                                          visible: (containerRecettesRecord?.titre) != 'facultative',
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Étape 1 :',
                                                      style: MizzUpTheme.bodyText1.override(
                                                        fontFamily: 'IBM',
                                                        color: MizzUpTheme.primaryColor,
                                                        fontWeight: FontWeight.w700,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                        child: Text(
                                                          detailsWeekDetailsWeekProgRecord.titreEtape1!,
                                                          style: MizzUpTheme.bodyText1.override(
                                                            fontFamily: 'IBM',
                                                            fontWeight: FontWeight.w700,
                                                            useGoogleFonts: false,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment: const AlignmentDirectional(13.19, 0),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width,
                                                            height: MediaQuery.of(context).size.height * 0.34,
                                                            decoration: BoxDecoration(
                                                              color: const Color(0xFFEEEEEE),
                                                              borderRadius: BorderRadius.circular(20),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => RecetteSuite2Widget(
                                                                      description: containerRecettesRecord!.description!,
                                                                      dureePrepa: containerRecettesRecord.dureePrepa!,
                                                                      etapes: containerRecettesRecord.etapes!,
                                                                      listeIngredients: containerRecettesRecord.listeIngredients!,
                                                                      niveauDifficulte: containerRecettesRecord.niveauDifficulte!,
                                                                      photoPrincipale: containerRecettesRecord.photoPrincipale!,
                                                                      titre: containerRecettesRecord.titre!,
                                                                      nbIngredients: containerRecettesRecord.nbIngredients!,
                                                                      recetteRef: containerRecettesRecord.reference!,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(20),
                                                                child: Image.asset(
                                                                  containerRecettesRecord!.photoPrincipale!,
                                                                  width: MediaQuery.of(context).size.width,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: const AlignmentDirectional(0.85, 0),
                                                        child: Container(
                                                          width: 35,
                                                          height: 35,
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: ToggleIcon(
                                                            onPressed: () async {
                                                              final favorisRecettesElement = containerRecettesRecord.reference;
                                                              final favorisRecettesUpdate = programmeSuiteUsersRecord!.favorisRecettes!.toList().contains(favorisRecettesElement)
                                                                  ? FieldValue.arrayRemove([favorisRecettesElement])
                                                                  : FieldValue.arrayUnion([favorisRecettesElement]);
                                                              final usersUpdateData = {
                                                                'favorisRecettes': favorisRecettesUpdate,
                                                              };
                                                              await programmeSuiteUsersRecord.reference!.update(usersUpdateData);
                                                            },
                                                            value: programmeSuiteUsersRecord!.favorisRecettes!.toList().contains(containerRecettesRecord.reference),
                                                            onIcon: SvgPicture.asset(
                                                              'assets/profil/saved_recipe_full_icon.svg',
                                                              width: 20,
                                                              height: 20,
                                                              color: MizzUpTheme.primaryColor,
                                                            ),
                                                            offIcon: SvgPicture.asset(
                                                              'assets/profil/saved_recipe_icon.svg',
                                                              width: 20,
                                                              height: 20,
                                                              color: MizzUpTheme.primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                                  child: Text(
                                                    containerRecettesRecord.titre!,
                                                    style: MizzUpTheme.bodyText1.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => RecetteSuite2Widget(
                                                          description: containerRecettesRecord.description!,
                                                          dureePrepa: containerRecettesRecord.dureePrepa!,
                                                          etapes: containerRecettesRecord.etapes!,
                                                          listeIngredients: containerRecettesRecord.listeIngredients!,
                                                          niveauDifficulte: containerRecettesRecord.niveauDifficulte!,
                                                          photoPrincipale: containerRecettesRecord.photoPrincipale!,
                                                          titre: containerRecettesRecord.titre!,
                                                          nbIngredients: containerRecettesRecord.nbIngredients!,
                                                          recetteRef: containerRecettesRecord.reference!,
                                                        ),
                                                      ),
                                                      (willHandlePopInternally) => true,
                                                    );
                                                  },
                                                  text: 'Voir la recette',
                                                  options: MizzUpOptionButton(
                                                    width: 200,
                                                    height: 40,
                                                    color: MizzUpTheme.secondaryColor,
                                                    textStyle: MizzUpTheme.subtitle2.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                    child: StreamBuilder<RecettesRecord?>(
                                      stream: RecettesRecord.getDocument(detailsWeekDetailsWeekProgRecord.recette2!),
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
                                        final containerRecettesRecord = snapshot.data;
                                        return Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible: (containerRecettesRecord?.titre) != 'facultative',
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Étape 2 :',
                                                        style: MizzUpTheme.bodyText1.override(
                                                          fontFamily: 'IBM',
                                                          color: MizzUpTheme.primaryColor,
                                                          fontWeight: FontWeight.w700,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                          child: Text(
                                                            detailsWeekDetailsWeekProgRecord.titreEtape2!,
                                                            style: MizzUpTheme.bodyText1.override(
                                                              fontFamily: 'IBM',
                                                              fontWeight: FontWeight.w700,
                                                              useGoogleFonts: false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment: const AlignmentDirectional(13.19, 0),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width,
                                                              height: MediaQuery.of(context).size.height * 0.34,
                                                              decoration: BoxDecoration(
                                                                color: const Color(0xFFEEEEEE),
                                                                borderRadius: BorderRadius.circular(20),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  await Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) => RecetteSuite2Widget(
                                                                        description: containerRecettesRecord!.description!,
                                                                        dureePrepa: containerRecettesRecord.dureePrepa!,
                                                                        etapes: containerRecettesRecord.etapes!,
                                                                        listeIngredients: containerRecettesRecord.listeIngredients!,
                                                                        niveauDifficulte: containerRecettesRecord.niveauDifficulte!,
                                                                        photoPrincipale: containerRecettesRecord.photoPrincipale!,
                                                                        titre: containerRecettesRecord.titre!,
                                                                        nbIngredients: containerRecettesRecord.nbIngredients!,
                                                                        recetteRef: containerRecettesRecord.reference!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  child: Image.asset(
                                                                    containerRecettesRecord!.photoPrincipale!,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    height: 100,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: const AlignmentDirectional(0.85, 0),
                                                          child: Container(
                                                            width: 35,
                                                            height: 35,
                                                            decoration: const BoxDecoration(
                                                              color: Colors.white,
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: ToggleIcon(
                                                              onPressed: () async {
                                                                final favorisRecettesElement = containerRecettesRecord.reference;
                                                                final favorisRecettesUpdate = programmeSuiteUsersRecord!.favorisRecettes!.toList().contains(favorisRecettesElement)
                                                                    ? FieldValue.arrayRemove([favorisRecettesElement])
                                                                    : FieldValue.arrayUnion([favorisRecettesElement]);
                                                                final usersUpdateData = {
                                                                  'favorisRecettes': favorisRecettesUpdate,
                                                                };
                                                                await programmeSuiteUsersRecord.reference!.update(usersUpdateData);
                                                              },
                                                              value: programmeSuiteUsersRecord!.favorisRecettes!.toList().contains(containerRecettesRecord.reference),
                                                              onIcon: SvgPicture.asset(
                                                                'assets/profil/saved_recipe_full_icon.svg',
                                                                width: 20,
                                                                height: 20,
                                                                color: MizzUpTheme.primaryColor,
                                                              ),
                                                              offIcon: SvgPicture.asset(
                                                                'assets/profil/saved_recipe_icon.svg',
                                                                width: 20,
                                                                height: 20,
                                                                color: MizzUpTheme.primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                                    child: Text(
                                                      containerRecettesRecord.titre!,
                                                      style: MizzUpTheme.bodyText1.override(
                                                        fontFamily: 'IBM',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => RecetteSuite2Widget(
                                                            description: containerRecettesRecord.description!,
                                                            dureePrepa: containerRecettesRecord.dureePrepa!,
                                                            etapes: containerRecettesRecord.etapes!,
                                                            listeIngredients: containerRecettesRecord.listeIngredients!,
                                                            niveauDifficulte: containerRecettesRecord.niveauDifficulte!,
                                                            photoPrincipale: containerRecettesRecord.photoPrincipale!,
                                                            titre: containerRecettesRecord.titre!,
                                                            nbIngredients: containerRecettesRecord.nbIngredients!,
                                                            recetteRef: containerRecettesRecord.reference!,
                                                          ),
                                                        ),
                                                        (willHandlePopInternally) => true,
                                                      );
                                                    },
                                                    text: 'Voir la recette',
                                                    options: MizzUpOptionButton(
                                                      width: 200,
                                                      height: 40,
                                                      color: MizzUpTheme.secondaryColor,
                                                      textStyle: MizzUpTheme.subtitle2.override(
                                                        fontFamily: 'IBM',
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                      borderSide: const BorderSide(
                                                        color: Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                    child: StreamBuilder<RecettesRecord?>(
                                      stream: RecettesRecord.getDocument(detailsWeekDetailsWeekProgRecord.recette3!),
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
                                        final containerRecettesRecord = snapshot.data;
                                        return Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible: (containerRecettesRecord?.titre) != 'facultative',
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Facultatif : ',
                                                        style: MizzUpTheme.bodyText1.override(
                                                          fontFamily: 'IBM',
                                                          color: MizzUpTheme.primaryColor,
                                                          fontWeight: FontWeight.w700,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                          child: Text(
                                                            detailsWeekDetailsWeekProgRecord.titreEtape3!,
                                                            style: MizzUpTheme.bodyText1.override(
                                                              fontFamily: 'IBM',
                                                              fontWeight: FontWeight.w700,
                                                              useGoogleFonts: false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment: const AlignmentDirectional(13.19, 0),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width,
                                                              height: MediaQuery.of(context).size.height * 0.34,
                                                              decoration: BoxDecoration(
                                                                color: const Color(0xFFEEEEEE),
                                                                borderRadius: BorderRadius.circular(20),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  await Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) => RecetteSuite2Widget(
                                                                        description: containerRecettesRecord!.description!,
                                                                        dureePrepa: containerRecettesRecord.dureePrepa!,
                                                                        etapes: containerRecettesRecord.etapes!,
                                                                        listeIngredients: containerRecettesRecord.listeIngredients!,
                                                                        niveauDifficulte: containerRecettesRecord.niveauDifficulte!,
                                                                        photoPrincipale: containerRecettesRecord.photoPrincipale!,
                                                                        titre: containerRecettesRecord.titre!,
                                                                        nbIngredients: containerRecettesRecord.nbIngredients!,
                                                                        recetteRef: containerRecettesRecord.reference!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  child: Image.asset(
                                                                    containerRecettesRecord!.photoPrincipale!,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    height: 100,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: const AlignmentDirectional(0.85, 0),
                                                          child: Container(
                                                            width: 35,
                                                            height: 35,
                                                            decoration: const BoxDecoration(
                                                              color: Colors.white,
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: ToggleIcon(
                                                              onPressed: () async {
                                                                final favorisRecettesElement = containerRecettesRecord.reference;
                                                                final favorisRecettesUpdate = programmeSuiteUsersRecord!.favorisRecettes!.toList().contains(favorisRecettesElement)
                                                                    ? FieldValue.arrayRemove([favorisRecettesElement])
                                                                    : FieldValue.arrayUnion([favorisRecettesElement]);
                                                                final usersUpdateData = {
                                                                  'favorisRecettes': favorisRecettesUpdate,
                                                                };
                                                                await programmeSuiteUsersRecord.reference!.update(usersUpdateData);
                                                              },
                                                              value: programmeSuiteUsersRecord!.favorisRecettes!.toList().contains(containerRecettesRecord.reference),
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                                    child: Text(
                                                      containerRecettesRecord.titre!,
                                                      style: MizzUpTheme.bodyText1.override(
                                                        fontFamily: 'IBM',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => RecetteSuite2Widget(
                                                            description: containerRecettesRecord.description!,
                                                            dureePrepa: containerRecettesRecord.dureePrepa!,
                                                            etapes: containerRecettesRecord.etapes!,
                                                            listeIngredients: containerRecettesRecord.listeIngredients!,
                                                            niveauDifficulte: containerRecettesRecord.niveauDifficulte!,
                                                            photoPrincipale: containerRecettesRecord.photoPrincipale!,
                                                            titre: containerRecettesRecord.titre!,
                                                            nbIngredients: containerRecettesRecord.nbIngredients!,
                                                            recetteRef: containerRecettesRecord.reference!,
                                                          ),
                                                        ),
                                                        (willHandlePopInternally) => true,
                                                      );
                                                    },
                                                    text: 'Voir la recette',
                                                    options: MizzUpOptionButton(
                                                      width: 200,
                                                      height: 40,
                                                      color: MizzUpTheme.secondaryColor,
                                                      textStyle: MizzUpTheme.subtitle2.override(
                                                        fontFamily: 'IBM',
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                      borderSide: const BorderSide(
                                                        color: Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (detailsWeekDetailsWeekProgRecord.titreEtape3!.startsWith(RegExp('Si tes cheveux'))) ...{
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 50),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Facultatif : ',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.primaryColor,
                                                  fontWeight: FontWeight.w700,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                  child: Text(
                                                    detailsWeekDetailsWeekProgRecord.titreEtape3!,
                                                    style: MizzUpTheme.bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
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
                                                  text: 'Voir les masques',
                                                  options: MizzUpOptionButton(
                                                    width: 200,
                                                    height: 40,
                                                    color: MizzUpTheme.secondaryColor,
                                                    textStyle: MizzUpTheme.subtitle2.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
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
                                    ),
                                  },
                                  if (detailsWeekDetailsWeekProgRecord.texte2!.startsWith(RegExp('Pour rafraîchir'))) ...{
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 50),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Facultatif : ',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.primaryColor,
                                                  fontWeight: FontWeight.w700,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                  child: Text(
                                                    detailsWeekDetailsWeekProgRecord.titreEtape3!,
                                                    style: MizzUpTheme.bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
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
                                                  text: 'Voir les Spray',
                                                  options: MizzUpOptionButton(
                                                    width: 200,
                                                    height: 40,
                                                    color: MizzUpTheme.secondaryColor,
                                                    textStyle: MizzUpTheme.subtitle2.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
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
                                    ),
                                  },
                                  if (detailsWeekDetailsWeekProgRecord.texte2!.startsWith(RegExp('Pour styliser'))) ...{
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 50),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Facultatif : ',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.primaryColor,
                                                  fontWeight: FontWeight.w700,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                  child: Text(
                                                    detailsWeekDetailsWeekProgRecord.titreEtape3!,
                                                    style: MizzUpTheme.bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
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
                                                  text: 'Voir les Leave-In',
                                                  options: MizzUpOptionButton(
                                                    width: 200,
                                                    height: 40,
                                                    color: MizzUpTheme.secondaryColor,
                                                    textStyle: MizzUpTheme.subtitle2.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
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
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
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
                                                  text: 'Voir les Gels',
                                                  options: MizzUpOptionButton(
                                                    width: 200,
                                                    height: 40,
                                                    color: MizzUpTheme.secondaryColor,
                                                    textStyle: MizzUpTheme.subtitle2.override(
                                                      fontFamily: 'IBM',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
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
                                    ),
                                  },
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 100),
                                    child: Text(
                                      detailsWeekDetailsWeekProgRecord.texte2!,
                                      style: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'IBM',
                                        color: const Color(0xFF080808),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                    ),
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
              );
            },
          ),
        );
      },
    );
  }
}
