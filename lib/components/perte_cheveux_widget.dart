import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

class PerteCheveuxWidget extends StatefulWidget {
  const PerteCheveuxWidget({Key? key}) : super(key: key);

  @override
  _PerteCheveuxWidgetState createState() => _PerteCheveuxWidgetState();
}

class _PerteCheveuxWidgetState extends State<PerteCheveuxWidget> {
  int? defaultChoiceIndex;
  final List<String> _choicesList = ['Peu', 'Moyen', 'Beaucoup'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MizzUpIconButton(
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
              ],
            ),
          ),
          StreamBuilder<List<CheveuxUserRecord?>>(
            stream: queryCheveuxUserRecord(
              queryBuilder: (cheveuxUserRecord) => cheveuxUserRecord
                  .where('userRef', isEqualTo: currentUserReference),
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
              List<CheveuxUserRecord?> columnCheveuxUserRecordList =
                  snapshot.data!;
              final columnCheveuxUserRecord =
                  columnCheveuxUserRecordList.isNotEmpty
                      ? columnCheveuxUserRecordList.first!
                      : null;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.55, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Text(
                        'Par rapport à la perte de cheveux, tu dirais que tu perds :',
                        textAlign: TextAlign.start,
                        style: MizzUpTheme.bodyText1.override(
                          fontFamily: 'IBM',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
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
                                  MediaQuery.of(context).size.width * 0.1),
                        );
                      }),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.05, -1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final cheveuxUserUpdateData =
                              createCheveuxUserRecordData(
                            perteCheveux: defaultChoiceIndex,
                          );
                          await columnCheveuxUserRecord!.reference!
                              .update(cheveuxUserUpdateData);
                          Navigator.pop(context);
                        },
                        text: 'Valider',
                        options: MizzUpOptionButton(
                          width: 130,
                          height: 30,
                          color: MizzUpTheme.secondaryColor,
                          textStyle: MizzUpTheme.title2.override(
                            fontFamily: 'IBM',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
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
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
