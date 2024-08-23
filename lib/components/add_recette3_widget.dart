// ignore_for_file: unnecessary_const

import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';

class AddRecette3Widget extends StatefulWidget {
  const AddRecette3Widget({
    Key? key,
    required this.detailsWeek,
  }) : super(key: key);

  final DetailsWeekProgRecord detailsWeek;

  @override
  _AddRecette3WidgetState createState() => _AddRecette3WidgetState();
}

class _AddRecette3WidgetState extends State<AddRecette3Widget> {
  String? searchKey;
  TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                    fontSize: 18,
                    useGoogleFonts: false,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: MizzUpTheme.secondaryColor,
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
                      const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: MizzUpTheme.primaryColor,
                  ),
                ),
                style: MizzUpTheme.bodyText1.override(
                  fontFamily: 'IBM',
                  color: MizzUpTheme.primaryColor,
                  fontSize: 18,
                  useGoogleFonts: false,
                ),
              ),
            ),
            if (searchKey != null)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: StreamBuilder<DetailsWeekProgRecord?>(
                  stream: DetailsWeekProgRecord.getDocument(
                      widget.detailsWeek.reference!),
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
                    final containerDetailsWeekProgRecord = snapshot.data;
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                        child: StreamBuilder<List<RecettesRecord?>>(
                          stream: queryRecettesRecord(
                            limit: 100,
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
                            List<RecettesRecord?> columnRecettesRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(columnRecettesRecordList.length,
                                      (columnIndex) {
                                final columnRecettesRecord =
                                    columnRecettesRecordList[columnIndex];
                                if (columnRecettesRecord!.titre!
                                    .toUpperCase()
                                    .contains(searchKey!.toUpperCase())) {
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        final detailsWeekProgUpdateData =
                                            createDetailsWeekProgRecordData(
                                          recette3:
                                              columnRecettesRecord.reference!,
                                        );
                                        await containerDetailsWeekProgRecord!
                                            .reference!
                                            .update(detailsWeekProgUpdateData);
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(20, 0, 0, 20),
                                            child: SizedBox(
                                              width: 330,
                                              child: Text(
                                                columnRecettesRecord.titre!,
                                                style: MizzUpTheme.bodyText1,
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
                            );
                          },
                        ),
                      ),
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
