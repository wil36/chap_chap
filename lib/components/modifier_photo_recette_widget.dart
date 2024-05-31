import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../MizzUp_Code/upload_media.dart';
import '../recettes/recettes_widget.dart';
import 'package:flutter/material.dart';

class ModifierPhotoRecetteWidget extends StatefulWidget {
  const ModifierPhotoRecetteWidget({
    Key? key,
    this.recetteDetails,
  }) : super(key: key);

  final RecettesRecord? recetteDetails;

  @override
  _ModifierPhotoRecetteWidgetState createState() =>
      _ModifierPhotoRecetteWidgetState();
}

class _ModifierPhotoRecetteWidgetState
    extends State<ModifierPhotoRecetteWidget> {
  String uploadedFileUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/kgqmuavnzww1/Capture%20d%E2%80%99e%CC%81cran%202021-12-18%20a%CC%80%2015.53.34.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 1,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: StreamBuilder<RecettesRecord?>(
                  stream: RecettesRecord.getDocument(
                      widget.recetteDetails!.reference!),
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
                    // ignore: unused_local_variable
                    final columnRecettesRecord = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, -0.85),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 30, 20, 0),
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
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  uploadedFileUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                                showUploadMessage(context,
                                    'Chargement de votre photo en cours...',
                                    showLoading: true);
                                final downloadUrl = await uploadData(
                                    selectedMedia.storagePath,
                                    selectedMedia.bytes);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrl != null) {
                                  setState(() => uploadedFileUrl = downloadUrl);
                                  showUploadMessage(context, 'Succès !');
                                } else {
                                  showUploadMessage(context,
                                      "Impossible de charger votre photo");
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
                              width: 230,
                              height: 40,
                              color: MizzUpTheme.primaryColor,
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
                              const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  final recettesUpdateData =
                                      createRecettesRecordData(
                                    photoPrincipale: uploadedFileUrl,
                                  );
                                  await widget.recetteDetails!.reference!
                                      .update(recettesUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RecettesWidget(),
                                    ),
                                  );
                                },
                                text: 'Sauvegarder',
                                options: MizzUpOptionButton(
                                  width: 230,
                                  height: 40,
                                  color: MizzUpTheme.secondaryColor,
                                  textStyle: MizzUpTheme.subtitle2.override(
                                    fontFamily: 'Avenir Next Bold',
                                    color: const Color(0x9D000000),
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
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
