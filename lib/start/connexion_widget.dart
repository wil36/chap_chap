import 'package:chap_chap/profil/MotDePasse.dart';
import 'package:chap_chap/main.dart';
import '../auth/auth_util.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'inscription_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnexionWidget extends StatefulWidget {
  const ConnexionWidget({Key? key}) : super(key: key);

  @override
  _ConnexionWidgetState createState() => _ConnexionWidgetState();
}

class _ConnexionWidgetState extends State<ConnexionWidget> {
  TextEditingController? adressemailController;
  TextEditingController? motdepasseController;
  late bool motdepasseVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    adressemailController = TextEditingController();
    motdepasseController = TextEditingController();
    motdepasseVisibility = false;
  }

  @override
  void dispose() {
    adressemailController!.dispose();
    motdepasseController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: const AlignmentDirectional(-1, 0.7),
                    children: [
                      SvgPicture.asset(
                        'assets/images/FORME.svg',
                        width: 380,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Align(
                                    alignment: const AlignmentDirectional(0.25, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Ravie de te revoir ! ',
                                        textAlign: TextAlign.center,
                                        style: MizzUpTheme.title2.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tabletLandscape: false,
                                ))
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Ravie de te revoir ! ',
                                        textAlign: TextAlign.center,
                                        style: MizzUpTheme.title2.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Align(
                                    alignment: const AlignmentDirectional(0.15, -2),
                                    child: Text(
                                      'Connecte-toi',
                                      textAlign: TextAlign.center,
                                      style:
                                          MizzUpTheme.subtitle2.override(
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tabletLandscape: false,
                          ))
                            Align(
                              alignment: const AlignmentDirectional(0, -2),
                              child: Text(
                                'Connecte-toi',
                                textAlign: TextAlign.center,
                                style: MizzUpTheme.subtitle2.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                 
                 


                 
                  Container(
                    width: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: TextFormField(
                        controller: adressemailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Adresse e-mail',
                          labelStyle: MizzUpTheme.bodyText1,
                          hintText: 'Votre adresse mail ici...',
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: TextFormField(
                        controller: motdepasseController,
                        obscureText: !motdepasseVisibility,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle: MizzUpTheme.bodyText1,
                          hintText: 'Votre mot de passe ici...',
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () =>
                                  motdepasseVisibility = !motdepasseVisibility,
                            ),
                            child: Icon(
                              motdepasseVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: MizzUpTheme.bodyText1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 50),
                    child: Container(
                      width: 350,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MotDePasseWidget(),
                            ),
                          );
                        },
                        child: Text(
                          'Mot de passe oublié ?',
                          style: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            final user = await signInWithEmail(
                              context,
                              adressemailController!.text,
                              motdepasseController!.text,
                            );
                            if (user == null) {
                              return;
                            }

                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBarPage(index: 2)),
                              (r) => false,
                            );
                          },
                          text: 'Je me connecte ',
                          icon: const Icon(
                            Icons.arrow_forward_sharp,
                            size: 15,
                          ),
                          options: MizzUpOptionButton(
                            width: 200,
                            height: 40,
                            color: MizzUpTheme.secondaryColor,
                            textStyle: MizzUpTheme.subtitle2.override(
                              fontFamily: 'IBM',
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
                  Container(
                    width: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Pas encore de compte?',
                            style: MizzUpTheme.bodyText1,
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const InscriptionWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'Inscris-toi',
                                style: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
