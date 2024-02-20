import 'package:chap_chap/main.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_recette1_widget.dart';
import '../components/add_recette2_widget.dart';
import '../components/add_recette3_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../profil/profil_widget.dart';
import 'package:flutter/material.dart';

class ConfigProgSuite2Widget extends StatefulWidget {
  const ConfigProgSuite2Widget({Key? key}) : super(key: key);

  @override
  _ConfigProgSuite2WidgetState createState() => _ConfigProgSuite2WidgetState();
}

class _ConfigProgSuite2WidgetState extends State<ConfigProgSuite2Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: StreamBuilder<List<DetailsWeekProgRecord?>>(
        stream: queryDetailsWeekProgRecord(
          queryBuilder: (detailsWeekProgRecord) => detailsWeekProgRecord
              .where('userRef', isEqualTo: currentUserReference)
              .orderBy('create_time', descending: true),
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
          List<DetailsWeekProgRecord?> containerDetailsWeekProgRecordList =
              snapshot.data!;
          final containerDetailsWeekProgRecord =
              containerDetailsWeekProgRecordList.isNotEmpty
                  ? containerDetailsWeekProgRecordList.first
                  : null;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
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
                              await containerDetailsWeekProgRecord!.reference!
                                  .delete();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfilWidget(),
                                ),
                                (r) => false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: AddRecette1Widget(
                                  detailsWeek: containerDetailsWeekProgRecord!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: 'Recette 1',
                      icon: const Icon(
                        Icons.add,
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
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: AddRecette2Widget(
                                  detailsWeek: containerDetailsWeekProgRecord!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: 'Recette 2',
                      icon: const Icon(
                        Icons.add,
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
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: AddRecette3Widget(
                                  detailsWeek: containerDetailsWeekProgRecord!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: 'Recette 3',
                      icon: const Icon(
                        Icons.add,
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
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavBarPage(index: 4),
                          ),
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
    );
  }
}
