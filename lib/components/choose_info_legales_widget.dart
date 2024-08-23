import '../components/cgv_widget.dart';
import '../components/infos_legales_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

class ChooseInfoLegalesWidget extends StatefulWidget {
  const ChooseInfoLegalesWidget({Key? key}) : super(key: key);

  @override
  _ChooseInfoLegalesWidgetState createState() =>
      _ChooseInfoLegalesWidgetState();
}

class _ChooseInfoLegalesWidgetState extends State<ChooseInfoLegalesWidget> {
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
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 1,
                            child: const InfosLegalesWidget(),
                          ),
                        );
                      },
                    );
                  },
                  text: 'Politique de confidentialité',
                  options: MizzUpOptionButton(
                    width: 290,
                    height: 40,
                    color: MizzUpTheme.secondaryColor,
                    textStyle: MizzUpTheme.subtitle2.override(
                      fontFamily: 'IBM',
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
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 1,
                            child: const CgvWidget(),
                          ),
                        );
                      },
                    );
                  },
                  text: 'Conditions générales de vente',
                  options: MizzUpOptionButton(
                    width: 290,
                    height: 40,
                    color: MizzUpTheme.tertiaryColor,
                    textStyle: MizzUpTheme.subtitle2.override(
                      fontFamily: 'IBM',
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
