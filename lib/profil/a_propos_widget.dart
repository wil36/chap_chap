// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../components/choose_info_legales_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'nous_contacter_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AProposWidget extends StatefulWidget {
  const AProposWidget({Key? key}) : super(key: key);

  @override
  _AProposWidgetState createState() => _AProposWidgetState();
}

class _AProposWidgetState extends State<AProposWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(3),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
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
                        Icons.arrow_back_sharp,
                        color: MizzUpTheme.tertiaryColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'À propos de nous',
                        style: MizzUpTheme.title3.override(
                          fontFamily: 'IBM',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NousContacterWidget(),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MizzUpTheme.secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.envelope,
                          color: MizzUpTheme.primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Nous contacter',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
            child: InkWell(
              onTap: () async {
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MizzUpTheme.secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Icon(
                          Icons.favorite_border,
                          color: MizzUpTheme.primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Nous rejoindre sur Instragram',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: MizzUpTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Icon(
                        Icons.star_outline,
                        color: MizzUpTheme.primaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      if (Platform.isIOS) {
                        launchUrl(Uri.parse(
                            'https://apps.apple.com/us/app/chap-chap-suivi-capillaire/id1612303752'));
                      } else if (Platform.isAndroid) {
                        launchUrl(Uri.parse(
                            'https://play.google.com/store/apps/details?id=fr.mizzup.chapchap&gl=FR'));
                      }
                    },
                    child: Text(
                      'Noter l\'application',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
            child: InkWell(
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const ChooseInfoLegalesWidget(),
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MizzUpTheme.secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Icon(
                          Icons.info_outline,
                          color: MizzUpTheme.primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Informations légales',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
