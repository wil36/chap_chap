import '../components/ajout_recette_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

class ConfirmerRecetteWidget extends StatefulWidget {
  const ConfirmerRecetteWidget({Key? key}) : super(key: key);

  @override
  _ConfirmerRecetteWidgetState createState() => _ConfirmerRecetteWidgetState();
}

class _ConfirmerRecetteWidgetState extends State<ConfirmerRecetteWidget> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
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
          Text(
            'Voulez-vous ajouter une nouvelle recette ?',
            style: MizzUpTheme.bodyText1,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: const AjoutRecetteWidget(),
                            ),
                          );
                        },
                      );
                    },
                    text: 'Oui',
                    options: MizzUpOptionButton(
                      width: 130,
                      height: 40,
                      color: MizzUpTheme.secondaryColor,
                      textStyle: MizzUpTheme.subtitle2.override(
                        fontFamily: 'Avenir Next Bold',
                        color: MizzUpTheme.primaryColor,
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
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Annuler',
                    options: MizzUpOptionButton(
                      width: 130,
                      height: 40,
                      color: Colors.black,
                      textStyle: MizzUpTheme.subtitle2.override(
                        fontFamily: 'Avenir Next Bold',
                        color: Colors.white,
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
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [],
          ),
        ],
      ),
    );
  }
}
