import 'package:chap_chap/MizzUp_Code/MizzUp_icon_button.dart';
import 'package:chap_chap/components/delete_account.dart';
import 'package:chap_chap/profil/mes_favoris_widget.dart';
import 'package:chap_chap/profil/mon_program_widget.dart';
import 'package:chap_chap/profil/profile_settings.dart';
import 'package:flutter_svg/svg.dart';
import 'a_propos_widget.dart';
import '../auth/auth_util.dart';
import '../MizzUp_Code/MizzUp_expanded_image_view.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'mes_infos_perso_widget.dart';
import '../decouvrir_programme/prenium_widget.dart';
import 'rappel_widget.dart';
import '../start/start_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilWidget extends StatefulWidget {
  const ProfilWidget({Key? key}) : super(key: key);

  @override
  _ProfilWidgetState createState() => _ProfilWidgetState();
}

class _ProfilWidgetState extends State<ProfilWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: MizzUpTheme.tertiaryColor,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 50),
                child: MizzUpIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 40,
                  fillColor: MizzUpTheme.secondaryColor,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: MizzUpTheme.tertiaryColor,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, MediaQuery.of(context).size.height * 0.15, 0, 0),
                child: Container(
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
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    MediaQuery.of(context).size.height * 0.17,
                                    0,
                                    0),
                                child: AuthUserStreamWidget(
                                  child: Text(
                                    currentUserDisplayName,
                                    style: MizzUpTheme.title1.override(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ),
                              if (currentUserDocument?.member != true)
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-0.04, -0.58),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                reverseDuration:
                                                    Duration(milliseconds: 500),
                                                child: PreniumWidget()));
                                      },
                                      text: 'Passer à la version Premium',
                                      options: MizzUpOptionButton(
                                        width: 300,
                                        height: 40,
                                        color: MizzUpTheme.secondaryColor,
                                        textStyle:
                                            MizzUpTheme.subtitle1.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          fontSize: 16,
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
                                ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  elevation: 1,
                                  color: Colors.white,
                                  shadowColor: MizzUpTheme.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () async {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.9,
                                                child: MesInfosPersoWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) {
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Icon(
                                                Icons.info_outline,
                                                color: MizzUpTheme.primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              'Mes informations personnelles',
                                              style: MizzUpTheme.subtitle1
                                                  .override(
                                                fontFamily: 'IBM',
                                                color: Colors.black,
                                                fontSize: 17,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Material(
                                  color: Colors.white,
                                  elevation: 1,
                                  shadowColor: MizzUpTheme.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                reverseDuration:
                                                    Duration(milliseconds: 500),
                                                child: ProfilSettings()));
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Icon(
                                                Icons.person_outline,
                                                color: MizzUpTheme.primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              'Mon profil Chap Chap',
                                              style: MizzUpTheme.subtitle1
                                                  .override(
                                                fontFamily: 'IBM',
                                                color: Colors.black,
                                                fontSize: 17,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Material(
                                  elevation: 1,
                                  color: Colors.white,
                                  shadowColor: MizzUpTheme.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () async {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.9,
                                                child: MesFavorisWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) {
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: SvgPicture.asset(
                                                'assets/profil/saved_recipe_icon.svg',
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              'Mes recettes enregistrées',
                                              style: MizzUpTheme.subtitle1
                                                  .override(
                                                fontFamily: 'IBM',
                                                color: Colors.black,
                                                fontSize: 17,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Material(
                                  color: Colors.white,
                                  elevation: 1,
                                  shadowColor: MizzUpTheme.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () async {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.9,
                                                child: MonProgramWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) {
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Icon(
                                                Icons.content_paste,
                                                color: MizzUpTheme.primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              'Mon programme',
                                              style: MizzUpTheme.subtitle1
                                                  .override(
                                                fontFamily: 'IBM',
                                                color: Colors.black,
                                                fontSize: 17,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Material(
                                  color: Colors.white,
                                  elevation: 1,
                                  shadowColor: MizzUpTheme.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () async {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.9,
                                                child: RappelWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) {
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: FaIcon(
                                                FontAwesomeIcons.bell,
                                                color: MizzUpTheme.primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              'Mes rappels',
                                              style: MizzUpTheme.subtitle1
                                                  .override(
                                                fontFamily: 'IBM',
                                                color: Colors.black,
                                                fontSize: 17,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Material(
                                  color: Colors.white,
                                  elevation: 1,
                                  shadowColor: MizzUpTheme.secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () async {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.9,
                                                child: AProposWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) {
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: MizzUpTheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Icon(
                                                Icons.chat_bubble_outline,
                                                color: MizzUpTheme.primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              'À propos de nous',
                                              style: MizzUpTheme.subtitle1
                                                  .override(
                                                fontFamily: 'IBM',
                                                color: Colors.black,
                                                fontSize: 17,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 30),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-0.03, 0.63),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await signOut();
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const StartWidget(),
                                        ),
                                        (r) => false,
                                      );
                                    },
                                    text: 'Déconnexion',
                                    options: MizzUpOptionButton(
                                      width: 170,
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
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-0.03, 0.63),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              child: SupprimerCompteWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: 'Supprimer mon compte',
                                    options: MizzUpOptionButton(
                                      width: 170,
                                      height: 40,
                                      color: Colors.white,
                                      textStyle: MizzUpTheme.subtitle2.override(
                                        fontFamily: 'IBM',
                                        color: Colors.red,
                                        fontWeight: FontWeight.w400,
                                        useGoogleFonts: false,
                                      ),
                                      elevation: 0,
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
                          ),
                          Container(
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, MediaQuery.of(context).size.height * 0.08, 0, 0),
                  child: Material(
                    color: Colors.white,
                    elevation: 2,
                    shape: CircleBorder(),
                    child: Container(
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: AuthUserStreamWidget(
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: MizzUpExpandedImageView(
                                    image: Image.network(
                                      valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    useHeroAnimation: false,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: valueOrDefault<String>(
                                currentUserPhoto,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                              ),
                              transitionOnUserGestures: true,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15 + 90,
                left: MediaQuery.of(context).size.width * 0.5 - 15,
                child: Align(
                  alignment: AlignmentDirectional(0, -0.55),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              reverseDuration: Duration(milliseconds: 500),
                              child: ProfilSettings()));
                    },
                    child: Material(
                      color: Colors.white,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: MizzUpTheme.secondaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Icon(
                            Icons.create,
                            color: MizzUpTheme.primaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
