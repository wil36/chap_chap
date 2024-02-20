// ignore_for_file: avoid_print, deprecated_member_use

import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_choice_chips.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_text/styled_text.dart';

import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';

class RecetteSuite2Widget extends StatefulWidget {
  const RecetteSuite2Widget({
    Key? key,
    required this.description,
    required this.dureePrepa,
    required this.etapes,
    required this.listeIngredients,
    required this.niveauDifficulte,
    required this.photoPrincipale,
    required this.titre,
    required this.nbIngredients,
    required this.recetteRef,
  }) : super(key: key);

  final String description;
  final int dureePrepa;
  final String etapes;
  final String listeIngredients;
  final String niveauDifficulte;
  final String photoPrincipale;
  final String titre;
  final int nbIngredients;
  final DocumentReference recetteRef;

  @override
  _RecetteSuite2WidgetState createState() => _RecetteSuite2WidgetState();
}

class _RecetteSuite2WidgetState extends State<RecetteSuite2Widget> {
  String? choiceChipsValue;
  String etape = 'Étape';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;

  void _openLink(BuildContext context, Map<String?, String?> attrs) async {
    final String? link = attrs['href'];

    await launchURL('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                color: Color(0x00B77E65),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x00B77E65),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      child: Image.asset(
                        widget.photoPrincipale,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.85, -0.6),
                    child: MizzUpIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: MizzUpTheme.secondaryColor,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: MizzUpTheme.tertiaryColor,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.85, -0.6),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ToggleIcon(
                        onPressed: () async {
                          final favorisRecettesElement = widget.recetteRef;
                          final favorisRecettesUpdate = currentUserDocument!.favorisRecettes!.toList().contains(favorisRecettesElement)
                              ? FieldValue.arrayRemove([favorisRecettesElement])
                              : FieldValue.arrayUnion([favorisRecettesElement]);
                          final usersUpdateData = {
                            'favorisRecettes': favorisRecettesUpdate,
                          };
                          await widget.recetteRef.update(usersUpdateData);
                        },
                        value: currentUserDocument!.favorisRecettes!.toList().contains(widget.recetteRef),
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
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 30, 0),
                child: Text(
                  widget.titre,
                  style: MizzUpTheme.bodyText1.override(
                    fontFamily: 'IBM',
                    color: MizzUpTheme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MizzUpIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: const FaIcon(
                              FontAwesomeIcons.clock,
                              color: MizzUpTheme.tertiaryColor,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Text(
                            '${widget.dureePrepa.toString()} minutes',
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MizzUpIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: const FaIcon(
                              FontAwesomeIcons.solidCalendarAlt,
                              color: MizzUpTheme.tertiaryColor,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          if (widget.nbIngredients == 0) ...{
                            Text(
                              'À consommer tout de suite',
                              textAlign: TextAlign.center,
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                            ),
                          } else if (widget.nbIngredients == 1) ...{
                            Text(
                              '${widget.nbIngredients.toString()} jour de conservation',
                              textAlign: TextAlign.center,
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                            ),
                          } else if (widget.nbIngredients == 100) ...{
                            Text(
                              '1 semaine au réfrigérateur à 3 mois (si cosgard)',
                              textAlign: TextAlign.center,
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                            ),
                          } else ...{
                            Text(
                              '${widget.nbIngredients.toString()} jours de conservation',
                              textAlign: TextAlign.center,
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                            ),
                          }
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MizzUpIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: const Icon(
                              Icons.trending_up,
                              color: MizzUpTheme.tertiaryColor,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Text(
                            widget.niveauDifficulte,
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 0),
                child: Text(
                  widget.description,
                  style: MizzUpTheme.bodyText1.override(
                    fontFamily: 'IBM',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 0, 0),
              child: Container(
                width: 235,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ChoiceChipMizzup(
                        initialOption: choiceChipsValue ??= 'Ingrédients',
                        options: const [ChipData('Ingrédients'), ChipData('Recette')],
                        onChanged: (val) => setState(() => choiceChipsValue = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: MizzUpTheme.primaryColor,
                          textStyle: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            color: Colors.white,
                            useGoogleFonts: false,
                            fontSize: 16,
                          ),
                          iconColor: Colors.white,
                          iconSize: 18,
                          elevation: 4,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: MizzUpTheme.secondaryColor,
                          textStyle: MizzUpTheme.bodyText2.override(
                            fontFamily: 'IBM',
                            color: const Color(0xFF262D34),
                            useGoogleFonts: false,
                            fontSize: 16,
                          ),
                          iconColor: const Color(0xFF262D34),
                          iconSize: 18,
                          elevation: 4,
                        ),
                        chipSpacing: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if ((choiceChipsValue) == 'Ingrédients')
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 0, 50),
                  child: StyledText(
                    // newLineAsBreaks: true,
                    text: widget.listeIngredients,
                    style: MizzUpTheme.bodyText1.override(fontFamily: 'IBM', color: Colors.black, useGoogleFonts: false, fontWeight: FontWeight.w400, fontSize: 13),
                    tags: {
                      'link': StyledTextActionTag(
                        (_, attrs) => _openLink(context, attrs),
                        style: const TextStyle(decoration: TextDecoration.underline, color: MizzUpTheme.primaryColor, fontWeight: FontWeight.bold),
                      ),
                    },
                  ),
                ),
              ),
            if ((choiceChipsValue) == 'Recette')
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 0, 50),
                  child: StyledText(
                    newLineAsBreaks: true,
                    text: widget.etapes,
                    style: MizzUpTheme.bodyText1.override(fontFamily: 'IBM', color: Colors.black, useGoogleFonts: false, fontWeight: FontWeight.w400, fontSize: 13),
                    tags: {
                      'bold':
                          StyledTextTag(style: MizzUpTheme.bodyText1.override(fontFamily: 'IBM', color: MizzUpTheme.primaryColor, useGoogleFonts: false, fontWeight: FontWeight.bold, fontSize: 15)),
                      'link': StyledTextActionTag(
                        (_, attrs) => _openLink(context, attrs),
                      ),
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
