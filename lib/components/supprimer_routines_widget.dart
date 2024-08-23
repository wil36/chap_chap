import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/notification/notifcontroller.dart';

import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SupprimerRoutinesWidget extends StatefulWidget {
  const SupprimerRoutinesWidget({
    Key? key,
    this.detailRoutine,
  }) : super(key: key);

  final RoutinesRecord? detailRoutine;

  @override
  _SupprimerRoutinesWidgetState createState() =>
      _SupprimerRoutinesWidgetState();
}

class _SupprimerRoutinesWidgetState extends State<SupprimerRoutinesWidget> {
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
          Align(
            alignment: const AlignmentDirectional(0, -0.85),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 20, 0),
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
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
            child: FFButtonWidget(
              onPressed: () async {

                await NotifController().unsuscribeToRoutine();

                await FirebaseFirestore.instance
                    .collection('routines')
                    .where('userRef', isEqualTo: currentUserReference)
                    .get()
                    .then((snapshot) {
                  for (DocumentSnapshot ds in snapshot.docs) {
                    ds.reference.delete();
                  }
                });
                await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavBarPage(index: 2),
                            ),
                          );
              },
              text: 'Supprimer ma routine',
              options: MizzUpOptionButton(
                width: 230,
                height: 40,
                color: const Color(0xFFC91F20),
                textStyle: MizzUpTheme.subtitle2.override(
                  fontFamily: 'IBM',
                  color: Colors.white,
                  useGoogleFonts: false,
                ),
                elevation: 10,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              Navigator.pop(context);
            },
            text: 'Annuler',
            options: MizzUpOptionButton(
              width: 230,
              height: 40,
              color: MizzUpTheme.secondaryColor,
              textStyle: MizzUpTheme.subtitle2.override(
                fontFamily: 'IBM',
                color: Colors.black,
                useGoogleFonts: false,
              ),
              elevation: 10,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
        ],
      ),
    );
  }
}
