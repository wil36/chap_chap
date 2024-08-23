// ignore_for_file: avoid_print, deprecated_member_use

import 'package:chap_chap/main.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../MizzUp_Code/MizzUp_drop_down.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_media_display.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_video_player.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../MizzUp_Code/upload_media.dart';
import '../profil/profil_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AjoutRecetteWidget extends StatefulWidget {
  const AjoutRecetteWidget({Key? key}) : super(key: key);

  @override
  _AjoutRecetteWidgetState createState() => _AjoutRecetteWidgetState();
}

class _AjoutRecetteWidgetState extends State<AjoutRecetteWidget> {
  String? dropDownValue;
  TextEditingController? dureeController;
  TextEditingController? nbIngredientController;
  String uploadedFileUrl = '';
  TextEditingController? descriptionController;
  TextEditingController? titreController;
  TextEditingController? listIngredientController;
  TextEditingController? listEtapeController;
  bool? shampoinValue;
  bool? masqueHydratantValue;
  bool? msqueNourissantValue;
  bool? masqueProteineValue;
  bool? gelValue;
  bool? leveInValue;
  bool? sprayLotionValue;
  bool? eauRincageValue;
  bool? gommageValue;
  bool? isUpValue;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    titreController = TextEditingController();
    dureeController = TextEditingController(text: '0');
    nbIngredientController = TextEditingController(text: '0');
    listIngredientController = TextEditingController();
    listEtapeController = TextEditingController();
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
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
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilWidget(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.55, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Text(
                        'Quel est ton principale objectif concernant ta routine capillaire ?',
                        textAlign: TextAlign.start,
                        style: MizzUpTheme.bodyText1.override(
                          fontFamily: 'Avenir Book',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 20),
                          child: TextFormField(
                            controller: titreController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Titre',
                              labelStyle: MizzUpTheme.bodyText1,
                              hintText: 'Saisissez votre titre ici..',
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                    child: TextFormField(
                      controller: descriptionController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Entrez votre description ici....',
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
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      ),
                      style: MizzUpTheme.bodyText1,
                      maxLines: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: MizzUpMediaPlayer(
                          path: valueOrDefault<String>(
                            uploadedFileUrl,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/9wn9m5kkrwko/4545.jpg',
                          ),
                          imageBuilder: (path) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              path!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          videoPlayerBuilder: (path) => MizzUpVideoPlayer(
                            path: path!,
                            width: 300,
                            autoPlay: false,
                            looping: true,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            validateFileFormat(
                                selectedMedia.storagePath, context)) {
                          showUploadMessage(context, 'Chargement en cours...',
                              showLoading: true);
                          final downloadUrl = await uploadData(
                              selectedMedia.storagePath, selectedMedia.bytes);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrl != null) {
                            setState(() => uploadedFileUrl = downloadUrl);
                            showUploadMessage(context, 'Succès !');
                          } else {
                            showUploadMessage(
                                context, 'Impossible de charger votre image');
                            return;
                          }
                        }
                      },
                      text: 'Ajouter une photo',
                      icon: const Icon(
                        Icons.photo_camera,
                        size: 15,
                      ),
                      options: MizzUpOptionButton(
                        width: 290,
                        height: 40,
                        color: MizzUpTheme.tertiaryColor,
                        textStyle: MizzUpTheme.subtitle2.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.white,
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 10, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MizzUpIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.clock,
                                    color: MizzUpTheme.tertiaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Durée en minutes',
                                  textAlign: TextAlign.center,
                                  style: MizzUpTheme.bodyText1.override(
                                    fontFamily: 'Avenir Book',
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: TextFormField(
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'dureeController',
                                      const Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    controller: dureeController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Nombre seulement',
                                      hintStyle: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'Avenir Book',
                                        fontSize: 10,
                                        useGoogleFonts: false,
                                      ),
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
                                      suffixIcon: dureeController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () => setState(
                                                () => dureeController!.clear(),
                                              ),
                                              child: const Icon(
                                                Icons.clear,
                                                color: MizzUpTheme.primaryColor,
                                                size: 18,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: MizzUpTheme.bodyText1.override(
                                      fontFamily: 'Avenir Book',
                                      fontSize: 10,
                                      useGoogleFonts: false,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 10, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MizzUpIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.solidCalendarAlt,
                                    color: MizzUpTheme.tertiaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Jours de conservation',
                                  textAlign: TextAlign.center,
                                  style: MizzUpTheme.bodyText1.override(
                                    fontFamily: 'Avenir Book',
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: TextFormField(
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'nbIngredientController',
                                      const Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    controller: nbIngredientController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Nombre seulement',
                                      hintStyle: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'Avenir Book',
                                        fontSize: 10,
                                        useGoogleFonts: false,
                                      ),
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
                                      suffixIcon: nbIngredientController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () => setState(
                                                () => nbIngredientController!
                                                    .clear(),
                                              ),
                                              child: const Icon(
                                                Icons.clear,
                                                color: MizzUpTheme.primaryColor,
                                                size: 18,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: MizzUpTheme.bodyText1.override(
                                      fontFamily: 'Avenir Book',
                                      fontSize: 10,
                                      useGoogleFonts: false,
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 10, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MizzUpIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: const Icon(
                                    Icons.trending_up,
                                    color: MizzUpTheme.tertiaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Choisir la difficulté',
                                  textAlign: TextAlign.center,
                                  style: MizzUpTheme.bodyText1.override(
                                    fontFamily: 'Avenir Book',
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: MizzUpDropDown(
                                    initialOption: dropDownValue ??= 'n/a',
                                    options: ['Facile', 'Modérée', 'Difficile']
                                        .toList(),
                                    onChanged: (val) =>
                                        setState(() => dropDownValue = val),
                                    width: 180,
                                    height: 50,
                                    textStyle: MizzUpTheme.bodyText1.override(
                                      fontFamily: 'Avenir Book',
                                      color: Colors.black,
                                      fontSize: 10,
                                      useGoogleFonts: false,
                                    ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: MizzUpTheme.primaryColor,
                                      size: 15,
                                    ),
                                    fillColor: Colors.white,
                                    elevation: 2,
                                    borderColor: Colors.white,
                                    borderWidth: 0,
                                    borderRadius: 0,
                                    margin:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                    child: TextFormField(
                      controller: listIngredientController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Listez les ingrédients ici',
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
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      ),
                      style: MizzUpTheme.bodyText1,
                      maxLines: 10,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                    child: TextFormField(
                      controller: listEtapeController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Listez les étapes ici',
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
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      ),
                      style: MizzUpTheme.bodyText1,
                      maxLines: 10,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: shampoinValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => shampoinValue = newValue),
                      title: Text(
                        'Shampoing',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: masqueHydratantValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => masqueHydratantValue = newValue),
                      title: Text(
                        'Masques Hydratant',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: msqueNourissantValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => msqueNourissantValue = newValue),
                      title: Text(
                        'Masques Nourissant',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: masqueProteineValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => masqueProteineValue = newValue),
                      title: Text(
                        'Masques Protéiné',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: gelValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => gelValue = newValue),
                      title: Text(
                        'Gel',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: leveInValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => leveInValue = newValue),
                      title: Text(
                        'Leave-in',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: sprayLotionValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => sprayLotionValue = newValue),
                      title: Text(
                        'Spray et lotion',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: eauRincageValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => eauRincageValue = newValue),
                      title: Text(
                        'Eau de rinçage',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: gommageValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => gommageValue = newValue),
                      title: Text(
                        'Gommage',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: Colors.black,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: CheckboxListTile(
                      value: isUpValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => isUpValue = newValue),
                      title: Text(
                        'Mettre en Avant ',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'Avenir Next Bold',
                          color: MizzUpTheme.primaryColor,
                          useGoogleFonts: false,
                        ),
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 100),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final recettesCreateData = createRecettesRecordData(
                          createTime: getCurrentTimestamp,
                          userCreate: currentUserReference,
                          titre: titreController!.text,
                          photoPrincipale: uploadedFileUrl,
                          niveauDifficulte: dropDownValue,
                          listeIngredients: listIngredientController!.text,
                          dureePrepa: int.parse(dureeController!.text),
                          nbIngredients:
                              int.parse(nbIngredientController!.text),
                          etapes: listEtapeController!.text,
                          shampoing: (shampoinValue) == true,
                          masqueHydratant: (masqueHydratantValue) == true,
                          masqueProteine: (masqueProteineValue) == true,
                          masqueNourissant: (msqueNourissantValue) == true,
                          gel: (gelValue) == true,
                          leaveIn: (leveInValue) == true,
                          sprayLotion: (sprayLotionValue) == true,
                          eauRincage: (eauRincageValue) == true,
                          gommage: (gommageValue) == true,
                          description: descriptionController!.text,
                          isUp: (isUpValue) == true,
                        );
                        await RecettesRecord.collection
                            .doc()
                            .set(recettesCreateData);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavBarPage(index: 4)),
                          (r) => false,
                        );
                      },
                      text: 'Valider',
                      options: MizzUpOptionButton(
                        width: 130,
                        height: 40,
                        color: MizzUpTheme.primaryColor,
                        textStyle: MizzUpTheme.subtitle2.override(
                          fontFamily: 'Avenir Next Bold',
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
                ],
              ),
            ],
          ),
        ),
      ));
}
