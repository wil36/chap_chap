import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/backend/backend.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../decouvrir_programme/prenium_widget.dart';
import '../notification/notification_widget.dart';

class RecetteSuiteWidget extends StatefulWidget {
  const RecetteSuiteWidget({Key? key, required this.recetteRef, required this.recetteVisibleRef, required this.recetteListImages}) : super(key: key);
  final String recetteRef;
  final String recetteVisibleRef;
  final List<String> recetteListImages;
  @override
  _RecetteSuiteWidgetState createState() => _RecetteSuiteWidgetState();
}

class _RecetteSuiteWidgetState extends State<RecetteSuiteWidget> {
  TextEditingController? textController;
  String? searchKey;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Image>? mListImage;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in widget.recetteListImages) {
      var _precacheImages = Image.asset(
        image,
        //   cacheWidth: ((MediaQuery.of(context).size.width * 0.35)*(MediaQuery.of(context).devicePixelRatio)).round(),
        cacheHeight: ((MediaQuery.of(context).size.width * 0.37) * (MediaQuery.of(context).devicePixelRatio)).round(),
      );
      precacheImage(_precacheImages.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MizzUpTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: MizzUpIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 40,
                    fillColor: MizzUpTheme.secondaryColor,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: MizzUpTheme.primaryColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Découvre nos recettes !',
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
                padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 4, 40),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              searchKey = value;
                            });
                          },
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Rechercher',
                            hintStyle: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: MizzUpTheme.primaryColor,
                              useGoogleFonts: false,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: MizzUpTheme.primaryColor,
                            ),
                          ),
                          style: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            color: MizzUpTheme.primaryColor,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                widget.recetteVisibleRef,
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
                    ],
                  ),
                  if (currentUserDocument?.member != true) noMemberText(),
                  if (searchKey == null) searchEmpty(),
                  if (currentUserDocument?.member == true) ...{
                    if (searchKey != null) searchNotEmpty(),
                  }
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget noMemberText() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
          child: SizedBox(
            width: 350,
            child: Text(
              "Afin d'accéder à nos recettes, il faudra passer à la version premium de l'application 🙂",
              style: MizzUpTheme.bodyText1.override(
                fontFamily: 'IBM',
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                useGoogleFonts: false,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getGoPremium(RecettesRecord streamPremium) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PreniumWidget()),
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: const AlignmentDirectional(0.7, -1),
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.9, -0.53),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(alignment: const AlignmentDirectional(0, 0), children: [
                      /*
                          Image.asset(
                            streamPremium.photoPrincipale!,
                      //   cacheWidth: ((MediaQuery.of(context).size.width * 0.35)*(MediaQuery.of(context).devicePixelRatio)).round(),
        cacheHeight: ((MediaQuery.of(context).size.width * 0.37)*(MediaQuery.of(context).devicePixelRatio)).round(),
                            fit: BoxFit.cover,
                          ),
                          */
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                streamPremium.photoPrincipale!,
                                cacheHeight: ((MediaQuery.of(context).size.width * 0.37) * (MediaQuery.of(context).devicePixelRatio)).round(),
                              ).image,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: MediaQuery.of(context).size.width * 0.46,
                        ),
                      ),
                      const Icon(
                        Icons.lock_outlined,
                        color: MizzUpTheme.primaryColor,
                        size: 44,
                      )
                    ]),
                  ),
                ),
              ),
              Material(
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
                      final favorisRecettesElement = streamPremium.reference;
                      final favorisRecettesUpdate = currentUserDocument!.favorisRecettes!.toList().contains(favorisRecettesElement)
                          ? FieldValue.arrayRemove([favorisRecettesElement])
                          : FieldValue.arrayUnion([favorisRecettesElement]);
                      final usersUpdateData = {
                        'favorisRecettes': favorisRecettesUpdate,
                      };
                      await currentUserDocument!.reference!.update(usersUpdateData);
                      setState(() {});
                    },
                    value: currentUserDocument!.favorisRecettes!.toList().contains(streamPremium.reference),
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
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.42,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Text(
                    streamPremium.titre!,
                    style: MizzUpTheme.bodyText1.override(
                      fontFamily: 'IBM',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getFree(RecettesRecord streamFree) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (streamFree.free == true)
          Container(
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
                          description: streamFree.description!,
                          dureePrepa: streamFree.dureePrepa!,
                          etapes: streamFree.etapes!,
                          listeIngredients: streamFree.listeIngredients!,
                          niveauDifficulte: streamFree.niveauDifficulte!,
                          photoPrincipale: streamFree.photoPrincipale!,
                          titre: streamFree.titre!,
                          nbIngredients: streamFree.nbIngredients!,
                          recetteRef: streamFree.reference!,
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: const AlignmentDirectional(0.7, -1),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.9, -0.53),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    streamFree.photoPrincipale!,
                                    cacheHeight: ((MediaQuery.of(context).size.width * 0.37) * (MediaQuery.of(context).devicePixelRatio)).round(),
                                  ).image,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.44,
                              height: MediaQuery.of(context).size.width * 0.46,
                            ),
                          ),
                        ),
                      ),
                      Material(
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
                              final favorisRecettesElement = streamFree.reference;
                              final favorisRecettesUpdate = currentUserDocument!.favorisRecettes!.toList().contains(favorisRecettesElement)
                                  ? FieldValue.arrayRemove([favorisRecettesElement])
                                  : FieldValue.arrayUnion([favorisRecettesElement]);
                              final usersUpdateData = {
                                'favorisRecettes': favorisRecettesUpdate,
                              };
                              await currentUserDocument!.reference!.update(usersUpdateData);
                              setState(() {});
                            },
                            value: currentUserDocument!.favorisRecettes!.toList().contains(streamFree.reference),
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
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            streamFree.titre!,
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (streamFree.free != true) getGoPremium(streamFree)
      ],
    );
  }

  Widget isPremium(RecettesRecord streamPremium) {
    return InkWell(
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
                  description: streamPremium.description!,
                  dureePrepa: streamPremium.dureePrepa!,
                  etapes: streamPremium.etapes!,
                  listeIngredients: streamPremium.listeIngredients!,
                  niveauDifficulte: streamPremium.niveauDifficulte!,
                  photoPrincipale: streamPremium.photoPrincipale!,
                  titre: streamPremium.titre!,
                  nbIngredients: streamPremium.nbIngredients!,
                  recetteRef: streamPremium.reference!,
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
      },
      child: Column(
        children: [
          Stack(
            alignment: const AlignmentDirectional(0.7, -1),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        streamPremium.photoPrincipale!,
                        cacheHeight: ((MediaQuery.of(context).size.width * 0.37) * (MediaQuery.of(context).devicePixelRatio)).round(),
                      ).image,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: MediaQuery.of(context).size.width * 0.46,
                ),
              ),
              Material(
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
                      final favorisRecettesElement = streamPremium.reference;
                      final favorisRecettesUpdate = currentUserDocument!.favorisRecettes!.toList().contains(favorisRecettesElement)
                          ? FieldValue.arrayRemove([favorisRecettesElement])
                          : FieldValue.arrayUnion([favorisRecettesElement]);
                      final usersUpdateData = {
                        'favorisRecettes': favorisRecettesUpdate,
                      };
                      await currentUserDocument!.reference!.update(usersUpdateData);
                      setState(() {});
                    },
                    value: currentUserDocument!.favorisRecettes!.toList().contains(streamPremium.reference),
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
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.42,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Text(
                    streamPremium.titre!,
                    style: MizzUpTheme.bodyText1.override(
                      fontFamily: 'IBM',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int likesCounter = 0;
                      List<String> usersInitials = [];
                      List<DocumentSnapshot> documents = snapshot.data!.docs;
                      for (DocumentSnapshot doc in documents) {
                        List<dynamic> favRecipe = doc['favorisRecettes'];
                        if (favRecipe.contains(streamPremium.reference!)) {
                          likesCounter++;
                          if (usersInitials.length < 3) {
                            String firstNameInitials = doc['display_name'].toString().substring(0, 1).toUpperCase() ?? 'L';
                            String lastNameInitials = doc['display_name'].toString().substring(0, 1).toUpperCase() ?? 'B';
                            usersInitials.add(firstNameInitials + lastNameInitials);
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
                    return CircularProgressIndicator();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getNoMember(RecettesRecord streamValue) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: getFree(streamValue),
    );
  }

  Widget getIsMember(RecettesRecord streamValue) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: isPremium(streamValue),
    );
  }

  Widget searchEmpty() {
    return Expanded(
      flex: 1,
      child: Container(
        child: StreamBuilder<List<RecettesRecord?>>(
            stream: queryRecettesRecord(queryBuilder: (recettesRecord) => recettesRecord.where(widget.recetteRef, isEqualTo: true)),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              }
              List<RecettesRecord?> wrapRecettesRecordList = snapshot.data!;
              return GridView.builder(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.7,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: wrapRecettesRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final wrapRecettesRecord = wrapRecettesRecordList[gridViewIndex];

                    return wrapRecettesRecord!.hided != true
                        ? Container(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: currentUserDocument!.member! ? getIsMember(wrapRecettesRecord) : getNoMember(wrapRecettesRecord),
                            ),
                          )
                        : SizedBox();
                  });
            }),
      ),
    );
  }

  Widget searchNotEmpty() {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(),
        child: StreamBuilder<List<RecettesRecord?>>(
            stream: queryRecettesRecord(queryBuilder: (recettesRecord) => recettesRecord.where(widget.recetteRef, isEqualTo: true)),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              }
              List<RecettesRecord?> wrapRecettesRecordList = snapshot.data!.where((element) => element!.titre!.toUpperCase().contains(searchKey!.toUpperCase())).toList();
              return GridView.builder(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.7,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: wrapRecettesRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final wrapRecettesRecord = wrapRecettesRecordList[gridViewIndex];

                    return wrapRecettesRecord!.hided != true
                        ? Container(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: currentUserDocument!.member! ? getIsMember(wrapRecettesRecord) : getNoMember(wrapRecettesRecord),
                            ),
                          )
                        : SizedBox();
                  });
            }),
      ),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() {
    return FirebaseFirestore.instance.collection('users').where('favorisRecettes', isGreaterThan: []).snapshots();
  }
}
