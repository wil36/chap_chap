// ignore_for_file: library_private_types_in_public_api, unrelated_type_equality_checks
import 'package:chap_chap/notification/notification_widget.dart';
import 'package:chap_chap/profil/profil_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import 'page_de_article_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticlesWidget extends StatefulWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  _ArticlesWidgetState createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: MizzUpTheme.tertiaryColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
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
                          builder: (context) => const NotificationWidget(),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
                    child: GestureDetector(
                      onTap: () async {
                        // Récupère la référence de la collection "users"
                        final usersCollection =
                            FirebaseFirestore.instance.collection('users');
                        print(usersCollection);

// Récupère la référence de la collection "likes"
                        final likesCollection =
                            FirebaseFirestore.instance.collection('likes');
                        print(likesCollection);
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                    child: Text(
                      'Bienvenue dans ton appli Chap Chap, l\'application pour prendre soin de tes cheveux sans te prendre la tête',
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
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 365,
                      child: Wrap(
                        spacing: 8,
                        alignment: WrapAlignment.spaceEvenly,
                        children: List.generate(_choicesList.length, (index) {
                          return ChoiceChip(
                            labelPadding: const EdgeInsets.all(2.0),
                            label: Text(
                              _choicesList[index],
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                fontSize: 14,
                                color: defaultChoiceIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400,
                                useGoogleFonts: false,
                              ),
                            ),

                            selected: defaultChoiceIndex == index,
                            selectedColor: MizzUpTheme.primaryColor,
                            backgroundColor: Colors.white,
                            onSelected: (value) {
                              setState(() {
                                defaultChoiceIndex =
                                    value ? index : defaultChoiceIndex;
                              });
                            },
                            // backgroundColor: color,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
                        return StreamBuilder<List<ArticlesRecord?>>(
                          stream: queryArticlesRecord(
                            queryBuilder: (articlesRecord) => articlesRecord
                                .orderBy('create_time', descending: true)
                                .where('categorie',
                                    isEqualTo: defaultChoiceIndex != 0
                                        ? categoryIds[
                                            _choicesList[defaultChoiceIndex]]
                                        : null),
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
                            print(
                                categoryIds[_choicesList[defaultChoiceIndex]]);
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                rowArticlesRecordList.length,
                                (rowIndex) {
                                  final rowArticlesRecord =
                                      rowArticlesRecordList[rowIndex]!;
                                  return Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PageDeArticleWidget(
                                              detailArticle: rowArticlesRecord,
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
                                                        .fromSTEB(0, 20, 0, 0),
                                                child: Material(
                                                  elevation: 2,
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  child: Container(
                                                    width: 350,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(2),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child:
                                                                Image.network(
                                                              rowArticlesRecord
                                                                  .imagePrincipale!,
                                                              width: double
                                                                  .infinity,
                                                              height: 200,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Html(
                                                                      data: '<div style="text-align: center; color: #844631;"><strong>' +
                                                                          HtmlUnescape()
                                                                              .convert(rowArticlesRecord.titre!) +
                                                                          '</strong></div>')),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.9, 0),
                                                                child: Text(
                                                                  'Lire plus',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
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
                                                shape: const CircleBorder(),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
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
                                                      Icons.favorite_sharp,
                                                      color: MizzUpTheme
                                                          .primaryColor,
                                                      size: 20,
                                                    ),
                                                    offIcon: const Icon(
                                                      Icons.favorite_border,
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
                        );
                      }),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ]),
        ));
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
