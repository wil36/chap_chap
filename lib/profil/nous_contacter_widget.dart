import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';

class NousContacterWidget extends StatefulWidget {
  const NousContacterWidget({Key? key}) : super(key: key);

  @override
  _NousContacterWidgetState createState() => _NousContacterWidgetState();
}

class _NousContacterWidgetState extends State<NousContacterWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MizzUpTheme.tertiaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    MizzUpIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: const Icon(
                                        Icons.arrow_back_sharp,
                                        color: MizzUpTheme.tertiaryColor,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 150, 0),
                                      child: Text(
                                        'Nous contacter',
                                        style: MizzUpTheme.title3.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 20, 10, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    'Si tu as une question, une recommandation ou juste besoin de nous contacter, n\'hésite pas à nous écrire !',
                                    style: MizzUpTheme.bodyText1.override(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 10, 0),
                            child: AuthUserStreamWidget(
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      '${currentUserDocument?.nom} ${currentUserDocument?.prenom}',
                                  labelStyle: MizzUpTheme.bodyText1.override(
                                    fontFamily: 'IBM',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                                  hintText: 'Votre nom et prénom ici...',
                                  hintStyle: MizzUpTheme.bodyText1.override(
                                    fontFamily: 'IBM',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MizzUpTheme.tertiaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MizzUpTheme.tertiaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 10, 0),
                            child: TextFormField(
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: currentUserEmail,
                                labelStyle: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                                hintText: 'Votre e-mail ici...',
                                hintStyle: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB77E65),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB77E65),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 10, 0),
                            child: TextFormField(
                              controller: textController3,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Message...',
                                hintStyle: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB77E65),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB77E65),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: MizzUpTheme.bodyText1.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                              maxLines: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 50, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final nouveauxMessageCreateData =
                                    createNouveauxMessageRecordData(
                                  createTime: getCurrentTimestamp,
                                  nomPrenom: textController1!.text,
                                  email: textController2!.text,
                                  message: textController3!.text,
                                );
                                await NouveauxMessageRecord.collection
                                    .doc()
                                    .set(nouveauxMessageCreateData);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Votre message a bien été envoyé. Vous recevrez une réponse dans les plus bref délais',
                                      style: MizzUpTheme.subtitle1.override(
                                        fontFamily: 'IBM',
                                        color: Colors.white,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 4000),
                                    backgroundColor: const Color(0xFF854834),
                                    action: SnackBarAction(
                                      label: 'navigationBack',
                                      textColor: const Color(0x00000000),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                              text: 'Envoyer mon message',
                              options: MizzUpOptionButton(
                                width: 300,
                                height: 40,
                                color: MizzUpTheme.secondaryColor,
                                textStyle: MizzUpTheme.subtitle2.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
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
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                    child: Text(
                                      'Tu peux également nous envoyer un e-mail à l\'adresse suivante:',
                                      style: MizzUpTheme.bodyText1.override(
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await launchURL('mailto:app@chapchap.io');
                                  },
                                  child: Text(
                                    'app@chapchap.io',
                                    style: MizzUpTheme.bodyText1.override(
                                      fontFamily: 'IBM',
                                      color: MizzUpTheme.tertiaryColor,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
