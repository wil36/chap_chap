import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';

class MerciquestionsWidget extends StatefulWidget {
  const MerciquestionsWidget({Key? key}) : super(key: key);

  @override
  _MerciquestionsWidgetState createState() => _MerciquestionsWidgetState();
}

class _MerciquestionsWidgetState extends State<MerciquestionsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/check.png',
            width: MediaQuery.of(context).size.width * 0.27,
            height: MediaQuery.of(context).size.height * 0.1,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Text(
              'Merci !',
              style: MizzUpTheme.title1.override(
                fontFamily: 'IBM',
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 150),
            child: Container(
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Il est temps maintenant de prendre soin de tes cheveux.',
                textAlign: TextAlign.center,
                style: MizzUpTheme.subtitle2.override(
                  fontFamily: 'IBM',
                  color: Colors.black,
                  useGoogleFonts: false,
                ),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavBarPage(index: 2)),
                (r) => false,
              );
            },
            text: 'Commencer',
            options: MizzUpOptionButton(
              width: 190,
              height: 40,
              color: MizzUpTheme.tertiaryColor,
              textStyle: MizzUpTheme.subtitle2.override(
                fontFamily: 'IBM',
                color: Colors.white,
                fontSize: 14,
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
