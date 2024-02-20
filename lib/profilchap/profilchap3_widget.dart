import 'package:flutter_svg/flutter_svg.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'profilchap4_widget.dart';
import 'package:flutter/material.dart';

class Profilchap3Widget extends StatefulWidget {
  const Profilchap3Widget({
    Key? key,
    this.detailUser,
  }) : super(key: key);

  final CheveuxUserRecord? detailUser;

  @override
  _Profilchap3WidgetState createState() => _Profilchap3WidgetState();
}

class _Profilchap3WidgetState extends State<Profilchap3Widget> {
  int? defaultChoiceIndex;
  final List<String> _choicesList = ['Sec', 'Normal', 'Gras'];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF9E8DE),
      body: Align(
        alignment: const AlignmentDirectional(-0.05, 0),
        child: StreamBuilder<CheveuxUserRecord?>(
          stream: CheveuxUserRecord.getDocument(widget.detailUser!.reference!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: MizzUpTheme.primaryColor,
                  ),
                ),
              );
            }
            final columnCheveuxUserRecord = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Text(
                        'Ton profil Chap Chap',
                        style: MizzUpTheme.title1.override(
                          fontFamily: 'IBM',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(50, 0, 50, 20),
                      child: Text(
                        'Pour t\'aider à trouver les soins qui te conviennent, nous avons besoin de mieux te connaître.',
                        textAlign: TextAlign.center,
                        style: MizzUpTheme.bodyText2.override(
                          fontFamily: 'IBM',
                          color: Colors.black,
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, -1),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                        child: Text(
                          'Question 3 sur 6',
                          textAlign: TextAlign.start,
                          style: MizzUpTheme.bodyText2.override(
                            fontFamily: 'IBM',
                            color: Colors.black,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.2,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: const Color(0xFF844631),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 5,
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.01,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFF844631),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(2),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: const AlignmentDirectional(
                                0.19999999999999996, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, -1),
                  child: SizedBox(
                    width: 365,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                      child: Text(
                        'Ton cuir chevelu est plutôt :',
                        style: MizzUpTheme.bodyText1.override(
                          fontFamily: 'IBM',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
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
                                  MediaQuery.of(context).size.width * 0.1),
                        );
                      }),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final cheveuxUserUpdateData = createCheveuxUserRecordData(
                        cuirCheveulu: defaultChoiceIndex,
                      );
                      await columnCheveuxUserRecord.reference!
                          .update(cheveuxUserUpdateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profilchap4Widget(
                            detailUser: columnCheveuxUserRecord,
                          ),
                        ),
                      );
                    },
                    text: 'Valider',
                    options: MizzUpOptionButton(
                      width: 130,
                      height: 40,
                      color: MizzUpTheme.secondaryColor,
                      textStyle: MizzUpTheme.title2.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
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
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Retour',
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 15,
                      ),
                      options: MizzUpOptionButton(
                        width: 130,
                        height: 40,
                        color: const Color(0xFFF9E8DE),
                        textStyle: MizzUpTheme.subtitle2.override(
                          fontFamily: 'IBM',
                          color: const Color(0xFF844631),
                          useGoogleFonts: false,
                        ),
                        elevation: 0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/images/FORME2.svg',
                  width: 280,
                  height: 200,
                  fit: BoxFit.cover,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
