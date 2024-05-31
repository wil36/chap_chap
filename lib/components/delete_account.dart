import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';

import '../MizzUp_Code/MizzUp_widgets.dart';
import '../auth/auth_util.dart';
import 'package:flutter/material.dart';

import '../start/start_widget.dart';

class SupprimerCompteWidget extends StatefulWidget {
  const SupprimerCompteWidget({Key? key}) : super(key: key);

  @override
  _SupprimerCompteWidgetState createState() => _SupprimerCompteWidgetState();
}

class _SupprimerCompteWidgetState extends State<SupprimerCompteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Text( 'Étes-vous sur de vouloir supprimer votre compte ?',
                textAlign: TextAlign.center,
                style: MizzUpTheme.bodyText1,
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                await deleteUser(context);
              await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const StartWidget(),
                                      ),
                                      (r) => false,
                                    );
              },
              text: 'Supprimer mon compte',
              options: MizzUpOptionButton(
                width: double.infinity,
                height: 60,
                color: Color(0xFFA80202),
                textStyle: MizzUpTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                elevation: 20,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 40,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Annuler',
                options: MizzUpOptionButton(
                  width: double.infinity,
                  height: 60,
                  color: Color(0xFF262D34),
                  textStyle: MizzUpTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  elevation: 20,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
