import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/config_prog_suite2_widget.dart';
import '../MizzUp_Code/MizzUp_count_controller.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigProgSuiteWidget extends StatefulWidget {
  const ConfigProgSuiteWidget({
    Key? key,
    this.detailsProgramme,
  }) : super(key: key);

  final ProgrammesRecord? detailsProgramme;

  @override
  _ConfigProgSuiteWidgetState createState() => _ConfigProgSuiteWidgetState();
}

class _ConfigProgSuiteWidgetState extends State<ConfigProgSuiteWidget> {
  TextEditingController? texte1Controller;
  int? countControllerValue;
  TextEditingController? texte2Controller;
  TextEditingController? titre1Controller;
  TextEditingController? titre2Controller;
  TextEditingController? titre3Controller;

  @override
  void initState() {
    super.initState();
    texte1Controller = TextEditingController();
    texte2Controller = TextEditingController();
    titre1Controller = TextEditingController();
    titre2Controller = TextEditingController();
    titre3Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: StreamBuilder<ProgrammesRecord?>(
            stream: ProgrammesRecord.getDocument(
                widget.detailsProgramme!.reference!),
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
              final containerProgrammesRecord = snapshot.data;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 20, 0),
                              child: MizzUpIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: MizzUpTheme.secondaryColor,
                                icon: const Icon(
                                  Icons.close,
                                  color: MizzUpTheme.primaryColor,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Text(
                          'Saisissez le numéro de la semaine',
                          style: MizzUpTheme.bodyText1,
                        ),
                      ),
                      Container(
                        width: 150,
                        decoration: const BoxDecoration(),
                        child: Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF9E9E9E),
                              width: 1,
                            ),
                          ),
                          child: MizzUpCountController(
                            decrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.minus,
                              color: enabled
                                  ? const Color(0xDD000000)
                                  : const Color(0xFFEEEEEE),
                              size: 20,
                            ),
                            incrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.plus,
                              color: enabled
                                  ? MizzUpTheme.primaryColor
                                  : const Color(0xFFEEEEEE),
                              size: 20,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            count: countControllerValue ??= 0,
                            updateCount: (count) =>
                                setState(() => countControllerValue = count),
                            stepSize: 1,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 20),
                          child: TextFormField(
                            controller: texte1Controller,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Texte 1',
                              labelStyle: MizzUpTheme.bodyText1,
                              hintText: 'Rédigez le texte en haut du programme',
                              hintStyle: MizzUpTheme.bodyText1,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: MizzUpTheme.bodyText1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 20),
                          child: TextFormField(
                            controller: texte2Controller,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Texte 2',
                              labelStyle: MizzUpTheme.bodyText1,
                              hintText: 'Rédigez le texte en bas du programme',
                              hintStyle: MizzUpTheme.bodyText1,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: MizzUpTheme.bodyText1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 20),
                          child: TextFormField(
                            controller: titre1Controller,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Titre Etape 1',
                              labelStyle: MizzUpTheme.bodyText1,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: MizzUpTheme.bodyText1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 20),
                          child: TextFormField(
                            controller: titre2Controller,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Titre Etape 2',
                              labelStyle: MizzUpTheme.bodyText1,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: MizzUpTheme.bodyText1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 20),
                          child: TextFormField(
                            controller: titre3Controller,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Titre Etape Facultative',
                              labelStyle: MizzUpTheme.bodyText1,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MizzUpTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: MizzUpTheme.bodyText1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final detailsWeekProgCreateData =
                                createDetailsWeekProgRecordData(
                              createTime: getCurrentTimestamp,
                              progRef: containerProgrammesRecord!.reference,
                              userRef: currentUserReference,
                              semaineNumero: countControllerValue,
                              texte1: texte1Controller!.text,
                              texte2: texte2Controller!.text,
                              titreEtape1: titre1Controller!.text,
                              titreEtape2: titre2Controller!.text,
                              titreEtape3: titre3Controller!.text,
                            );
                            await DetailsWeekProgRecord.collection
                                .doc()
                                .set(detailsWeekProgCreateData);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: const ConfigProgSuite2Widget(),
                                  ),
                                );
                              },
                            );
                          },
                          text: 'Valider',
                          options: MizzUpOptionButton(
                            width: 130,
                            height: 40,
                            color: MizzUpTheme.secondaryColor,
                            textStyle: MizzUpTheme.subtitle2.override(
                              fontFamily: 'IBM',
                              color: MizzUpTheme.primaryColor,
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
                ),
              );
            },
          ),
        ),
      );
}
