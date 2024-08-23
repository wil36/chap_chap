// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_expanded_image_view.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

class InstagramWidget extends StatefulWidget {
  const InstagramWidget({Key? key}) : super(key: key);

  @override
  _InstagramWidgetState createState() => _InstagramWidgetState();
}

class _InstagramWidgetState extends State<InstagramWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MizzUpTheme.tertiaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: MizzUpTheme.tertiaryColor,
        ),
        child: StreamBuilder<List<InstagramRecord?>>(
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
            List<InstagramRecord?> containerInstagramRecordList =
                snapshot.data!;
            final containerInstagramRecord =
                containerInstagramRecordList.isNotEmpty
                    ? containerInstagramRecordList.first
                    : null;
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MizzUpIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              color: MizzUpTheme.tertiaryColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            'Nous rejoindre sur Instragram',
                            style: MizzUpTheme.title3.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Text(
                            'N\'hésite pas à nous rejoindre sur Instagram pour suivre l\'aventure avec nous ! ',
                            style: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if ((containerInstagramRecord!.photo1) != '')
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: MizzUpExpandedImageView(
                                          image:  Image.network( containerInstagramRecord
                                                .photo1!,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: containerInstagramRecord.photo1,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: containerInstagramRecord.photo1!,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child:  Image.network(
                                            containerInstagramRecord.photo1!,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.24,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              if ((containerInstagramRecord.photo2) != '')
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: MizzUpExpandedImageView(
                                          image:  Image.network( containerInstagramRecord
                                                .photo2!,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: containerInstagramRecord.photo2,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: containerInstagramRecord.photo2!,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child:  Image.network(
                                            containerInstagramRecord.photo2!,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.24,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              if ((containerInstagramRecord.photo3!) != '')
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: MizzUpExpandedImageView(
                                          image:  Image.network( containerInstagramRecord
                                                .photo3!,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: containerInstagramRecord.photo3,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: containerInstagramRecord.photo3!,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child:  Image.network(
                                            containerInstagramRecord.photo3!,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.24,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if ((containerInstagramRecord.photo4) != '')
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: MizzUpExpandedImageView(
                                              image:  Image.network(
                                                    containerInstagramRecord
                                                        .photo4!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: containerInstagramRecord
                                                  .photo4,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: containerInstagramRecord.photo4!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child:  Image.network( containerInstagramRecord
                                                .photo4!,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.24,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.13,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((containerInstagramRecord.photo5) != '')
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: MizzUpExpandedImageView(
                                              image:  Image.network(
                                                    containerInstagramRecord
                                                        .photo5!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: containerInstagramRecord
                                                  .photo5,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: containerInstagramRecord.photo5!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child:  Image.network( containerInstagramRecord
                                                .photo5!,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.24,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.13,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((containerInstagramRecord.photo6) != '')
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: MizzUpExpandedImageView(
                                              image:  Image.network(
                                                    containerInstagramRecord
                                                        .photo6!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: containerInstagramRecord
                                                  .photo6,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: containerInstagramRecord.photo6!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child:  Image.network( containerInstagramRecord
                                                .photo6!,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.24,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.13,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              )),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-0.8, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: Text(
                                  '@ChapChap.app',
                                  style: MizzUpTheme.bodyText1.override(
                                    fontFamily: 'IBM',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              const url =
                                  'https://www.instagram.com/chapchap.app';
                              final bool nativeAppLaunchSucceeded =
                                  await launch(
                                url,
                                forceSafariVC: false,
                                universalLinksOnly: true,
                              );
                              if (!nativeAppLaunchSucceeded) {
                                await launch(
                                  url,
                                  forceSafariVC: true,
                                );
                              }
                            },
                            text: 'Nous suivre sur Instagram',
                            options: MizzUpOptionButton(
                              width: 300,
                              height: 40,
                              color: MizzUpTheme.secondaryColor,
                              textStyle: MizzUpTheme.subtitle2.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                      child: Row(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
