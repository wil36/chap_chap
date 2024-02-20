// ignore_for_file: unnecessary_const, depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:convert';
import 'package:chap_chap/decouvrir_programme/fiche_programme_widget.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_widgets.dart';
import 'package:tuple/tuple.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/modif_article_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_media_display.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_video_player.dart';
import 'package:flutter/material.dart';

class PageDeArticleWidget extends StatefulWidget {
  const PageDeArticleWidget({
    Key? key,
    this.detailArticle,
  }) : super(key: key);

  final ArticlesRecord? detailArticle;

  @override
  _PageDeArticleWidgetState createState() => _PageDeArticleWidgetState();
}

class _PageDeArticleWidgetState extends State<PageDeArticleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  QuillController? _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: StreamBuilder<ArticlesRecord?>(
        stream: ArticlesRecord.getDocument(widget.detailArticle!.reference!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }
          final columnArticlesRecord = snapshot.data!;
          var myJSON = jsonDecode(columnArticlesRecord.description!);
          _controller = QuillController(document: Document.fromJson(myJSON), selection: const TextSelection.collapsed(offset: 0));

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (columnArticlesRecord.imagePrincipale!.startsWith(RegExp('assets'))) ...{
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: const Radius.circular(20),
                            topLeft: Radius.circular(0),
                            topRight: const Radius.circular(0),
                          ),
                          child: Image.asset(
                            columnArticlesRecord.imagePrincipale!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      } else ...{
                        MizzUpMediaPlayer(
                          path: valueOrDefault<String?>(
                            columnArticlesRecord.imagePrincipale,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/5e2nvdue9k2r/Capture%20d%E2%80%99e%CC%81cran%202021-12-18%20a%CC%80%2015.53.37.png',
                          ),
                          imageBuilder: (path) => ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: const Radius.circular(20),
                              topLeft: Radius.circular(0),
                              topRight: const Radius.circular(0),
                            ),
                            child: Image.network(
                              path!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          videoPlayerBuilder: (path) => MizzUpVideoPlayer(
                            path: path!,
                            width: 300,
                            autoPlay: false,
                            looping: true,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                      },
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
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
                            final rowUsersRecord = snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MizzUpIconButton(
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
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((currentUserDocument?.admin) == true)
                                      AuthUserStreamWidget(
                                        child: MizzUpIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 40,
                                          fillColor: MizzUpTheme.secondaryColor,
                                          icon: const Icon(
                                            Icons.more_vert_outlined,
                                            color: MizzUpTheme.primaryColor,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding: MediaQuery.of(context).viewInsets,
                                                  child: SizedBox(
                                                    height: MediaQuery.of(context).size.height * 1,
                                                    child: ModifArticleWidget(
                                                      detailsArticle: columnArticlesRecord,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: MizzUpTheme.secondaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final favorisArticlesElement = columnArticlesRecord.reference;
                                          final favorisArticlesUpdate = rowUsersRecord.favorisArticles!.contains(favorisArticlesElement)
                                              ? FieldValue.arrayRemove([favorisArticlesElement])
                                              : FieldValue.arrayUnion([favorisArticlesElement]);
                                          final usersUpdateData = {
                                            'favorisArticles': favorisArticlesUpdate,
                                          };
                                          await rowUsersRecord.reference!.update(usersUpdateData);
                                        },
                                        value: rowUsersRecord.favorisArticles!.contains(columnArticlesRecord.reference),
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
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                    child: RichText(
                      text: TextSpan(
                        text: columnArticlesRecord.titre,
                        style: MizzUpTheme.bodyText1.override(
                          fontFamily: 'IBM',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: StreamBuilder<UsersRecord?>(
                    stream: UsersRecord.getDocument(widget.detailArticle!.userCreate!),
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
                      final rowUsersRecord = snapshot.data;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Écrit par ${rowUsersRecord!.displayName!}',
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: QuillEditor(
                      controller: _controller!,
                      readOnly: true, // true for view only mode
                      scrollController: ScrollController(),
                      scrollable: true,
                      focusNode: _focusNode,
                      autoFocus: true,
                      expands: false,
                      padding: EdgeInsets.zero,
                      showCursor: false,
                      customStyles: DefaultStyles(
                        paragraph: DefaultTextBlockStyle(
                            const TextStyle(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            const Tuple2(16, 0),
                            const Tuple2(0, 0),
                            null),
                        h1: DefaultTextBlockStyle(
                            const TextStyle(
                              fontFamily: 'IBM',
                              color: MizzUpTheme.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                            const Tuple2(16, 0),
                            const Tuple2(0, 0),
                            null),
                        h2: DefaultTextBlockStyle(
                            const TextStyle(
                              fontFamily: 'IBM',
                              color: MizzUpTheme.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            const Tuple2(16, 0),
                            const Tuple2(0, 0),
                            null),
                        h3: DefaultTextBlockStyle(
                            const TextStyle(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            const Tuple2(16, 0),
                            const Tuple2(0, 0),
                            null),
                      ),
                    ),
                  ),
                ),
                if ((columnArticlesRecord.titre) == 'Prendre soin de ses cheveux avec les poudres')
                  FutureBuilder<List<ProgrammesRecord?>>(
                    future: queryProgrammesRecordOnce(
                      queryBuilder: (programmesRecord) => programmesRecord.where('titre', isEqualTo: 'Programme Pousse'),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return const Center(
                          child: const SizedBox(
                            width: 60,
                            height: 60,
                            child: const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        );
                      }
                      List<ProgrammesRecord?> rowProgrammesRecordList = snapshot.data!;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final rowProgrammesRecord = rowProgrammesRecordList.isNotEmpty ? rowProgrammesRecordList.first : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FicheProgrammeWidget(
                                    detailsProgramme: rowProgrammesRecord,
                                  ),
                                ),
                                (willHandlePopInternally) => true,
                              );
                            },
                            text: 'Voir le programme',
                            icon: const Icon(
                              Icons.pending_actions_sharp,
                              size: 15,
                            ),
                            options: MizzUpOptionButton(
                              width: 250,
                              height: 40,
                              color: MizzUpTheme.primaryColor,
                              textStyle: MizzUpTheme.subtitle2.override(
                                fontFamily: 'IBM',
                                color: Colors.white,
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
                      );
                    },
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
