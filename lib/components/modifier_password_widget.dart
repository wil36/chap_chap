import 'package:chap_chap/auth/firebase_user_provider.dart';

import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import '../pagedaccueil/pagedaccueil_widget.dart';
import 'package:flutter/material.dart';

class ModifierPasswordWidget extends StatefulWidget {
  const ModifierPasswordWidget({Key? key}) : super(key: key);

  @override
  _ModifierPasswordWidgetState createState() => _ModifierPasswordWidgetState();
}

class _ModifierPasswordWidgetState extends State<ModifierPasswordWidget> {
  TextEditingController? motdepasseController;
  late bool passwordVisibility;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    motdepasseController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    motdepasseController!.dispose();
    super.dispose();
  }

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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Modifier votre mot de passe',
                  style: MizzUpTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: motdepasseController,
                                validator: (value) {
                                  return motdepasseController!.text == value
                                      ? null
                                      : "Please validate your entered password";
                                },
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  hintText: 'Nouveau mot de passe',
                                  hintStyle: MizzUpTheme.bodyText1,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MizzUpTheme.secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MizzUpTheme.secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: const Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: MizzUpTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 50),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() {});
                if (_formKey.currentState!.validate()) {
                  currentUser!.updateUserPassword(motdepasseController!.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Votre mot de passe à bien été modifié',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: MizzUpTheme.secondaryColor,
                    ),
                  );
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PagedaccueilWidget(),
                    ),
                    (r) => false,
                  );
                }
              },
              text: 'Sauvegarder',
              options: MizzUpOptionButton(
                width: 180,
                height: 40,
                color: MizzUpTheme.primaryColor,
                textStyle: MizzUpTheme.subtitle2.override(
                  fontFamily: 'IBM',
                  color: Colors.white,
                  useGoogleFonts: false,
                ),
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
