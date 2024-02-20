import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_media_display.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_video_player.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../MizzUp_Code/upload_media.dart';
import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class AjoutIngredientWidget extends StatefulWidget {
  const AjoutIngredientWidget({
    Key? key,
    required this.thisProg,
  }) : super(key: key);

  final DocumentReference thisProg;

  @override
  _AjoutIngredientWidgetState createState() => _AjoutIngredientWidgetState();
}

class _AjoutIngredientWidgetState extends State<AjoutIngredientWidget> {
  String uploadedFileUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/subghoup3kka/app_launcher_icon.png';
  TextEditingController? titreController;
  TextEditingController? lienExterneController;
  bool? poudresAromaValue;
  bool? huileAromaValue;
  bool? poudreBaBValue;
  bool? huileBaBValue;
  bool? diversValue;

  @override
  void initState() {
    super.initState();
    lienExterneController = TextEditingController();
    titreController = TextEditingController();
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
                              builder: (context) => const NavBarPage(index: 4),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 20, 20, 20),
                        child: Text(
                          'Ajout Ingredient',
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
                              decoration: const InputDecoration(
                                labelText: 'Titre',
                                hintText: 'Saisissez votre titre ici..',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MizzUpTheme.secondaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  // ignore: unnecessary_const
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
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/subghoup3kka/app_launcher_icon.png',
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
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
                            showUploadMessage(
                              context,
                              'Chargement en cours...',
                              showLoading: true,
                            );
                            final downloadUrl = await uploadData(
                                selectedMedia.storagePath, selectedMedia.bytes);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            if (downloadUrl != null) {
                              setState(() => uploadedFileUrl = downloadUrl);
                              showUploadMessage(
                                context,
                                'Succès !',
                              );
                            } else {
                              showUploadMessage(
                                context,
                                'Impossible de charger votre photo',
                              );
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
                            fontFamily: 'IBM',
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
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 20, 20, 20),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'lienExterneController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          controller: lienExterneController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Lien redirection',
                            hintText: 'Saisissez votre lien ici..',
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
                            suffixIcon: lienExterneController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => lienExterneController!.clear(),
                                    ),
                                    child: const Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: MizzUpTheme.bodyText1,
                          keyboardType: TextInputType.url,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.black,
                        ),
                        child: CheckboxListTile(
                          value: poudresAromaValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => poudresAromaValue = newValue),
                          title: Text(
                            'Les poudres (Aroma)',
                            style: MizzUpTheme.title3.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                          tileColor: const Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: const Color(0xFF707070),
                        ),
                        child: CheckboxListTile(
                          value: huileAromaValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => huileAromaValue = newValue),
                          title: Text(
                            'Les Huiles (Aroma)',
                            style: MizzUpTheme.title3.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                          tileColor: const Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: const Color(0xFF707070),
                        ),
                        child: CheckboxListTile(
                          value: poudreBaBValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => poudreBaBValue = newValue),
                          title: Text(
                            'Les poudres (BaB)',
                            style: MizzUpTheme.title3.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                          tileColor: const Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: const Color(0xFF707070),
                        ),
                        child: CheckboxListTile(
                          value: huileBaBValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => huileBaBValue = newValue),
                          title: Text(
                            'Les Huiles (BaB)',
                            style: MizzUpTheme.title3.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                          tileColor: const Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.black,
                        ),
                        child: CheckboxListTile(
                          value: diversValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => diversValue = newValue),
                          title: Text(
                            'Divers',
                            style: MizzUpTheme.title3.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                          tileColor: const Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 100),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final listIngredientsCreateData =
                              createListIngredientsRecordData(
                            createTime: getCurrentTimestamp,
                            titre: titreController!.text,
                            progRef: widget.thisProg,
                            poudresAroma: poudresAromaValue,
                            huilesAroma: huileAromaValue,
                            poudresBaB: poudreBaBValue,
                            huilesBaB: huileBaBValue,
                            divers: diversValue,
                            image: uploadedFileUrl,
                            lienExterne: lienExterneController!.text,
                          );
                          await ListIngredientsRecord.collection
                              .doc()
                              .set(listIngredientsCreateData);
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavBarPage(index: 4),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Valider',
                        options: MizzUpOptionButton(
                          width: 130,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
