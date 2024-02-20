import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../profilchap/confirmationcreationprofil_widget.dart';
import 'connexion_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InscriptionWidget extends StatefulWidget {
  const InscriptionWidget({Key? key}) : super(key: key);

  @override
  _InscriptionWidgetState createState() => _InscriptionWidgetState();
}

class _InscriptionWidgetState extends State<InscriptionWidget> {
  DateTime? datePicked;
  TextEditingController? adressemailController;
  TextEditingController? nomController;
  TextEditingController? prenomController;
  TextEditingController? motdepasseController;
  late bool motdepasseVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    adressemailController = TextEditingController();
    nomController = TextEditingController();
    prenomController = TextEditingController();
    motdepasseController = TextEditingController();
    motdepasseVisibility = false;
  }

  @override
  void dispose() {
    adressemailController!.dispose();
    nomController!.dispose();
    prenomController!.dispose();
    motdepasseController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: const AlignmentDirectional(-1, 0.75),
                    children: [
                      SvgPicture.asset(
                        'assets/images/FORME.svg',
                        width: 380,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.025, 0),
                            child: Text(
                              'Bienvenue ! ',
                              style: MizzUpTheme.title2.override(
                                fontFamily: 'IBM',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              child: Text(
                                'Créer ton compte',
                                style: MizzUpTheme.subtitle2.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 165,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 5, 0),
                            child: TextFormField(
                              onChanged: (_) => EasyDebounce.debounce(
                                'nomController',
                                const Duration(milliseconds: 1000),
                                () => setState(() {}),
                              ),
                              controller: nomController,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                labelText: 'Nom',
                                labelStyle: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  useGoogleFonts: false,
                                ),
                                hintText: 'Votre nom ici...',
                                hintStyle: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MizzUpTheme.secondaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MizzUpTheme.secondaryColor,
                                    width: 2,
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
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 165,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5, 0, 0, 0),
                            child: TextFormField(
                              onChanged: (_) => EasyDebounce.debounce(
                                'prenomController',
                                const Duration(milliseconds: 1000),
                                () => setState(() {}),
                              ),
                              controller: prenomController,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                labelText: 'Prénom',
                                labelStyle: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  useGoogleFonts: false,
                                ),
                                hintText: 'Votre Prénom ici...',
                                hintStyle: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MizzUpTheme.secondaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MizzUpTheme.secondaryColor,
                                    width: 2,
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
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 330,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'adressemailController',
                            const Duration(milliseconds: 1000),
                            () => setState(() {}),
                          ),
                          controller: adressemailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Adresse e-mail',
                            labelStyle: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                            hintText: 'Votre adresse mail ici...',
                            hintStyle: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MizzUpTheme.secondaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MizzUpTheme.secondaryColor,
                                width: 2,
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
                            useGoogleFonts: false,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 330,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'motdepasseController',
                            const Duration(milliseconds: 1000),
                            () => setState(() {}),
                          ),
                          controller: motdepasseController,
                          obscureText: !motdepasseVisibility,
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            labelStyle: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                            hintText:
                                'Votre mot de passe doit avoir 6 caractères minimum',
                            hintStyle: MizzUpTheme.bodyText1.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              useGoogleFonts: false,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MizzUpTheme.secondaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MizzUpTheme.secondaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => motdepasseVisibility =
                                    !motdepasseVisibility,
                              ),
                              child: Icon(
                                motdepasseVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            color: Colors.black,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: 330,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MizzUpIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: MizzUpTheme.secondaryColor,
                                icon: const Icon(
                                  Icons.calendar_today_sharp,
                                  color: MizzUpTheme.primaryColor,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  await DatePicker.showDatePicker(
                                    context,
                                    minTime: DateTime(1930, 3, 5),
                                    locale: LocaleType.fr,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked = date);
                                    },
                                    currentTime: datePicked,
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 0, 0),
                                child: Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat('yMMMd', datePicked),
                                    'Date de naissance',
                                  ),
                                  style: MizzUpTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.05, 0.1),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final user = await createAccountWithEmail(
                                  context,
                                  adressemailController!.text,
                                  motdepasseController!.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                final usersCreateData = createUsersRecordData(
                                  email: adressemailController!.text,
                                  createdTime: getCurrentTimestamp,
                                  dateNaissance: datePicked,
                                  nom: nomController!.text,
                                  prenom: prenomController!.text,
                                );
                                await UsersRecord.collection
                                    .doc(user.uid)
                                    .update(usersCreateData);

                                final cheveuxUserCreateData =
                                    createCheveuxUserRecordData(
                                  createTime: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                );
                                await CheveuxUserRecord.collection
                                    .doc()
                                    .set(cheveuxUserCreateData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ConfirmationcreationprofilWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Je m\'inscris ',
                              icon: const Icon(
                                Icons.arrow_forward_sharp,
                                size: 15,
                              ),
                              options: MizzUpOptionButton(
                                width: 200,
                                height: 40,
                                color: MizzUpTheme.secondaryColor,
                                textStyle: MizzUpTheme.subtitle2.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
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
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(50, 50, 0, 50),
                        child: Text(
                          'Déjà un compte ?',
                          style: MizzUpTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConnexionWidget(),
                              ),
                            );
                          },
                          text: 'Connecte-toi',
                          options: MizzUpOptionButton(
                            width: 150,
                            height: 40,
                            color: MizzUpTheme.secondaryColor,
                            textStyle: MizzUpTheme.subtitle2.override(
                              fontFamily: 'IBM',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
