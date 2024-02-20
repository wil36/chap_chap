// ignore_for_file: avoid_print, deprecated_member_use

import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/recettes/leave_comment.dart';
import 'package:flutter_svg/svg.dart';
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
  String message = '';

  int index = 0;
  Future<QuerySnapshot<Map<String, dynamic>>> getUsersWithFavRecipe = getUsersWithFavorisRecipe();

  void _openLink(BuildContext context, Map<String?, String?> attrs) async {
    final String? link = attrs['href'];

    await launchURL('$link');
  }

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          headerRecette(),
          Expanded(
            child: Container(
              child: Padding(padding: EdgeInsets.only(right: 0), child: bodyRecette()),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerRecette() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Image.asset(
            widget.photoPrincipale,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
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
            Padding(
              padding: EdgeInsets.only(right: 20),
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
                    setState(() {});
                  },
                  value: currentUserDocument!.favorisRecettes!.toList().contains(widget.recetteRef),
                  onIcon: SvgPicture.asset(
                    'assets/profil/saved_recipe_full_icon.svg',
                    width: 20,
                    height: 20,
                  ),
                  offIcon: SvgPicture.asset(
                    'assets/profil/saved_recipe_icon.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget bodyRecette() {
    return ListView(
      shrinkWrap: true,
      children: [
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
                      Text(
                        message,
                        textAlign: TextAlign.center,
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
        Container(
          margin: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
          child: FutureBuilder(
            future: getUsersWithFavRecipe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int likesCounter = 0;
                List<String> usersInitials = [];
                QuerySnapshot<Map<String, dynamic>> docs = snapshot.data!;
                List<DocumentSnapshot<Map<String, dynamic>>> documents = docs.docs;
                for (DocumentSnapshot<Map<String, dynamic>> document in documents) {
                  if (document.data()!['favorisRecettes'].contains(widget.recetteRef)) {
                    likesCounter++;
                    var firstInitial;
                    var secondInitial;
                    if (document.data()!.containsKey('Prenom') && document.data()!['Prenom'] != '') {
                      firstInitial = document.data()!['Prenom'][0].toString().toUpperCase();
                    } else {
                      firstInitial = 'L';
                    }
                    if (document.data()!.containsKey('Nom') && document.data()!['Nom'] != '') {
                      secondInitial = document.data()!['Nom'][0].toString().toUpperCase();
                    } else {
                      secondInitial = 'L';
                    }
                    if (usersInitials.length < 3) {
                      usersInitials.add(firstInitial + secondInitial);
                    }
                  }
                }
                return likesCounter == 0
                    ? SizedBox()
                    : Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            height: 25,
                            child: Stack(
                              children: [
                                for (String userInitial in usersInitials)
                                  Positioned(
                                    left: (usersInitials.indexOf(userInitial) * 15),
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: MizzUpTheme.primaryColor,
                                          width: 1,
                                        ),
                                        color: MizzUpTheme.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          userInitial,
                                          style: MizzUpTheme.bodyText1.override(
                                            color: Colors.white,
                                            fontFamily: 'IBM',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Text(
                            '+ $likesCounter likes',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'IBM',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                // ID non trouvé dans aucun document
              } else if (snapshot.hasError) {
                // Gestion de l'erreur
                return Text('Erreur: ${snapshot.error}');
              }
              // Chargement des données
              return Container(width: 50, height: 50, child: Center(child: CircularProgressIndicator()));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 0, 0),
          child: Container(
            width: 235,
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
        Align(
          alignment: const AlignmentDirectional(-1, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 20, 50),
            child: StyledText(
              newLineAsBreaks: true,
              text: (choiceChipsValue) == 'Ingrédients' ? widget.listeIngredients : widget.etapes,
              style: MizzUpTheme.bodyText1.override(fontFamily: 'IBM', color: Colors.black, useGoogleFonts: false, fontWeight: FontWeight.w400, fontSize: 13),
              tags: {
                'bold': StyledTextTag(style: MizzUpTheme.bodyText1.override(fontFamily: 'IBM', color: MizzUpTheme.primaryColor, useGoogleFonts: false, fontWeight: FontWeight.bold, fontSize: 15)),
                'link': StyledTextActionTag(
                  (_, attrs) => _openLink(context, attrs),
                  style: const TextStyle(decoration: TextDecoration.underline, color: MizzUpTheme.primaryColor, fontWeight: FontWeight.bold),
                ),
              },
            ),
          ),
        ),
        Row(
          children: [Text('Commentaires(25)'), Text('Tout voir')],
        ),
        TextButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: LeaveComment(recipeId: widget.recetteRef),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MizzUpTheme.secondaryColor,
              ),
              child: const Text('Laisser un commentaire', style: TextStyle(color: Colors.black, fontSize: 16))),
        ),
      ],
    );
  }

  getMessage() {
    switch (widget.nbIngredients) {
      case 0:
        message = 'À consommer tout de suite';
        break;
      case 1:
        message = '${widget.nbIngredients.toString()} jour de conservation';
        break;
      case 100:
        message = '1 semaine au réfrigérateur à 3 mois (si cosgard)';
        break;
      default:
        message = '${widget.nbIngredients.toString()} jours de conservation';
    }
  }
}
