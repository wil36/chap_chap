// import 'package:flutter_svg/svg.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../articles/page_de_article_widget.dart';
import '../recettes/recette_suite2_widget.dart';
import 'package:flutter/material.dart';

class MesFavorisWidget extends StatefulWidget {
  const MesFavorisWidget({Key? key}) : super(key: key);

  @override
  _MesFavorisWidgetState createState() => _MesFavorisWidgetState();
}

class _MesFavorisWidgetState extends State<MesFavorisWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MizzUpIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Mes recettes enregistrées',
                      style: MizzUpTheme.title1.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontSize: 20,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 360,
              decoration: BoxDecoration(
                color: const Color(0x72F2D0BD),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-0.8, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: Text(
                          'Mes recettes',
                          style: MizzUpTheme.title2.override(
                            fontFamily: 'IBM',
                            color: Colors.black,
                            fontSize: 17,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: StreamBuilder<List<UsersRecord?>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord.where('uid', isEqualTo: currentUserUid),
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
                            List<UsersRecord?> rowUsersRecordList = snapshot.data!;
                            if (rowUsersRecordList.isEmpty) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/282828.png',
                                  height: MediaQuery.of(context).size.height * 0.2,
                                ),
                              );
                            }
                            final rowUsersRecord = rowUsersRecordList.isNotEmpty ? rowUsersRecordList.first : null;
                            return Builder(
                              builder: (context) {
                                final favoriteRecettes = rowUsersRecord!.favorisRecettes!.toList().toList();
                                if (favoriteRecettes.isEmpty) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/282828.png',
                                      height: MediaQuery.of(context).size.height * 0.2,
                                    ),
                                  );
                                }
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(favoriteRecettes.length, (favoriteRecettesIndex) {
                                      final favoriteRecettesItem = favoriteRecettes[favoriteRecettesIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                        child: StreamBuilder<RecettesRecord?>(
                                          stream: RecettesRecord.getDocument(favoriteRecettesItem),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: Image.asset(
                                                  'assets/images/282828.png',
                                                  height: MediaQuery.of(context).size.height * 0.2,
                                                ),
                                              );
                                            }
                                            final columnRecettesRecord = snapshot.data!;
                                            return InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => RecetteSuite2Widget(
                                                      description: columnRecettesRecord.description!,
                                                      dureePrepa: columnRecettesRecord.dureePrepa!,
                                                      etapes: columnRecettesRecord.etapes!,
                                                      listeIngredients: columnRecettesRecord.listeIngredients!,
                                                      niveauDifficulte: columnRecettesRecord.niveauDifficulte!,
                                                      photoPrincipale: columnRecettesRecord.photoPrincipale!,
                                                      titre: columnRecettesRecord.titre!,
                                                      nbIngredients: columnRecettesRecord.nbIngredients!,
                                                      recetteRef: columnRecettesRecord.reference!,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    alignment: const AlignmentDirectional(1, -1),
                                                    children: [
                                                      if (columnRecettesRecord.photoPrincipale!.startsWith(RegExp('assets'))) ...{
                                                        Align(
                                                          alignment: const AlignmentDirectional(-0.9, -0.53),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(20),
                                                              child: Container(
                                                                child: Image.asset(
                                                                  columnRecettesRecord.photoPrincipale!,
                                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                                  height: MediaQuery.of(context).size.height * 0.25,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      } else ...{
                                                        Align(
                                                          alignment: const AlignmentDirectional(-0.9, -0.53),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(20),
                                                              child: Image.network(
                                                                valueOrDefault<String?>(
                                                                  columnRecettesRecord.photoPrincipale,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/5e2nvdue9k2r/Capture%20d%E2%80%99e%CC%81cran%202021-12-18%20a%CC%80%2015.53.37.png',
                                                                )!,
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                height: MediaQuery.of(context).size.height * 0.25,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      },
                                                      Material(
                                                        color: Colors.transparent,
                                                        elevation: 10,
                                                        shape: const CircleBorder(),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration: const BoxDecoration(
                                                            color: Color(0xFFEEEEEE),
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: ToggleIcon(
                                                            onPressed: () async {
                                                              final favorisRecettesElement = columnRecettesRecord.reference;
                                                              final favorisRecettesUpdate = rowUsersRecord.favorisRecettes!.toList().contains(favorisRecettesElement)
                                                                  ? FieldValue.arrayRemove([favorisRecettesElement])
                                                                  : FieldValue.arrayUnion([favorisRecettesElement]);
                                                              final usersUpdateData = {
                                                                'favorisRecettes': favorisRecettesUpdate,
                                                              };
                                                              await rowUsersRecord.reference!.update(usersUpdateData);
                                                            },
                                                            value: rowUsersRecord.favorisRecettes!.toList().contains(columnRecettesRecord.reference),
                                                            onIcon: const Icon(
                                                              Icons.favorite_sharp,
                                                              color: MizzUpTheme.primaryColor,
                                                              size: 25,
                                                            ),
                                                            offIcon: const Icon(
                                                              Icons.favorite_border,
                                                              color: MizzUpTheme.primaryColor,
                                                              size: 25,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width * 0.4,
                                                      decoration: const BoxDecoration(),
                                                      child: Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                        child: Text(
                                                          columnRecettesRecord.titre!,
                                                          style: MizzUpTheme.bodyText1.override(
                                                            fontFamily: 'IBM',
                                                            fontWeight: FontWeight.w600,
                                                            useGoogleFonts: false,
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
                                      );
                                    }),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 100),
              child: Container(
                width: 360,
                decoration: BoxDecoration(
                  color: const Color(0x72F2D0BD),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.8, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: Text(
                            'Mes articles',
                            style: MizzUpTheme.title2.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontSize: 17,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                          child: StreamBuilder<List<UsersRecord?>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where('uid', isEqualTo: currentUserUid),
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
                              List<UsersRecord?> rowUsersRecordList = snapshot.data!;
                              if (rowUsersRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/747411.png',
                                    height: MediaQuery.of(context).size.height * 0.3,
                                  ),
                                );
                              }
                              final rowUsersRecord = rowUsersRecordList.isNotEmpty ? rowUsersRecordList.first : null;
                              return Builder(
                                builder: (context) {
                                  final favoriteArticles = rowUsersRecord!.favorisArticles!.toList().toList();
                                  if (favoriteArticles.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/747411.png',
                                        height: MediaQuery.of(context).size.height * 0.3,
                                      ),
                                    );
                                  }
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: List.generate(favoriteArticles.length, (favoriteArticlesIndex) {
                                        final favoriteArticlesItem = favoriteArticles[favoriteArticlesIndex];
                                        return Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                          child: StreamBuilder<ArticlesRecord?>(
                                            stream: ArticlesRecord.getDocument(favoriteArticlesItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                  child: SizedBox(
                                                    width: 0,
                                                    height: 0,
                                                    child: CircularProgressIndicator(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final columnArticlesRecord = snapshot.data!;
                                              return InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => PageDeArticleWidget(
                                                        detailArticle: columnArticlesRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      alignment: const AlignmentDirectional(1, -1),
                                                      children: [
                                                        if (columnArticlesRecord.imagePrincipale!.startsWith(RegExp('assets'))) ...{
                                                          Align(
                                                            alignment: const AlignmentDirectional(-0.9, -0.53),
                                                            child: Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(20),
                                                                child: Container(
                                                                  child: Image.asset(
                                                                    columnArticlesRecord.imagePrincipale!,
                                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                                    height: MediaQuery.of(context).size.height * 0.25,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        } else ...{
                                                          Align(
                                                            alignment: const AlignmentDirectional(-0.9, -0.53),
                                                            child: Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(20),
                                                                child: Image.network(
                                                                  valueOrDefault<String?>(
                                                                    columnArticlesRecord.imagePrincipale,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/5e2nvdue9k2r/Capture%20d%E2%80%99e%CC%81cran%202021-12-18%20a%CC%80%2015.53.37.png',
                                                                  )!,
                                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                                  height: MediaQuery.of(context).size.height * 0.25,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        },
                                                        Material(
                                                          color: Colors.transparent,
                                                          elevation: 10,
                                                          shape: const CircleBorder(),
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration: const BoxDecoration(
                                                              color: Color(0xFFEEEEEE),
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: ToggleIcon(
                                                              onPressed: () async {
                                                                final favorisArticlesElement = columnArticlesRecord.reference;
                                                                final favorisArticlesUpdate = rowUsersRecord.favorisArticles!.toList().contains(favorisArticlesElement)
                                                                    ? FieldValue.arrayRemove([favorisArticlesElement])
                                                                    : FieldValue.arrayUnion([favorisArticlesElement]);
                                                                final usersUpdateData = {
                                                                  'favorisArticles': favorisArticlesUpdate,
                                                                };
                                                                await rowUsersRecord.reference!.update(usersUpdateData);
                                                              },
                                                              value: rowUsersRecord.favorisArticles!.toList().contains(columnArticlesRecord.reference),
                                                              onIcon: const Icon(
                                                                Icons.favorite_sharp,
                                                                color: MizzUpTheme.primaryColor,
                                                                size: 25,
                                                              ),
                                                              offIcon: const Icon(
                                                                Icons.favorite_border,
                                                                color: MizzUpTheme.primaryColor,
                                                                size: 25,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: const BoxDecoration(),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                          child: Text(
                                                            columnArticlesRecord.titre!,
                                                            textAlign: TextAlign.start,
                                                            style: MizzUpTheme.bodyText1.override(
                                                              fontFamily: 'IBM',
                                                              fontWeight: FontWeight.w600,
                                                              useGoogleFonts: false,
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
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
