import 'package:chap_chap/main.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

class PasDeProgEnCoursWidget extends StatefulWidget {
  const PasDeProgEnCoursWidget({Key? key}) : super(key: key);

  @override
  _PasDeProgEnCoursWidgetState createState() => _PasDeProgEnCoursWidgetState();
}

class _PasDeProgEnCoursWidgetState extends State<PasDeProgEnCoursWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tu n\'as pas de programmes aujourd\'hui',
                  style: MizzUpTheme.bodyText1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavBarPage(index: 0)),
                  (r) => false,
                );
              },
              text: 'Découvrir les programmes',
              options: MizzUpOptionButton(
                width: 290,
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
          ),
        ],
      ),
    );
  }
}
