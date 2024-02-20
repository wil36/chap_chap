import 'package:chap_chap/MizzUp_Code/MizzUp_icon_button.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_widgets.dart';
import 'package:chap_chap/auth/auth_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_text/styled_text.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../backend/backend.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class MonProgramWidget extends StatefulWidget {
  const MonProgramWidget({Key? key}) : super(key: key);

  @override
  _MonProgramWidgetState createState() => _MonProgramWidgetState();
}

class _MonProgramWidgetState extends State<MonProgramWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void _openLink(BuildContext context, Map<String?, String?> attrs) async {
    final String? link = attrs['href'];
    await launchURL('$link');
  }

  DocumentReference semaineSpecial0 = FirebaseFirestore.instance
      .collection('detailsWeekProg')
      .doc('HrB5csYvIUaIGytdhVl0');
  DocumentReference semaineSpecial1 = FirebaseFirestore.instance
      .collection('programmes')
      .doc('0nDyRIL1Qg9u90Vzt5Ho');
  DocumentReference semaineSpecial2 = FirebaseFirestore.instance
      .collection('programmes')
      .doc('BFUA4QdhoxRMdAReXPyh');
  DocumentReference semaineSpecial3 = FirebaseFirestore.instance
      .collection('programmes')
      .doc('TMqv6WGZkkMDh6nik4JB');

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          SizedBox(height: 30,),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MizzUpIconButton(
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 0, 0, 0),
                        child: Text(
                          'Mon programme',
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
                  if (currentUserDocument?.progRef == semaineSpecial1)
                    AuthUserStreamWidget(
                      child: StreamBuilder<ProgrammesRecord?>(
                        stream: ProgrammesRecord.getDocument(
                            currentUserDocument!.progRef!),
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
                          final columnProgrammesRecord = snapshot.data;
                          final textDescription = columnProgrammesRecord!
                              .description!
                              .replaceAll('\\n', '\n');
                          final textAvantages = columnProgrammesRecord
                              .listeAvantages!
                              .replaceAll('\\n', '\n');
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
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
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String?>(
                                          columnProgrammesRecord
                                              .imagePrincipale,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/vst88wzt4amf/Rectangle_13_(6).png',
                                        )!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 0, 0),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 20, 0),
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
                                        debugPrint('IconButton pressed ...');
                                      },
                                    ),
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    50, 20, 20, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 20, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 20, 0),
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
                              const SizedBox(
                                height: 40,
                                width: double.infinity,
                              ),
                              if (columnProgrammesRecord.titre ==
                                  'Programme Pousse') ...{
                                Align(
                                  alignment: const AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            35, 20, 20, 50),
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
                                              decoration:
                                                  TextDecoration.underline,
                                              color: MizzUpTheme.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: equal_keys_in_map
                                        'link': StyledTextActionTag(
                                          (_, attrs) =>
                                              _openLink(context, attrs),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await launchURL(
                                              'https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
                                        },
                                        child: Image.asset(
                                          'assets/images/madamePresidenteLogo.png',
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
                                const SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                ),
                              },
                            ],
                          );
                        },
                      ),
                    ),
                  if (currentUserDocument?.progRef == semaineSpecial2)
                    AuthUserStreamWidget(
                      child: StreamBuilder<ProgrammesRecord?>(
                        stream: ProgrammesRecord.getDocument(
                            currentUserDocument!.progRef!),
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
                          final columnProgrammesRecord = snapshot.data;
                          final textDescription = columnProgrammesRecord!
                              .description!
                              .replaceAll('\\n', '\n');
                          final textAvantages = columnProgrammesRecord
                              .listeAvantages!
                              .replaceAll('\\n', '\n');
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
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
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String?>(
                                          columnProgrammesRecord
                                              .imagePrincipale,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/vst88wzt4amf/Rectangle_13_(6).png',
                                        )!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 0, 0),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 20, 0),
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
                                        debugPrint('IconButton pressed ...');
                                      },
                                    ),
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    50, 20, 20, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 20, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 20, 0),
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
                              const SizedBox(
                                height: 40,
                                width: double.infinity,
                              ),
                              if (columnProgrammesRecord.titre ==
                                  'Programme Pousse') ...{
                                Align(
                                  alignment: const AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            35, 20, 20, 50),
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
                                              decoration:
                                                  TextDecoration.underline,
                                              color: MizzUpTheme.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: equal_keys_in_map
                                        'link': StyledTextActionTag(
                                          (_, attrs) =>
                                              _openLink(context, attrs),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await launchURL(
                                              'https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
                                        },
                                        child: Image.asset(
                                          'assets/images/madamePresidenteLogo.png',
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
                                const SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                ),
                              },
                            ],
                          );
                        },
                      ),
                    ),
                  if (currentUserDocument?.progRef == semaineSpecial3)
                    AuthUserStreamWidget(
                      child: StreamBuilder<ProgrammesRecord?>(
                        stream: ProgrammesRecord.getDocument(
                            currentUserDocument!.progRef!),
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
                          final columnProgrammesRecord = snapshot.data;
                          final textDescription = columnProgrammesRecord!
                              .description!
                              .replaceAll('\\n', '\n');
                          final textAvantages = columnProgrammesRecord
                              .listeAvantages!
                              .replaceAll('\\n', '\n');
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
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
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String?>(
                                          columnProgrammesRecord
                                              .imagePrincipale,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/vst88wzt4amf/Rectangle_13_(6).png',
                                        )!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 0, 0),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 20, 0),
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
                                        debugPrint('IconButton pressed ...');
                                      },
                                    ),
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    50, 20, 20, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 20, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 20, 20, 0),
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
                              const SizedBox(
                                height: 40,
                                width: double.infinity,
                              ),
                              if (columnProgrammesRecord.titre ==
                                  'Programme Pousse') ...{
                                Align(
                                  alignment: const AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            35, 20, 20, 50),
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
                                              decoration:
                                                  TextDecoration.underline,
                                              color: MizzUpTheme.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: equal_keys_in_map
                                        'link': StyledTextActionTag(
                                          (_, attrs) =>
                                              _openLink(context, attrs),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await launchURL(
                                              'https://madamelapresidente.fr/e-shop/?gclid=EAIaIQobChMIvIuU0aag9gIVkgwGAB38IwvdEAAYASAAEgJOXvD_BwE');
                                        },
                                        child: Image.asset(
                                          'assets/images/madamePresidenteLogo.png',
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
                                const SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                ),
                              },
                            ],
                          );
                        },
                      ),
                    ),
                  if (currentUserDocument?.progRef == semaineSpecial0)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 20, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tu n\'as pas de programmes en cours',
                                style: MizzUpTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavBarPage(index: 0)),
                                (r) => false,
                              );
                            },
                            text: 'Découvrir les programmes',
                            options: MizzUpOptionButton(
                              width: 290,
                              height: 40,
                              color: MizzUpTheme.secondaryColor,
                              textStyle: MizzUpTheme.subtitle2.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                useGoogleFonts: false,
                              ),
                              elevation: 5,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (currentUserDocument?.progRef == null)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 20, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tu n\'as pas de programmes en cours',
                                style: MizzUpTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavBarPage(index: 0)),
                                (r) => false,
                              );
                            },
                            text: 'Découvrir les programmes',
                            options: MizzUpOptionButton(
                              width: 290,
                              height: 40,
                              color: MizzUpTheme.secondaryColor,
                              textStyle: MizzUpTheme.subtitle2.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                useGoogleFonts: false,
                              ),
                              elevation: 5,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
