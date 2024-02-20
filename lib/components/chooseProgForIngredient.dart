// ignore_for_file: file_names

import 'package:chap_chap/MizzUp_Code/MizzUp_icon_button.dart' show MizzUpIconButton;
import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';

import '../backend/backend.dart';
import '../components/ajout_ingredient_widget.dart';
import 'package:flutter/material.dart';

class ConfigProgForIngredient extends StatefulWidget {
  const ConfigProgForIngredient({Key? key}) : super(key: key);

  @override
  _ConfigProgForIngredientState createState() => _ConfigProgForIngredientState();
}

class _ConfigProgForIngredientState extends State<ConfigProgForIngredient> {
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Text(
                'Choisissez le programme à configurer',
                style: MizzUpTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: StreamBuilder<List<ProgrammesRecord?>>(
                stream: queryProgrammesRecord(),
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
                  List<ProgrammesRecord?> columnProgrammesRecordList =
                      snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(columnProgrammesRecordList.length,
                        (columnIndex) {
                      final columnProgrammesRecord =
                          columnProgrammesRecordList[columnIndex];
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child:  AjoutIngredientWidget(thisProg: columnProgrammesRecord.reference!),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                columnProgrammesRecord!.titre!,
                                style: MizzUpTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
