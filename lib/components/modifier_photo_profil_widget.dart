import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../MizzUp_Code/MizzUp_expanded_image_view.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../MizzUp_Code/upload_media.dart';
import 'package:flutter/material.dart';

class ModifierPhotoProfilWidget extends StatefulWidget {
  const ModifierPhotoProfilWidget({Key? key}) : super(key: key);

  @override
  _ModifierPhotoProfilWidgetState createState() =>
      _ModifierPhotoProfilWidgetState();
}

class _ModifierPhotoProfilWidgetState extends State<ModifierPhotoProfilWidget> {
  String uploadedFileUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/i425pu2wdg4k/user-2.png';

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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: StreamBuilder<UsersRecord?>(
                  stream: UsersRecord.getDocument(currentUserReference!),
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
                    final columnUsersRecord = snapshot.data;
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Stack(
                            alignment: const AlignmentDirectional(0, 1),
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0, -1),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: MizzUpTheme.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child: MizzUpExpandedImageView(
                                                  image:  Image.network(
                                                        valueOrDefault<String>(
                                                      uploadedFileUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/i425pu2wdg4k/user-2.png',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: 'circleImageTag',
                                                  useHeroAnimation: false,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child:  Image.network( valueOrDefault<String>(
                                                uploadedFileUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/i425pu2wdg4k/user-2.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        FFButtonWidget(
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
                                  context, 'Chargement en cours...',
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
                                    "Impossible d'ajouter votre média");
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
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  final usersUpdateData = createUsersRecordData(
                                    photoUrl: uploadedFileUrl,
                                  );
                                  await columnUsersRecord!.reference!
                                      .update(usersUpdateData);
                                  Navigator.pop(context);
                                },
                                text: 'Sauvegarder',
                                options: MizzUpOptionButton(
                                  width: 230,
                                  height: 40,
                                  color: MizzUpTheme.secondaryColor,
                                  textStyle: MizzUpTheme.subtitle2.override(
                                    fontFamily: 'Avenir Next Bold',
                                    color: Colors.black,
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
