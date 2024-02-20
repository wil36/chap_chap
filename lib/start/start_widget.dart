

import 'connexion_widget.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'inscription_widget.dart';
import 'package:flutter/material.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  _StartWidgetState createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MizzUpTheme.tertiaryColor,
      body: Align(
        alignment: const AlignmentDirectional(0.05, -0.3),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/splashscreen.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InscriptionWidget(),
                          ),
                        );
                      },
                      text: 'INSCRIPTION',
                      options: MizzUpOptionButton(
                        width: 190,
                        height: 40,
                        color: MizzUpTheme.secondaryColor,
                        textStyle: MizzUpTheme.bodyText1.override(
                          fontFamily: 'Avenir Book',
                          fontWeight: FontWeight.w300,
                          useGoogleFonts: false,
                        ),
                        elevation: 5,
                        borderSide: const BorderSide(
                          color: MizzUpTheme.secondaryColor,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConnexionWidget(),
                            ),
                          );
                        },
                        text: 'CONNEXION',
                        options: MizzUpOptionButton(
                          width: 190,
                          height: 40,
                          color: MizzUpTheme.secondaryColor,
                          textStyle: MizzUpTheme.bodyText1.override(
                            fontFamily: 'Avenir Book',
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: false,
                          ),
                          elevation: 5,
                          borderSide: const BorderSide(
                            color: MizzUpTheme.secondaryColor,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
