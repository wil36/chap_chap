// ignore_for_file: unnecessary_const

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/cuir_chevelu_widget.dart';
import '../components/perte_cheveux_widget.dart';
import '../components/perte_pellicule_widget.dart';
import '../components/routine_widget.dart';
import '../components/style_cheveux_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';

class MonProfilChapWidget extends StatefulWidget {
  const MonProfilChapWidget({Key? key}) : super(key: key);

  @override
  _MonProfilChapWidgetState createState() => _MonProfilChapWidgetState();
}

class _MonProfilChapWidgetState extends State<MonProfilChapWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController hairTypeController = TextEditingController();
  TextEditingController hairObjectiveController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController tikTokController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  List<String> hairTypes = ['Lisses', 'Ondulés', 'Frisés', 'Crépus', 'Bouclés'];
  List<String> hairObjectives = ['Avoir une routine efficace', 'Débuter une transition'];
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
          StreamBuilder<List<CheveuxUserRecord?>>(
            stream: queryCheveuxUserRecord(
              queryBuilder: (cheveuxUserRecord) => cheveuxUserRecord.where('userRef', isEqualTo: currentUserReference),
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
              List<CheveuxUserRecord?>? columnCheveuxUserRecordList = snapshot.data;
              final columnCheveuxUserRecord = columnCheveuxUserRecordList!.isNotEmpty ? columnCheveuxUserRecordList.first : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, -0.85),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
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
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'Modifier mon profil',
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
                    ),
                  ),
                  editProfileInfosFormField(userNameController, currentUserDisplayName, 'Nom d\'utilisateur', true),
                  GestureDetector(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.45,
                                child: const StyleCheveuxWidget(),
                              ),
                            );
                          },
                        );
                      },
                      child: editProfileInfosFormField(hairTypeController, hairTypes[columnCheveuxUserRecord!.styleCheveux!], 'Type de cheveux', false)),
                  editProfileInfosFormField(hairObjectiveController, hairObjectives[columnCheveuxUserRecord!.routineCapillaire!], 'Objectif capilaire', false),
                  editProfileInfosFormField(instagramController, 'Instagram', 'Instagram', true),
                  editProfileInfosFormField(tikTokController, 'TikTok', 'TikTok', true),
                  editProfileInfosFormField(bioController, 'Bio', 'Bio', true),
                  // Padding(
                  //   padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: const BoxDecoration(),
                  //     child: Padding(
                  //       padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //       child: InkWell(
                  //         onTap: () async {
                  //           await showModalBottomSheet(
                  //             isScrollControlled: true,
                  //             context: context,
                  //             builder: (context) {
                  //               return Padding(
                  //                 padding: MediaQuery.of(context).viewInsets,
                  //                 child: SizedBox(
                  //                   height: MediaQuery.of(context).size.height * 0.45,
                  //                   child: const StyleCheveuxWidget(),
                  //                 ),
                  //               );
                  //             },
                  //           );
                  //         },
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //               child: Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Text(
                  //                     'Type de cheveux',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       fontSize: 17,
                  //                       fontWeight: FontWeight.w500,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                   const Icon(
                  //                     Icons.arrow_forward_ios,
                  //                     color: Colors.black,
                  //                     size: 20,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //               child: Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   if (columnCheveuxUserRecord!.styleCheveux! == 0) ...{
                  //                     Text(
                  //                       'Lisses',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 1) ...{
                  //                     Text(
                  //                       'Ondulés',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 2) ...{
                  //                     Text(
                  //                       'Frisés',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 3) ...{
                  //                     Text(
                  //                       'Crépus',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 4) ...{
                  //                     Text(
                  //                       'Bouclés',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const CuirCheveluWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Cuir chevelu',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.cuirCheveulu! == 0) ...{
                  //                   Text(
                  //                     'Sec',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.cuirCheveulu! == 1) ...{
                  //                   Text(
                  //                     'Normal',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.cuirCheveulu! == 2) ...{
                  //                   Text(
                  //                     'Gras',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const PerteCheveuxWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Perte de cheveux',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.perteCheveux! == 0) ...{
                  //                   Text(
                  //                     'Peu',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.perteCheveux! == 1) ...{
                  //                   Text(
                  //                     'Moyen',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.perteCheveux! == 2) ...{
                  //                   Text(
                  //                     'Beaucoup',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const PertePelliculeWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Pellicules',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.pellicules! == 0) ...{
                  //                   Text(
                  //                     'Oui',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.pellicules! == 1) ...{
                  //                   Text(
                  //                     'Non',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const RoutineWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Objectif de routine capillaire',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.routineCapillaire! == 0) ...{
                  //                   Text(
                  //                     'Avoir une routine efficace',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.routineCapillaire! == 1) ...{
                  //                   Text(
                  //                     'Débuter une transition',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget editProfileInfosFormField(TextEditingController controller, String hintText, String helperText, bool needKeyboard) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(helperText),
          TextFormField(
            onTap: () {
              if (needKeyboard) {
                null;
              }
            },
            controller: controller,
            obscureText: false,
            decoration: InputDecoration(
              suffixIcon: controller.text.isEmpty
                  ? InkWell(
                      onTap: () => controller.clear(),
                      child: const Icon(
                        Icons.edit,
                        color: MizzUpTheme.primaryColor,
                        size: 20,
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: MizzUpTheme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              //bottom border
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: MizzUpTheme.primaryColor,
                  width: 1,
                ),
              ),
            ),
            style: const TextStyle(
              color: MizzUpTheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}




//TODO create component that input as the wireframe
//TODO add this component everywhere 
//TODO add the missing fields
//TODO create button Enregistrer mes préférences
//TODO send the data to the DB
//TODO create private mode component
//TODO add text below private mode
//TODO add a private field to the user
//TODO user can change either he's private or not

