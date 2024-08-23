import 'package:chap_chap/backend/backend.dart';

import '../backend/firebase_storage/storage.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/upload_media.dart';
import 'package:flutter/material.dart';

class PhotoInstagramWidget extends StatefulWidget {
  const PhotoInstagramWidget({Key? key}) : super(key: key);

  @override
  _PhotoInstagramWidgetState createState() => _PhotoInstagramWidgetState();
}

class _PhotoInstagramWidgetState extends State<PhotoInstagramWidget> {
  String uploadedFileUrl1 =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/yz35y49ty7nt/1200px-Fond_blanc.svg.png';
  String uploadedFileUrl2 =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/yz35y49ty7nt/1200px-Fond_blanc.svg.png';
  String uploadedFileUrl3 =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/yz35y49ty7nt/1200px-Fond_blanc.svg.png';
  String uploadedFileUrl4 =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/yz35y49ty7nt/1200px-Fond_blanc.svg.png';
  String uploadedFileUrl5 =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/yz35y49ty7nt/1200px-Fond_blanc.svg.png';
  String uploadedFileUrl6 =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/yz35y49ty7nt/1200px-Fond_blanc.svg.png';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InstagramRecord?>>(
      stream: queryInstagramRecord(
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
        List<InstagramRecord?> containerInstagramRecordList = snapshot.data!;
        final containerInstagramRecord = containerInstagramRecordList.isNotEmpty
            ? containerInstagramRecordList.first
            : null;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: const AlignmentDirectional(
                            0.050000000000000044, 0.050000000000000044),
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: MizzUpTheme.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                uploadedFileUrl1,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
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
                                  setState(
                                      () => uploadedFileUrl1 = downloadUrl);
                                  showUploadMessage(context, 'Succès !');
                                } else {
                                  showUploadMessage(context,
                                      'Impossible de charger votre photo');
                                  return;
                                }
                              }

                              final instagramUpdateData =
                                  createInstagramRecordData(
                                photo1: uploadedFileUrl1,
                              );
                              await containerInstagramRecord!.reference!
                                  .update(instagramUpdateData);
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: const AlignmentDirectional(
                            0.050000000000000044, 0.050000000000000044),
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: MizzUpTheme.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                uploadedFileUrl2,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
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
                                  setState(
                                      () => uploadedFileUrl2 = downloadUrl);
                                  showUploadMessage(context, 'Succès !');
                                } else {
                                  showUploadMessage(context,
                                      'Impossible de charger votre photo');
                                  return;
                                }
                              }

                              final instagramUpdateData =
                                  createInstagramRecordData(
                                photo2: uploadedFileUrl2,
                              );
                              await containerInstagramRecord!.reference!
                                  .update(instagramUpdateData);
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: const AlignmentDirectional(
                            0.050000000000000044, 0.050000000000000044),
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: MizzUpTheme.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                uploadedFileUrl3,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
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
                                  setState(
                                      () => uploadedFileUrl3 = downloadUrl);
                                  showUploadMessage(context, 'Succès !');
                                } else {
                                  showUploadMessage(context,
                                      'Impossible de charger votre photo');
                                  return;
                                }
                              }

                              final instagramUpdateData =
                                  createInstagramRecordData(
                                photo3: uploadedFileUrl3,
                              );
                              await containerInstagramRecord!.reference!
                                  .update(instagramUpdateData);
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          alignment: const AlignmentDirectional(
                              0.050000000000000044, 0.050000000000000044),
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  uploadedFileUrl4,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
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
                                    setState(
                                        () => uploadedFileUrl4 = downloadUrl);
                                    showUploadMessage(context, 'Succès !');
                                  } else {
                                    showUploadMessage(context,
                                        'Impossible de charger votre photo');
                                    return;
                                  }
                                }

                                final instagramUpdateData =
                                    createInstagramRecordData(
                                  photo4: uploadedFileUrl4,
                                );
                                await containerInstagramRecord!.reference!
                                    .update(instagramUpdateData);
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: const AlignmentDirectional(
                              0.050000000000000044, 0.050000000000000044),
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  uploadedFileUrl5,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
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
                                    setState(
                                        () => uploadedFileUrl5 = downloadUrl);
                                    showUploadMessage(context, 'Succès !');
                                  } else {
                                    showUploadMessage(context,
                                        'Impossible de charger votre photo');
                                    return;
                                  }
                                }

                                final instagramUpdateData =
                                    createInstagramRecordData(
                                  photo5: uploadedFileUrl5,
                                );
                                await containerInstagramRecord!.reference!
                                    .update(instagramUpdateData);
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: const AlignmentDirectional(
                              0.050000000000000044, 0.050000000000000044),
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  uploadedFileUrl6,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
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
                                    setState(
                                        () => uploadedFileUrl6 = downloadUrl);
                                    showUploadMessage(context, 'Succès !');
                                  } else {
                                    showUploadMessage(context,
                                        'Impossible de charger votre photo');
                                    return;
                                  }
                                }

                                final instagramUpdateData =
                                    createInstagramRecordData(
                                  photo6: uploadedFileUrl6,
                                );
                                await containerInstagramRecord!.reference!
                                    .update(instagramUpdateData);
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [],
              ),
            ],
          ),
        );
      },
    );
  }
}
