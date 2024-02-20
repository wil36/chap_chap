// ignore_for_file: file_names

import 'package:chap_chap/backend/backend.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
import 'package:flutter/material.dart';

class SearchAllRecetteWidget extends StatefulWidget {
  const SearchAllRecetteWidget({Key? key}) : super(key: key);

  @override
  _SearchAllRecetteWidgetState createState() => _SearchAllRecetteWidgetState();
}

class _SearchAllRecetteWidgetState extends State<SearchAllRecetteWidget> {
  TextEditingController? textController;
  String? searchKey;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MizzUpTheme.tertiaryColor,
          title: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
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
        body: StreamBuilder<List<RecettesRecord?>>(
          stream: queryRecettesRecord(
              queryBuilder: (recettesRecord) => recettesRecord),
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
            List<RecettesRecord?>? recettesSearchRecettesRecordList =
                snapshot.data;
            return Container(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (searchKey != null)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Builder(
                          builder: (context) {
                            final recettesFields =
                                recettesSearchRecettesRecordList?.toList() ??
                                    [];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(recettesFields.length,
                                    (recettesFieldsIndex) {
                                  final recettesFieldsItem =
                                      recettesFields[recettesFieldsIndex]!;
                                  if (recettesFieldsItem.titre!
                                      .toUpperCase()
                                      .contains(searchKey!.toUpperCase())) {
                                    return Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              15, 10, 20, 7),
                                      child: InkWell(
                                        onTap: () async {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.9,
                                                  child: RecetteSuite2Widget(
                                                    description:
                                                        recettesFieldsItem
                                                            .description!,
                                                    dureePrepa:
                                                        recettesFieldsItem
                                                            .dureePrepa!,
                                                    etapes: recettesFieldsItem
                                                        .etapes!,
                                                    listeIngredients:
                                                        recettesFieldsItem
                                                            .listeIngredients!,
                                                    niveauDifficulte:
                                                        recettesFieldsItem
                                                            .niveauDifficulte!,
                                                    photoPrincipale:
                                                        recettesFieldsItem
                                                            .photoPrincipale!,
                                                    titre: recettesFieldsItem
                                                        .titre!,
                                                    nbIngredients:
                                                        recettesFieldsItem
                                                            .nbIngredients!,
                                                    recetteRef:
                                                        recettesFieldsItem
                                                            .reference!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                        10, 20, 20, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      recettesFieldsItem.titre!,
                                                      style: MizzUpTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'IBM',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    if (searchKey == null) Container(),
                    if (searchKey == '') Container()
                  ],
                ),
              ),
            );
          },
        ));
  }
}
