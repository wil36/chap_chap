import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';

class ConditionHygieneWidget extends StatefulWidget {
  const ConditionHygieneWidget({Key? key}) : super(key: key);

  @override
  _ConditionHygieneWidgetState createState() => _ConditionHygieneWidgetState();
}

class _ConditionHygieneWidgetState extends State<ConditionHygieneWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 20, 0),
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
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 20, 5, 20),
                    child: Text(
                      'HYGIÈNE ET PRÉCAUTIONS D’EMPLOI ',
                      textAlign: TextAlign.start,
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                child: Text(
                  'Avant de te lancer dans la réalisation de recettes, voici quelques règles d’hygiène et précautions à respecter : ',
                  textAlign: TextAlign.center,
                  style: MizzUpTheme.bodyText1.override(
                    fontFamily: 'IBM',
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                  child: Text(
                    '-   Certains ingrédients peuvent être allergisants : Il est préférable de toujours faire un test dans le pli du coude 48 heures avant ta première application \n\n-   Se laver les mains soigneusement avant chaque préparation\n\n-   Laver et désinfecter tous les ustensiles (à l’eau bouillante ou alcool de pharmacie)\n\n-   Eviter l’utilisation d’ustensiles en métal pour les recettes contenant des poudres ayurvédiques pour éviter d’altérer les bienfaits  \n\n-   L’utilisation des huiles essentielles est à éviter pendant toute la durée de la grossesse\n\n-   L’utilisation des huiles essentielles est également à éviter chez les enfants de moins de 3 ans',
                    textAlign: TextAlign.start,
                    style: MizzUpTheme.bodyText1.override(
                      fontFamily: 'IBM',
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
