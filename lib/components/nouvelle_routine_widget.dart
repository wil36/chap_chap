import 'package:chap_chap/notification/notifcontroller.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../MizzUp_Code/MizzUp_drop_down.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class NouvelleRoutineWidget extends StatefulWidget {
  const NouvelleRoutineWidget({Key? key}) : super(key: key);

  @override
  _NouvelleRoutineWidgetState createState() => _NouvelleRoutineWidgetState();
}

class _NouvelleRoutineWidgetState extends State<NouvelleRoutineWidget> {
  String? recurrenceValue = 'Tous les mois';
  bool? apresShampoingValue;
  bool? coWashValue;
  bool? shampoingClarifiantValue;
  bool? soinNourissantValue;
  bool? shampoingDouxValue;
  bool? noPooValue;
  bool? soinHydratantValue;
  bool? soinProteineValue;
  bool? alerteValue;
  bool? isLoading;
  TextEditingController? notesController;
  String uploadedFileUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/xfp9uviaxwrd/AdobeStock_357513514.jpeg';
  DateTime datePicked = DateTime.now();
  Future<void> selectTimePicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      locale: const Locale('fr', 'FR'),
      initialDate: datePicked,
      firstDate: DateTime(1940),
      lastDate: DateTime(2030),
    );
    if (picker != null && picker != datePicked) {
      setState(() {
        datePicked = DateTime(
          picker.year,
          picker.month,
          picker.day,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    notesController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: MizzUpTheme.tertiaryColor,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 40, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Annuler',
                                        style: MizzUpTheme.bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Nouvelle routine',
                                      style: MizzUpTheme.title1.override(
                                        fontFamily: 'Avenir Next Bold',
                                        color: Colors.black,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 40, 20, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Choix du type de routine',
                                      style: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'Avenir Book',
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: soinNourissantValue ??= false,
                                        onChanged: (newValue) => setState(() =>
                                            soinNourissantValue = newValue),
                                        title: Text(
                                          'Soin nourissant / Bain d\'huile',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: shampoingClarifiantValue ??=
                                            false,
                                        onChanged: (newValue) => setState(() =>
                                            shampoingClarifiantValue =
                                                newValue),
                                        title: Text(
                                          'Shampoing clarifiant',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: shampoingDouxValue ??= false,
                                        onChanged: (newValue) => setState(() =>
                                            shampoingDouxValue = newValue),
                                        title: Text(
                                          'Shampoing doux',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: coWashValue ??= false,
                                        onChanged: (newValue) => setState(
                                            () => coWashValue = newValue),
                                        title: Text(
                                          'Co-wash',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: noPooValue ??= false,
                                        onChanged: (newValue) => setState(
                                            () => noPooValue = newValue),
                                        title: Text(
                                          'No-poo',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: apresShampoingValue ??= false,
                                        onChanged: (newValue) => setState(() =>
                                            apresShampoingValue = newValue),
                                        title: Text(
                                          'Après-shampoing',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: soinHydratantValue ??= false,
                                        onChanged: (newValue) => setState(() =>
                                            soinHydratantValue = newValue),
                                        title: Text(
                                          'Soin hydratant',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        value: soinProteineValue ??= false,
                                        onChanged: (newValue) => setState(
                                            () => soinProteineValue = newValue),
                                        title: Text(
                                          'Soin protéiné',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                        tileColor: Colors.black,
                                        activeColor: Colors.black,
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Récurrence',
                                      style: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'Avenir Book',
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                        fontSize: 18,
                                      ),
                                    ),
                                    MizzUpDropDown(
                                      initialOption: recurrenceValue,
                                      options: [
                                        "Seulement aujourd'hui",
                                        'Tous les jours',
                                        'Toutes les semaines',
                                        'Toutes les deux semaines',
                                        'Tous les mois',
                                      ].toList(),
                                      onChanged: (val) =>
                                          setState(() => recurrenceValue = val),
                                      width: 150,
                                      height: 50,
                                      textStyle: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'Avenir Book',
                                        color: Colors.black,
                                        useGoogleFonts: false,
                                      ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 0,
                                      margin:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5, 0, 25, 0),
                                      child: SwitchListTile(
                                        value: alerteValue ??= false,
                                        onChanged: (newValue) => setState(
                                            () => alerteValue = newValue),
                                        title: Text(
                                          'Alerte',
                                          style: MizzUpTheme.bodyText1.override(
                                            fontFamily: 'Avenir Book',
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                            fontSize: 18,
                                          ),
                                        ),
                                        tileColor: const Color(0xFFF5F5F5),
                                        activeColor: MizzUpTheme.primaryColor,
                                        activeTrackColor:
                                            MizzUpTheme.secondaryColor,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(20, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 0, 25, 0),
                                child: TextFormField(
                                  controller: notesController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Notes',
                                    hintStyle: MizzUpTheme.bodyText1,
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MizzUpTheme.primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MizzUpTheme.primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: MizzUpTheme.bodyText1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 20, 35, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ajouter une photo',
                                          style: MizzUpTheme.title1.override(
                                            fontFamily: 'Avenir Next Bold',
                                            color: Colors.black,
                                            fontSize: 19,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                        Text(
                                          '(facultatif)',
                                          style: MizzUpTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Stack(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  uploadedFileUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/yz35y49ty7nt/1200px-Fond_blanc.svg.png',
                                                ),
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color: const Color(0x82000000),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            MizzUpIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 0,
                                              buttonSize: 40,
                                              icon: const Icon(
                                                Icons.add_sharp,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    validateFileFormat(
                                                        selectedMedia
                                                            .storagePath,
                                                        context)) {
                                                  showUploadMessage(context,
                                                      'Chargement de votre photo...',
                                                      showLoading: true);
                                                  final downloadUrl =
                                                      await uploadData(
                                                          selectedMedia
                                                              .storagePath,
                                                          selectedMedia.bytes);
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  if (downloadUrl != null) {
                                                    setState(() =>
                                                        uploadedFileUrl =
                                                            downloadUrl);
                                                    showUploadMessage(
                                                        context, 'Succès !');
                                                  } else {
                                                    showUploadMessage(context,
                                                        "Impossible de charger votre photo");
                                                    return;
                                                  }
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 10, 35, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Quand débuter ?',
                                      style: MizzUpTheme.title1.override(
                                        fontFamily: 'Avenir Next Bold',
                                        color: Colors.black,
                                        fontSize: 19,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                    MizzUpIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: MizzUpTheme.secondaryColor,
                                      icon: const FaIcon(
                                        FontAwesomeIcons.calendarPlus,
                                        color: MizzUpTheme.primaryColor,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        await selectTimePicker(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((recurrenceValue) == 'Tous les jours')
                                    InkWell(
                                      onTap: () async {
                                        if (datePicked !=
                                            DateTime(
                                              datePicked.year,
                                              datePicked.month,
                                              datePicked.day,
                                            )) {
                                          await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Aucune date n\'a été choisie'),
                                                  content: const Text(
                                                      'Rajoute une date à ta routine avant de continuer'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
                                           setState(() {
                                            isLoading = true;
                                          });
                                          final routinesCreateData = {
                                            ...createRoutinesRecordData(
                                              createTime: getCurrentTimestamp,
                                              userRef: currentUserReference,
                                              soinNourissant:
                                                  (soinNourissantValue) == true,
                                              shampoingClarifiant:
                                                  (shampoingClarifiantValue) ==
                                                      true,
                                              shampoingDoux:
                                                  (shampoingDouxValue) == true,
                                              coWash: (coWashValue) == true,
                                              noPoo: (noPooValue) == true,
                                              apresShampoing:
                                                  (apresShampoingValue) == true,
                                              soinHydratant:
                                                  (soinHydratantValue) == true,
                                              soinProteine:
                                                  (soinProteineValue) == true,
                                              recurrence: recurrenceValue,
                                              alerte: (alerteValue) == true,
                                              notes: notesController!.text,
                                              photo1: uploadedFileUrl,
                                            ),
                                            'reccurenceTime':
                                                await dailyReccurenceList(
                                                    datePicked)
                                          };
                                          await RoutinesRecord.collection
                                              .doc()
                                              .set(routinesCreateData);
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBarPage(index: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          width: 250,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: MizzUpTheme.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: MizzUpTheme.secondaryColor,
                                              width: 0,
                                            ),
                                          ),
                                          child: Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    MizzUpTheme.secondaryColor,
                                                width: 0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Text(
                                                'Ajouter',
                                                textAlign: TextAlign.center,
                                                style: MizzUpTheme.subtitle2
                                                    .override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((recurrenceValue) ==
                                      'Toutes les semaines')
                                    InkWell(
                                      onTap: () async {
                                        if (datePicked !=
                                            DateTime(
                                              datePicked.year,
                                              datePicked.month,
                                              datePicked.day,
                                            )) {
                                          await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Aucune date n\'a été choisie'),
                                                  content: const Text(
                                                      'Rajoute une date à ta routine avant de continuer'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
                                           setState(() {
                                            isLoading = true;
                                          });
                                          final routinesCreateData = {
                                            ...createRoutinesRecordData(
                                              createTime: getCurrentTimestamp,
                                              userRef: currentUserReference,
                                              soinNourissant:
                                                  (soinNourissantValue) == true,
                                              shampoingClarifiant:
                                                  (shampoingClarifiantValue) ==
                                                      true,
                                              shampoingDoux:
                                                  (shampoingDouxValue) == true,
                                              coWash: (coWashValue) == true,
                                              noPoo: (noPooValue) == true,
                                              apresShampoing:
                                                  (apresShampoingValue) == true,
                                              soinHydratant:
                                                  (soinHydratantValue) == true,
                                              soinProteine:
                                                  (soinProteineValue) == true,
                                              recurrence: recurrenceValue,
                                              alerte: (alerteValue) == true,
                                              notes: notesController!.text,
                                              photo1: uploadedFileUrl,
                                            ),
                                            'reccurenceTime':
                                                await weeklyReccurenceList(
                                                    datePicked)
                                          };
                                          await RoutinesRecord.collection
                                              .doc()
                                              .set(routinesCreateData);
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBarPage(index: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          width: 250,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: MizzUpTheme.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: MizzUpTheme.secondaryColor,
                                              width: 0,
                                            ),
                                          ),
                                          child: Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    MizzUpTheme.secondaryColor,
                                                width: 0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Text(
                                                'Ajouter',
                                                textAlign: TextAlign.center,
                                                style: MizzUpTheme.subtitle2
                                                    .override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((recurrenceValue) ==
                                      'Toutes les deux semaines')
                                    InkWell(
                                      onTap: () async {
                                        if (datePicked !=
                                            DateTime(
                                              datePicked.year,
                                              datePicked.month,
                                              datePicked.day,
                                            )) {
                                          await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Aucune date n\'a été choisie'),
                                                  content: const Text(
                                                      'Rajoute une date à ta routine avant de continuer'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          final routinesCreateData = {
                                            ...createRoutinesRecordData(
                                              createTime: getCurrentTimestamp,
                                              userRef: currentUserReference,
                                              soinNourissant:
                                                  (soinNourissantValue) == true,
                                              shampoingClarifiant:
                                                  (shampoingClarifiantValue) ==
                                                      true,
                                              shampoingDoux:
                                                  (shampoingDouxValue) == true,
                                              coWash: (coWashValue) == true,
                                              noPoo: (noPooValue) == true,
                                              apresShampoing:
                                                  (apresShampoingValue) == true,
                                              soinHydratant:
                                                  (soinHydratantValue) == true,
                                              soinProteine:
                                                  (soinProteineValue) == true,
                                              recurrence: recurrenceValue,
                                              alerte: (alerteValue) == true,
                                              notes: notesController!.text,
                                              photo1: uploadedFileUrl,
                                            ),
                                            'reccurenceTime':
                                                await halfMonthlyReccurenceList(
                                                    datePicked)
                                          };
                                          await RoutinesRecord.collection
                                              .doc()
                                              .set(routinesCreateData);
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBarPage(index: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          width: 250,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: MizzUpTheme.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: MizzUpTheme.secondaryColor,
                                              width: 0,
                                            ),
                                          ),
                                          child: Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    MizzUpTheme.secondaryColor,
                                                width: 0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Text(
                                                'Ajouter',
                                                textAlign: TextAlign.center,
                                                style: MizzUpTheme.subtitle2
                                                    .override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((recurrenceValue) == 'Tous les mois')
                                    InkWell(
                                      onTap: () async {
                                        if (datePicked !=
                                            DateTime(
                                              datePicked.year,
                                              datePicked.month,
                                              datePicked.day,
                                            )) {
                                          await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Aucune date n\'a été choisie'),
                                                  content: const Text(
                                                      'Rajoute une date à ta routine avant de continuer'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
                                           setState(() {
                                            isLoading = true;
                                          });
                                          final routinesCreateData = {
                                            ...createRoutinesRecordData(
                                              createTime: getCurrentTimestamp,
                                              userRef: currentUserReference,
                                              soinNourissant:
                                                  (soinNourissantValue) == true,
                                              shampoingClarifiant:
                                                  (shampoingClarifiantValue) ==
                                                      true,
                                              shampoingDoux:
                                                  (shampoingDouxValue) == true,
                                              coWash: (coWashValue) == true,
                                              noPoo: (noPooValue) == true,
                                              apresShampoing:
                                                  (apresShampoingValue) == true,
                                              soinHydratant:
                                                  (soinHydratantValue) == true,
                                              soinProteine:
                                                  (soinProteineValue) == true,
                                              recurrence: recurrenceValue,
                                              alerte: (alerteValue) == true,
                                              notes: notesController!.text,
                                              photo1: uploadedFileUrl,
                                            ),
                                            'reccurenceTime':
                                                await monthlyReccurenceList(
                                                    datePicked)
                                          };

                                          await RoutinesRecord.collection
                                              .doc()
                                              .set(routinesCreateData);
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBarPage(index: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          width: 250,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: MizzUpTheme.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: MizzUpTheme.secondaryColor,
                                              width: 0,
                                            ),
                                          ),
                                          child: Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    MizzUpTheme.secondaryColor,
                                                width: 0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Text(
                                                'Ajouter',
                                                textAlign: TextAlign.center,
                                                style: MizzUpTheme.subtitle2
                                                    .override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((recurrenceValue) ==
                                      "Seulement aujourd'hui")
                                    InkWell(
                                      onTap: () async {
                                        if (datePicked !=
                                            DateTime(
                                              datePicked.year,
                                              datePicked.month,
                                              datePicked.day,
                                            )) {
                                          await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Aucune date n\'a été choisie'),
                                                  content: const Text(
                                                      'Rajoute une date à ta routine avant de continuer'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
                                           setState(() {
                                            isLoading = true;
                                          });
                                          final routinesCreateData = {
                                            ...createRoutinesRecordData(
                                              createTime: getCurrentTimestamp,
                                              userRef: currentUserReference,
                                              soinNourissant:
                                                  (soinNourissantValue) == true,
                                              shampoingClarifiant:
                                                  (shampoingClarifiantValue) ==
                                                      true,
                                              shampoingDoux:
                                                  (shampoingDouxValue) == true,
                                              coWash: (coWashValue) == true,
                                              noPoo: (noPooValue) == true,
                                              apresShampoing:
                                                  (apresShampoingValue) == true,
                                              soinHydratant:
                                                  (soinHydratantValue) == true,
                                              soinProteine:
                                                  (soinProteineValue) == true,
                                              recurrence: recurrenceValue,
                                              alerte: (alerteValue) == true,
                                              notes: notesController!.text,
                                              photo1: uploadedFileUrl,
                                            ),
                                            'reccurenceTime':
                                                await oneReccurence(datePicked)
                                          };

                                          await RoutinesRecord.collection
                                              .doc()
                                              .set(routinesCreateData);
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBarPage(index: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          width: 250,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: MizzUpTheme.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: MizzUpTheme.secondaryColor,
                                              width: 0,
                                            ),
                                          ),
                                          child: Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    MizzUpTheme.secondaryColor,
                                                width: 0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Text(
                                                'Ajouter',
                                                textAlign: TextAlign.center,
                                                style: MizzUpTheme.subtitle2
                                                    .override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Container(
                                    height: 100,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (isLoading == true)
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0x5B000000),
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        color: MizzUpTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );

  Future<List> dailyReccurenceList(DateTime datePicked) async {
    List tmp = [];
    for (var i = 0; i < 365; i++) {
      DateTime date = datePicked.add(Duration(days: i));
      tmp.add(date);
      if (alerteValue == true) {
        await NotifController().subscribeToRoutineProgram(date);
      }
    }
    return tmp;
  }

  Future<List> weeklyReccurenceList(DateTime datePicked) async {
    List tmp = [];
    for (var i = 0; i < 365; i += 7) {
      DateTime date = datePicked.add(Duration(days: i));
      tmp.add(date);
      if (alerteValue == true) {
        await NotifController().subscribeToRoutineProgram(date);
      }
    }
    return tmp;
  }

  Future<List> halfMonthlyReccurenceList(DateTime datePicked) async {
    List tmp = [];
    for (var i = 0; i < 365; i += 14) {
      DateTime date = datePicked.add(Duration(days: i));
      tmp.add(date);
      if (alerteValue == true) {
        await NotifController().subscribeToRoutineProgram(date);
      }
    }
    return tmp;
  }

  Future<List> monthlyReccurenceList(DateTime datePicked) async {
    List tmp = [];
    for (var i = 0; i < 365; i += 28) {
      DateTime date = datePicked.add(Duration(days: i));
      tmp.add(date);
      if (alerteValue == true) {
        await NotifController().subscribeToRoutineProgram(date);
      }
    }
    return tmp;
  }

  Future<List> oneReccurence(DateTime datePicked) async {
    List tmp = [];
    DateTime date = datePicked;
    tmp.add(date);
    if (alerteValue == true) {
      await NotifController().subscribeToRoutineProgram(date);
    }
    return tmp;
  }
}
