import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'profilchap_widget.dart';
import 'package:flutter/material.dart';

class ConfirmationcreationprofilWidget extends StatefulWidget {
  const ConfirmationcreationprofilWidget({Key? key}) : super(key: key);

  @override
  _ConfirmationcreationprofilWidgetState createState() =>
      _ConfirmationcreationprofilWidgetState();
}

class _ConfirmationcreationprofilWidgetState
    extends State<ConfirmationcreationprofilWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [],
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/check.png',
            width: MediaQuery.of(context).size.width * 0.27,
            height: MediaQuery.of(context).size.height * 0.1,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Align(
              alignment: const AlignmentDirectional(0.2, 0),
              child: Text(
                'Félicitations !',
                style: MizzUpTheme.title1.override(
                  fontFamily: 'IBM',
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
            child: Text(
              'Ton compte Chap Chap est bien créé, \nTu peux maintenant passer à la suite.',
              textAlign: TextAlign.start,
              style: MizzUpTheme.subtitle2.override(
                fontFamily: 'IBM',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                useGoogleFonts: false,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.05, -0.2),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilchapWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Créer mon profil personnalisé',
                    options: MizzUpOptionButton(
                      width: 250,
                      height: 40,
                      color: MizzUpTheme.tertiaryColor,
                      textStyle: MizzUpTheme.bodyText2.override(
                        fontFamily: 'IBM',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [],
          ),
        ],
      ),
    );
  }
}
