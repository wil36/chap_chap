// ignore_for_file: avoid_print

import 'package:chap_chap/decouvrir_programme/prenium_widget.dart';
import 'package:chap_chap/decouvrir_programme/startProg.dart';
import 'package:styled_text/styled_text.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../recettes/recette_suite2_widget.dart';
import 'leave_review.dart';

class FicheProgrammeWidget extends StatefulWidget {
  const FicheProgrammeWidget({
    Key? key,
    this.detailsProgramme,
  }) : super(key: key);

  final ProgrammesRecord? detailsProgramme;

  @override
  _FicheProgrammeWidgetState createState() => _FicheProgrammeWidgetState();
}

class _FicheProgrammeWidgetState extends State<FicheProgrammeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void _openLink(BuildContext context, Map<String?, String?> attrs) async {
    final String? link = attrs['href'];
    await launchURL('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: StreamBuilder<ProgrammesRecord?>(
        stream: ProgrammesRecord.getDocument(widget.detailsProgramme!.reference!),
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
          final textDescription = columnProgrammesRecord.description!.replaceAll('\\n', '\n');
          final textAvantages = columnProgrammesRecord.listeAvantages!.replaceAll('\\n', '\n');
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: const BoxDecoration(
                            color: Color(0x00EEEEEE),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
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
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(50, 20, 0, 0),
                    child: Text(
                      columnProgrammesRecord.titre!,
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: MizzUpTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MizzUpIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 35,
                        icon: const FaIcon(
                          FontAwesomeIcons.clock,
                          color: MizzUpTheme.primaryColor,
                          size: 15,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      if (columnProgrammesRecord.duree == 100) ...{
                        Text(
                          'Durée du programme : 2 semaines',
                          style: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                        ),
                      } else ...{
                        Text(
                          'Durée du programme : ${columnProgrammesRecord.duree.toString()} mois',
                          style: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                        ),
                      }
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 20, 20, 0),
                  child: StyledText(
                    newLineAsBreaks: true,
                    text: textDescription,
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
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(50, 20, 20, 0),
                    child: Text(
                      'Un planning personnalisé avec : ',
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
                    padding: const EdgeInsetsDirectional.fromSTEB(50, 20, 20, 0),
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
                      },
                    ),
                  ),
                ),
                if (currentUserDocument!.member == true) ...{
                  SizedBox(height: 20),
                  Center(
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartProgWidget(
                              detailsProgramme: columnProgrammesRecord,
                            ),
                          ),
                        );
                      },
                      text: 'Commencer',
                      options: MizzUpOptionButton(
                        width: 130,
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
                  ),
                  SizedBox(height: 20),
                  StreamBuilder(
                      stream: getAllProgramReview(widget.detailsProgramme!.reference),
                      builder: (context, reviewsFetched) {
                        if (reviewsFetched.hasData) {
                          if (reviewsFetched.data!.docs.length == 0) {
                            return Center(child: Text('Pas encore de commentaires'));
                          }
                          var reviews = reviewsFetched.data!.docs;
                          return FutureBuilder(
                            future: getUserById(reviews[0]['user_id']),
                            builder: (context, snapshot) {
                              var user = snapshot.data;
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(left: 40),
                                          child: Text('Commentaires (${reviews.length})',
                                              style: MizzUpTheme.bodyText1.override(fontFamily: 'IBM', color: Colors.black, useGoogleFonts: false, fontWeight: FontWeight.w800, fontSize: 15))),
                                      GestureDetector(
                                        onTap: () async {
                                          // await showModalBottomSheet(
                                          //   isScrollControlled: true,
                                          //   backgroundColor: Colors.transparent,
                                          //   context: context,
                                          //   builder: (context) {
                                          //     return Padding(
                                          //       padding: MediaQuery.of(context).viewInsets,
                                          //       child: Container(
                                          //         height: MediaQuery.of(context).size.height * 0.9,
                                          //         child: DisplayAllComments(recetteRef: widget.recetteRef),
                                          //       ),
                                          //     );
                                          //   },
                                          // ).then((value) => setState(() {}));
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.only(right: 40),
                                            child: Text(
                                              'Voir tout',
                                              style: TextStyle(color: Colors.black, fontFamily: 'IBM', fontSize: 12, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  for (int i = 0; i < 5 && i < reviews.length; i++)
                                    FutureBuilder(
                                      future: getUserById(reviews[i]['user_id']),
                                      builder: (context, snapshot) {
                                        var comment = reviews[i];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 40),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: LayoutBuilder(
                                              builder: (BuildContext context, BoxConstraints constraints) {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(50), // Adjust the radius to your liking
                                                              child: Image.network(
                                                                user!['photo_url'],
                                                                width: 30,
                                                                height: 30,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  user['display_name'],
                                                                  style: MizzUpTheme.bodyText1.override(
                                                                    color: Colors.black,
                                                                    fontFamily: 'IBM',
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w600,
                                                                    useGoogleFonts: false,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          reviews[i]['date'].toDate().toString().substring(0, 10),
                                                          style: MizzUpTheme.bodyText1.override(
                                                            color: Colors.black,
                                                            fontFamily: 'IBM',
                                                            fontSize: 12,
                                                            useGoogleFonts: false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.6,
                                                      child: Center(
                                                        child: Text(
                                                          textAlign: TextAlign.center,
                                                          comment['comment'].toString(),
                                                          style: MizzUpTheme.bodyText1.override(
                                                            color: Colors.black,
                                                            fontFamily: 'IBM',
                                                            fontSize: 12,
                                                            useGoogleFonts: false,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        //like button
                                                        Row(
                                                          children: [
                                                            Text(
                                                              comment['likes'].length.toString(),
                                                              style: MizzUpTheme.bodyText1.override(
                                                                color: Colors.black,
                                                                fontFamily: 'IBM',
                                                                fontSize: 14,
                                                                useGoogleFonts: false,
                                                              ),
                                                            ),
                                                            ToggleIcon(
                                                              onPressed: () async {
                                                                print(comment.id);
                                                                comment['likes'].contains(user['uid']) ? await unlikeComment(comment.id) : await likeComment(comment.id);
                                                                setState(() {});
                                                              },
                                                              value: comment['likes'].contains(user['uid']),
                                                              onIcon: Icon(Icons.favorite, color: MizzUpTheme.primaryColor),
                                                              offIcon: Icon(Icons.favorite_border, color: MizzUpTheme.primaryColor),
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
                        } else if (reviewsFetched.hasError) {
                          return Text('Erreur: ${reviewsFetched.error}');
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
                              child: LeaveReview(programmeId: widget.detailsProgramme!.reference!.id),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MizzUpTheme.secondaryColor,
                          ),
                          child: const Text('Laisser un avis', style: TextStyle(color: Colors.black, fontSize: 16))),
                    ),
                  ),
                } else ...{
                  if (columnProgrammesRecord.free == true)
                    Align(
                      alignment: const AlignmentDirectional(0.05, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StartProgWidget(
                                  detailsProgramme: columnProgrammesRecord,
                                ),
                              ),
                            );
                          },
                          text: 'Commencer',
                          options: MizzUpOptionButton(
                            width: 130,
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
                      ),
                    ),
                  Visibility(
                    visible: columnProgrammesRecord.free != true,
                    child: Align(
                      alignment: const AlignmentDirectional(0.05, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PreniumWidget(),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                color: MizzUpTheme.secondaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                                child: Text(
                                  'Passer à la version Premium pour accéder aux programmes',
                                  textAlign: TextAlign.center,
                                  style: MizzUpTheme.bodyText1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                },
                if (columnProgrammesRecord.titre == 'Programme Pousse') ...{
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(35, 20, 20, 50),
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
                            style: const TextStyle(decoration: TextDecoration.underline, color: MizzUpTheme.primaryColor, fontWeight: FontWeight.bold),
                          ),
                          // ignore: equal_keys_in_map
                          'link': StyledTextActionTag(
                            (_, attrs) => _openLink(context, attrs),
                            style: const TextStyle(decoration: TextDecoration.underline, color: MizzUpTheme.primaryColor, fontWeight: FontWeight.bold),
                          ),
                          'bold': StyledTextTag(
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            await launchURL('https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
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
                            await launchURL('https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
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
                            await launchURL('https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
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
              ],
            ),
          );
        },
      ),
    );
  }
}

Stream getAllProgramReviews(String programmeId) {
  return FirebaseFirestore.instance.collection('reviews').where('programme_id', isEqualTo: programmeId).snapshots();
}
