// ignore_for_file: file_names

import 'package:chap_chap/backend/schema/alternatives.dart';
import 'package:chap_chap/components/nouveau_programme_widget.dart';
import 'package:chap_chap/decouvrir_programme/list_ingredients_widget.dart';
import 'package:chap_chap/recettes/recetteRef.dart';
import 'package:chap_chap/recettes/recette_suite.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
import 'package:styled_text/styled_text.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

class StartProgWidget extends StatefulWidget {
  const StartProgWidget({
    Key? key,
    this.detailsProgramme,
  }) : super(key: key);

  final ProgrammesRecord? detailsProgramme;

  @override
  _StartProgWidgetState createState() => _StartProgWidgetState();
}

class _StartProgWidgetState extends State<StartProgWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Alternative> alternatives = [];
  void _openLink(BuildContext context, Map<String?, String?> attrs) async {
    final String? link = attrs['href'];

    await launchURL('$link');
  }

  void _openLink2(BuildContext context, Map<String?, String?> attrs) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecetteSuiteWidget(
            recetteRef: RecetteRef.gommage,
            recetteVisibleRef: RecetteRef.gommageVisibleName,
            recetteListImages: RecetteRef.gommageListImages,
          ),
        ));
  }

  Future<List<Alternative>> getAlternativesForRecipe(String recipeId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('programmes')
        .doc(recipeId)
        .get();

    List<Alternative> alternatives = List<Alternative>.from(
        (querySnapshot.data()!['alternatives'] as List<dynamic>)
            .map((e) => Alternative.fromJson(e)));

    return alternatives;
  }

  @override
  void initState() {
    getAlternativesForRecipe(widget.detailsProgramme!.reference!.id)
        .then((value) {
      setState(() {
        alternatives = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: StreamBuilder<ProgrammesRecord?>(
        stream:
            ProgrammesRecord.getDocument(widget.detailsProgramme!.reference!),
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
          final columnProgrammesRecord = snapshot.data!;

          final textAvantages =
              columnProgrammesRecord.commentPasse!.replaceAll('\\n', '\n');
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: MizzUpTheme.tertiaryColor,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: MizzUpIconButton(
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
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  35, 0, 0, 20),
                              child: Text(
                                'Mon Programme',
                                style: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  useGoogleFonts: false,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.17,
                            decoration: const BoxDecoration(
                              color: Color(0x00EEEEEE),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.network(
                                valueOrDefault<String?>(
                                  columnProgrammesRecord.imagePrincipale,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/5e2nvdue9k2r/Capture%20d%E2%80%99e%CC%81cran%202021-12-18%20a%CC%80%2015.53.37.png',
                                )!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(35, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Bienvenue sur le ${columnProgrammesRecord.titre!}',
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                useGoogleFonts: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 20, 20, 0),
                          child: StyledText(
                            newLineAsBreaks: true,
                            text: columnProgrammesRecord.intro!,
                            style: MizzUpTheme.bodyText1.override(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'IBM',
                              useGoogleFonts: false,
                            ),
                            tags: {
                              's': StyledTextTag(
                                style: MizzUpTheme.bodyText1.override(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'IBM',
                                  useGoogleFonts: false,
                                ),
                              ),
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 20, 20, 0),
                          child: Text(
                            'Comment ça se passe ?',
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 20, 20, 0),
                          child: StyledText(
                            newLineAsBreaks: true,
                            text: textAvantages,
                            style: MizzUpTheme.bodyText1.override(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'IBM',
                              useGoogleFonts: false,
                            ),
                            tags: {
                              's': StyledTextTag(
                                style: MizzUpTheme.bodyText1.override(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'IBM',
                                  useGoogleFonts: false,
                                ),
                              ),
                              'link': StyledTextActionTag(
                                (_, attrs) => _openLink2(context, attrs),
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: MizzUpTheme.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              'gras': StyledTextTag(
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: MizzUpTheme.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 20, 20, 0),
                          child: Text(
                            'Prêt(e) à commencer le programme ?',
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 20, 20, 0),
                          child: Text(
                            'Il ne te reste plus qu’à consulter la liste des ingrédients dont tu as besoin pour commencer !',
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 40, 20, 20),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListIngredientsWidget(
                                      progRef: columnProgrammesRecord),
                                ),
                              );
                            },
                            text: "Voir la liste des ingrédients",
                            options: MizzUpOptionButton(
                              width: 250,
                              height: 40,
                              color: MizzUpTheme.secondaryColor,
                              textStyle: MizzUpTheme.subtitle2.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
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
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 20),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      child: NouveauProgrammeWidget(
                                        detailsProg: columnProgrammesRecord,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            text: 'Commencer',
                            options: MizzUpOptionButton(
                              width: 250,
                              height: 40,
                              color: MizzUpTheme.primaryColor,
                              textStyle: MizzUpTheme.subtitle2.override(
                                fontFamily: 'IBM',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                      ),
                      if (columnProgrammesRecord.titre ==
                          'Programme Pousse') ...{
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                35, 20, 20, 0),
                            child: StyledText(
                              text:
                                  '<bold>N.B :</bold> Pour encore plus de résultats, nous te recommandons de faire une cure de <gras><link href="https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE">Madame la Présidente</link></gras> en complément de ce programme.\n\n<bold>Code promo : -10% sur la cure de ton choix avec le code CHAPCHAP (valable uniquement sur le site de Madame La Présidente).</bold>',
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                useGoogleFonts: false,
                              ),
                              tags: {
                                'gras': StyledTextTag(
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: MizzUpTheme.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                // ignore: equal_keys_in_map
                                'link': StyledTextActionTag(
                                  (_, attrs) => _openLink(context, attrs),
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: MizzUpTheme.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                'bold': StyledTextTag(
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 30, 0, 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
                                },
                                child: Image.asset(
                                  'assets/images/madamePresidenteLogo.png',
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
                                },
                                child: Image.asset(
                                  'assets/images/gummies.png',
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
                                },
                                child: Image.asset(
                                  'assets/images/complementsMLP.png',
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      },
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 20, 20, 0),
                          child: Text(
                            'On sait qu’il y a surement des semaines où tu n’auras peut-être pas la motivation de te lancer dans des recettes mais ne t’inquiète pas on a sélectionné les meilleurs produits tout prêts pour ces moment-là :',
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsetsDirectional.fromSTEB(35, 0, 0, 50),
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               0, 0, 20, 0),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               if (columnProgrammesRecord
                      //                   .photoRecette1!.isNotEmpty)
                      //                 InkWell(
                      //                   onTap: () async {
                      //                     await launchURL(columnProgrammesRecord
                      //                         .lienPhoto1!);
                      //                   },
                      //                   child: Image.network(
                      //                     columnProgrammesRecord.photoRecette1!,
                      //                     fit: BoxFit.cover,
                      //                     width: 100,
                      //                     height: 100,
                      //                   ),
                      //                 ),
                      //               if (columnProgrammesRecord
                      //                   .lienRecette1!.isNotEmpty)
                      //                 Padding(
                      //                   padding: const EdgeInsetsDirectional
                      //                       .fromSTEB(0, 10, 0, 20),
                      //                   child: StyledText(
                      //                     newLineAsBreaks: true,
                      //                     text: columnProgrammesRecord
                      //                         .lienRecette1!,
                      //                     style: MizzUpTheme.bodyText1.override(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'IBM',
                      //                       useGoogleFonts: false,
                      //                     ),
                      //                     tags: {
                      //                       's': StyledTextTag(
                      //                         style: MizzUpTheme.bodyText1
                      //                             .override(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.w400,
                      //                           fontFamily: 'IBM',
                      //                           useGoogleFonts: false,
                      //                         ),
                      //                       ),
                      //                       'link': StyledTextActionTag(
                      //                         (_, attrs) =>
                      //                             _openLink(context, attrs),
                      //                         style: const TextStyle(
                      //                             decoration:
                      //                                 TextDecoration.underline,
                      //                             color:
                      //                                 MizzUpTheme.primaryColor,
                      //                             fontWeight: FontWeight.bold),
                      //                       ),
                      //                     },
                      //                   ),
                      //                 ),
                      //             ],
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               0, 0, 20, 0),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               if (columnProgrammesRecord
                      //                   .photoRecette2!.isNotEmpty)
                      //                 InkWell(
                      //                   onTap: () async {
                      //                     await launchURL(columnProgrammesRecord
                      //                         .lienPhoto2!);
                      //                   },
                      //                   child: Image.network(
                      //                     columnProgrammesRecord.photoRecette2!,
                      //                     fit: BoxFit.cover,
                      //                     width: 100,
                      //                     height: 100,
                      //                   ),
                      //                 ),
                      //               if (columnProgrammesRecord
                      //                   .lienRecette2!.isNotEmpty)
                      //                 Padding(
                      //                   padding: const EdgeInsetsDirectional
                      //                       .fromSTEB(0, 10, 0, 20),
                      //                   child: StyledText(
                      //                     newLineAsBreaks: true,
                      //                     text: columnProgrammesRecord
                      //                         .lienRecette2!,
                      //                     style: MizzUpTheme.bodyText1.override(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'IBM',
                      //                       useGoogleFonts: false,
                      //                     ),
                      //                     tags: {
                      //                       's': StyledTextTag(
                      //                         style: MizzUpTheme.bodyText1
                      //                             .override(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.w400,
                      //                           fontFamily: 'IBM',
                      //                           useGoogleFonts: false,
                      //                         ),
                      //                       ),
                      //                       'link': StyledTextActionTag(
                      //                         (_, attrs) =>
                      //                             _openLink(context, attrs),
                      //                         style: const TextStyle(
                      //                             decoration:
                      //                                 TextDecoration.underline,
                      //                             color:
                      //                                 MizzUpTheme.primaryColor,
                      //                             fontWeight: FontWeight.bold),
                      //                       ),
                      //                     },
                      //                   ),
                      //                 ),
                      //             ],
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               0, 0, 20, 0),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               if (columnProgrammesRecord
                      //                   .photoRecette3!.isNotEmpty)
                      //                 InkWell(
                      //                   onTap: () async {
                      //                     await launchURL(columnProgrammesRecord
                      //                         .lienPhoto3!);
                      //                   },
                      //                   child: Image.network(
                      //                     columnProgrammesRecord.photoRecette3!,
                      //                     fit: BoxFit.cover,
                      //                     width: 100,
                      //                     height: 100,
                      //                   ),
                      //                 ),
                      //               if (columnProgrammesRecord
                      //                   .lienRecette3!.isNotEmpty)
                      //                 Padding(
                      //                   padding: const EdgeInsetsDirectional
                      //                       .fromSTEB(0, 10, 0, 20),
                      //                   child: StyledText(
                      //                     newLineAsBreaks: true,
                      //                     text: columnProgrammesRecord
                      //                         .lienRecette3!,
                      //                     style: MizzUpTheme.bodyText1.override(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'IBM',
                      //                       useGoogleFonts: false,
                      //                     ),
                      //                     tags: {
                      //                       's': StyledTextTag(
                      //                         style: MizzUpTheme.bodyText1
                      //                             .override(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.w400,
                      //                           fontFamily: 'IBM',
                      //                           useGoogleFonts: false,
                      //                         ),
                      //                       ),
                      //                       'link': StyledTextActionTag(
                      //                         (_, attrs) =>
                      //                             _openLink(context, attrs),
                      //                         style: const TextStyle(
                      //                             decoration:
                      //                                 TextDecoration.underline,
                      //                             color:
                      //                                 MizzUpTheme.primaryColor,
                      //                             fontWeight: FontWeight.bold),
                      //                       ),
                      //                     },
                      //                   ),
                      //                 ),
                      //             ],
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               0, 0, 20, 0),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               if (columnProgrammesRecord
                      //                   .photoRecette4!.isNotEmpty)
                      //                 InkWell(
                      //                   onTap: () async {
                      //                     await launchURL(columnProgrammesRecord
                      //                         .lienPhoto4!);
                      //                   },
                      //                   child: Image.network(
                      //                     columnProgrammesRecord.photoRecette4!,
                      //                     fit: BoxFit.cover,
                      //                     width: 100,
                      //                     height: 100,
                      //                   ),
                      //                 ),
                      //               if (columnProgrammesRecord
                      //                   .lienRecette4!.isNotEmpty)
                      //                 Padding(
                      //                   padding: const EdgeInsetsDirectional
                      //                       .fromSTEB(0, 10, 0, 20),
                      //                   child: StyledText(
                      //                     newLineAsBreaks: true,
                      //                     text: columnProgrammesRecord
                      //                         .lienRecette4!,
                      //                     style: MizzUpTheme.bodyText1.override(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'IBM',
                      //                       useGoogleFonts: false,
                      //                     ),
                      //                     tags: {
                      //                       's': StyledTextTag(
                      //                         style: MizzUpTheme.bodyText1
                      //                             .override(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.w400,
                      //                           fontFamily: 'IBM',
                      //                           useGoogleFonts: false,
                      //                         ),
                      //                       ),
                      //                       'link': StyledTextActionTag(
                      //                         (_, attrs) =>
                      //                             _openLink(context, attrs),
                      //                         style: const TextStyle(
                      //                             decoration:
                      //                                 TextDecoration.underline,
                      //                             color:
                      //                                 MizzUpTheme.primaryColor,
                      //                             fontWeight: FontWeight.bold),
                      //                       ),
                      //                     },
                      //                   ),
                      //                 ),
                      //             ],
                      //           ),
                      //         ),
                      //         Column(
                      //           mainAxisSize: MainAxisSize.max,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             if (columnProgrammesRecord
                      //                 .photoRecette5!.isNotEmpty)
                      //               InkWell(
                      //                 onTap: () async {
                      //                   await launchURL(
                      //                       columnProgrammesRecord.lienPhoto5!);
                      //                 },
                      //                 child: Image.network(
                      //                   columnProgrammesRecord.photoRecette5!,
                      //                   fit: BoxFit.cover,
                      //                   width: 100,
                      //                   height: 100,
                      //                 ),
                      //               ),
                      //             if (columnProgrammesRecord
                      //                 .lienRecette5!.isNotEmpty)
                      //               Padding(
                      //                 padding:
                      //                     const EdgeInsetsDirectional.fromSTEB(
                      //                         0, 10, 0, 20),
                      //                 child: StyledText(
                      //                   newLineAsBreaks: true,
                      //                   text: columnProgrammesRecord
                      //                       .lienRecette5!,
                      //                   style: MizzUpTheme.bodyText1.override(
                      //                     fontSize: 14,
                      //                     fontWeight: FontWeight.w400,
                      //                     fontFamily: 'IBM',
                      //                     useGoogleFonts: false,
                      //                   ),
                      //                   tags: {
                      //                     's': StyledTextTag(
                      //                       style:
                      //                           MizzUpTheme.bodyText1.override(
                      //                         fontSize: 14,
                      //                         fontWeight: FontWeight.w400,
                      //                         fontFamily: 'IBM',
                      //                         useGoogleFonts: false,
                      //                       ),
                      //                     ),
                      //                     'link': StyledTextActionTag(
                      //                       (_, attrs) =>
                      //                           _openLink(context, attrs),
                      //                       style: const TextStyle(
                      //                           decoration:
                      //                               TextDecoration.underline,
                      //                           color: MizzUpTheme.primaryColor,
                      //                           fontWeight: FontWeight.bold),
                      //                     ),
                      //                   },
                      //                 ),
                      //               ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Container(
                          margin: const EdgeInsets.only(
                              left: 30, bottom: 20, top: 20),
                          child: Text('Alternatives',
                              textAlign: TextAlign.start,
                              style: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  useGoogleFonts: false,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18))),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: alternatives.map((alternative) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: MyClickableCard(
                                  imageUrl: alternative.image!,
                                  externalLink: alternative.link!,
                                  title: alternative.name!,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
