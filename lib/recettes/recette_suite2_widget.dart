// ignore_for_file: avoid_print, deprecated_member_use

import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/backend/schema/alternatives.dart';
import 'package:chap_chap/recettes/leave_comment.dart';
import 'package:chap_chap/recettes/reply_comment.dart';
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
import '../profil/other_profile_page.dart';
import 'display_all_comments.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit_reply.dart';

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
  List<Alternative> alternatives = [];
  ScrollController scrollController = new ScrollController();

  int index = 0;
  Future<QuerySnapshot<Map<String, dynamic>>> getUsersWithFavRecipe =
      getUsersWithFavorisRecipe();

  void _openLink(BuildContext context, Map<String?, String?> attrs) async {
    final String? link = attrs['href'];

    await launchURL('$link');
  }

  @override
  void initState() {
    super.initState();
    getMessage();
    getAlternativesForRecipe(widget.recetteRef.id).then((value) {
      if (mounted) {
        setState(() {
          alternatives = value;
        });
      }
    });
  }

  Future<List<Alternative>> getAlternativesForRecipe(String recipeId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('recettes')
        .doc(recipeId)
        .get();
    List<Alternative> alternatives = [];
    if (querySnapshot.data()!['alternatives'] != null) {
      alternatives = List<Alternative>.from(
          (querySnapshot.data()!['alternatives'] as List<dynamic>)
              .map((e) => Alternative.fromJson(e)));
    }

    return alternatives;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                headerRecette(),
                Expanded(
                  child: Container(
                    child: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: bodyRecette()),
                  ),
                ),
              ],
            ),
          ),
        ),
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
          padding: EdgeInsets.only(top: 35),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    final favorisRecettesUpdate = currentUserDocument!
                            .favorisRecettes!
                            .toList()
                            .contains(favorisRecettesElement)
                        ? FieldValue.arrayRemove([favorisRecettesElement])
                        : FieldValue.arrayUnion([favorisRecettesElement]);
                    final usersUpdateData = {
                      'favorisRecettes': favorisRecettesUpdate,
                    };
                    await currentUserDocument!.reference!
                        .update(usersUpdateData);
                    setState(() {});
                  },
                  value: currentUserDocument!.favorisRecettes!
                      .toList()
                      .contains(widget.recetteRef),
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
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // shrinkWrap: true,
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
                  List<DocumentSnapshot<Map<String, dynamic>>> documents =
                      docs.docs;
                  for (DocumentSnapshot<Map<String, dynamic>> document
                      in documents) {
                    if (document
                        .data()!['favorisRecettes']
                        .contains(widget.recetteRef)) {
                      likesCounter++;
                      var firstInitial;
                      var secondInitial;
                      if (document.data()!.containsKey('Prenom') &&
                          document.data()!['Prenom'] != '') {
                        firstInitial = document
                            .data()!['Prenom'][0]
                            .toString()
                            .toUpperCase();
                      } else {
                        firstInitial = 'L';
                      }
                      if (document.data()!.containsKey('Nom') &&
                          document.data()!['Nom'] != '') {
                        secondInitial =
                            document.data()!['Nom'][0].toString().toUpperCase();
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
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 20,
                              child: Stack(
                                children: [
                                  for (String userInitial in usersInitials)
                                    Positioned(
                                      left:
                                          (usersInitials.indexOf(userInitial) *
                                              15),
                                      child: Container(
                                        width: 20,
                                        height: 20,
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
                                            style:
                                                MizzUpTheme.bodyText1.override(
                                              color: Colors.white,
                                              fontFamily: 'IBM',
                                              fontSize: 10,
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
                              '$likesCounter personnes ont liké cette recette ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'IBM',
                                fontSize: 12,
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
                return Container(
                    width: 50,
                    height: 50,
                    child: Center(child: CircularProgressIndicator()));
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
                      options: const [
                        ChipData('Ingrédients'),
                        ChipData('Recette')
                      ],
                      onChanged: (val) =>
                          setState(() => choiceChipsValue = val),
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
                text: (choiceChipsValue) == 'Ingrédients'
                    ? widget.listeIngredients
                    : widget.etapes,
                style: MizzUpTheme.bodyText1.override(
                    fontFamily: 'IBM',
                    color: Colors.black,
                    useGoogleFonts: false,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
                tags: {
                  'bold': StyledTextTag(
                      style: MizzUpTheme.bodyText1.override(
                          fontFamily: 'IBM',
                          color: MizzUpTheme.primaryColor,
                          useGoogleFonts: false,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  'link': StyledTextActionTag(
                    (_, attrs) => _openLink(context, attrs),
                    style: const TextStyle(
                        decorationColor: MizzUpTheme.primaryColor,
                        decoration: TextDecoration.underline,
                        color: MizzUpTheme.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                },
              ),
            ),
          ),
          Visibility(
            visible: alternatives.length > 0 ? true : false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text('Alternatives',
                        textAlign: TextAlign.center,
                        style: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            color: Colors.black,
                            useGoogleFonts: false,
                            fontWeight: FontWeight.w800,
                            fontSize: 15))),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: alternatives.map((alternative) {
                return MyClickableCard(
                  imageUrl: alternative.image!,
                  externalLink: alternative.link!,
                  title: alternative.name!,
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          StreamBuilder(
              stream: getAllRecipeComments(widget.recetteRef),
              builder: (context, recipes) {
                if (recipes.hasData) {
                  if (recipes.data!.docs.length == 0) {
                    return Center(child: Text('Pas encore de commentaires'));
                  }
                  var recipeComments = recipes.data!.docs;
                  return FutureBuilder(
                    future: getUserById(recipeComments[0]['user_id']),
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  child: Text(
                                      'Commentaires (${recipeComments.length})',
                                      style: MizzUpTheme.bodyText1.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          useGoogleFonts: false,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15))),
                              GestureDetector(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          child: DisplayAllComments(
                                              recetteRef: widget.recetteRef),
                                        ),
                                      );
                                    },
                                  ).then((value) {
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  });
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(right: 40),
                                    child: Text(
                                      'Voir tout',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'IBM',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          for (int i = 0;
                              i < 5 && i < recipeComments.length;
                              i++)
                            FutureBuilder(
                              future: getUserById(recipeComments[i]['user_id']),
                              builder: (context, snapshot) {
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
                                var user = snapshot.data;
                                var comment = recipeComments[i];
                                String userPhoto = user!
                                        .data()!
                                        .containsKey('photo_url')
                                    ? user['photo_url']
                                    : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg';
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: LayoutBuilder(
                                      builder: (BuildContext context,
                                          BoxConstraints constraints) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            OtherProfilePage(
                                                          userId: user.id,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                50), // Adjust the radius to your liking
                                                        child: Image.network(
                                                          valueOrDefault<
                                                                  String?>(
                                                              userPhoto,
                                                              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg")!,
                                                          width: 30,
                                                          height: 30,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            user[
                                                                'display_name'],
                                                            style: MizzUpTheme
                                                                .bodyText1
                                                                .override(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily: 'IBM',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      DateFormat.yMd('fr_FR')
                                                          .format(
                                                              recipeComments[i]
                                                                      ['date']
                                                                  .toDate()),
                                                      style: MizzUpTheme
                                                          .bodyText1
                                                          .override(
                                                        color: Colors.black,
                                                        fontFamily: 'IBM',
                                                        fontSize: 10,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                    SizedBox(width: 5),
                                                    recipeComments[i]
                                                                ["user_id"] ==
                                                            currentUserUid
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              showCommentOptions(
                                                                  context,
                                                                  comment);
                                                            },
                                                            child: Icon(
                                                              Icons.more_vert,
                                                              color:
                                                                  Colors.grey,
                                                              size: 20,
                                                            ),
                                                          )
                                                        : SizedBox()
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              margin: const EdgeInsets.only(
                                                left: 30,
                                              ),
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                comment['comment'].toString(),
                                                style: MizzUpTheme.bodyText1
                                                    .override(
                                                  color: Colors.black,
                                                  fontFamily: 'IBM',
                                                  fontSize: 12,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                //repondre button
                                                TextButton(
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.9,
                                                            child: ReplyComment(
                                                                comment:
                                                                    comment,
                                                                user: user),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) {
                                                      if (mounted) {
                                                        setState(() {});
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5,
                                                          horizontal: 15),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.3),
                                                            spreadRadius: 0,
                                                            blurRadius: 5,
                                                            offset: const Offset(
                                                                0,
                                                                4), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: const Text(
                                                          'Répondre',
                                                          style: TextStyle(
                                                              color: MizzUpTheme
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300))),
                                                ),
                                                //like button
                                                Row(
                                                  children: [
                                                    Text(
                                                      comment['likes']
                                                          .length
                                                          .toString(),
                                                      style: MizzUpTheme
                                                          .bodyText1
                                                          .override(
                                                        color: Colors.black,
                                                        fontFamily: 'IBM',
                                                        fontSize: 14,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        print(comment.id);
                                                        comment['likes'].contains(
                                                                currentUserUid)
                                                            ? await unlikeComment(
                                                                comment.id)
                                                            : await likeComment(
                                                                comment.id);
                                                        setState(() {});
                                                      },
                                                      value: comment['likes']
                                                          .contains(
                                                              currentUserUid),
                                                      onIcon: Icon(
                                                          Icons.favorite,
                                                          color: MizzUpTheme
                                                              .primaryColor),
                                                      offIcon: Icon(
                                                          Icons.favorite_border,
                                                          color: MizzUpTheme
                                                              .primaryColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      );
                    },
                  );
                } else if (recipes.hasError) {
                  return Text('Erreur: ${recipes.error}');
                }
                return const Center(child: CircularProgressIndicator());
              }),
          SizedBox(height: 20),
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
              ).then((value) {
                if (mounted) {
                  setState(() {});
                }
              });
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MizzUpTheme.secondaryColor,
                ),
                child: const Text('Laisser un commentaire',
                    style: TextStyle(color: Colors.black, fontSize: 16))),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          )
        ],
      ),
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

  void showCommentOptions(BuildContext context,
      QueryDocumentSnapshot<Map<String, dynamic>> comment) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'edit',
          child: Text('Modifier',
              style: TextStyle(color: Colors.black, fontSize: 12)),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Text('Supprimer',
              style: TextStyle(color: Colors.black, fontSize: 12)),
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? selected) async {
      if (selected == null) return;
      if (selected == 'edit') {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: EditReply(
                  comment: comment,
                  isAnAnswer: false,
                ),
              ),
            );
          },
        ).then((value) {
          if (mounted) {
            setState(() {});
          }
        });
      } else if (selected == 'delete') {
        await deleteComment(comment.id);
      }
    });
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> getAllRecipeComments(
    DocumentReference recipeId) {
  return FirebaseFirestore.instance
      .collection('comments')
      .where('recipe_id', isEqualTo: recipeId)
      .snapshots();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserById(String userId) {
  return FirebaseFirestore.instance.collection('users').doc(userId).get();
}

Future<void> likeComment(String commentId) async {
  await FirebaseFirestore.instance
      .collection('comments')
      .doc(commentId)
      .update({
    'likes': FieldValue.arrayUnion([currentUserUid])
  });
}

Future<void> unlikeComment(String commentId) async {
  await FirebaseFirestore.instance
      .collection('comments')
      .doc(commentId)
      .update({
    'likes': FieldValue.arrayRemove([currentUserUid])
  });
}

Future<void> deleteComment(String commentId) async {
  await FirebaseFirestore.instance
      .collection('comments')
      .doc(commentId)
      .delete();
}

class MyClickableCard extends StatelessWidget {
  final String imageUrl;
  final String externalLink;
  final String title;

  MyClickableCard(
      {required this.imageUrl,
      required this.externalLink,
      required this.title});

  void _launchURL() async {
    if (await canLaunch(externalLink)) {
      await launch(externalLink);
    } else {
      throw 'Could not launch $externalLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width / 2.5,
          //   child: Align(
          //     alignment: const AlignmentDirectional(-1, 0),
          //     child: Padding(
          //       padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
          //       child: Text(
          //         title,
          //         style: MizzUpTheme.bodyText1.override(
          //           fontFamily: 'IBM',
          //           fontSize: 17,
          //           fontWeight: FontWeight.normal,
          //           useGoogleFonts: false,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
