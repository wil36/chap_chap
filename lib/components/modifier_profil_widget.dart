import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/modifier_photo_profil_widget.dart';
import '../MizzUp_Code/MizzUp_expanded_image_view.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class ModifierProfilWidget extends StatefulWidget {
  const ModifierProfilWidget({Key? key}) : super(key: key);

  @override
  _ModifierProfilWidgetState createState() => _ModifierProfilWidgetState();
}

class _ModifierProfilWidgetState extends State<ModifierProfilWidget> {
  DateTime? datePicked;
  TextEditingController? nomController;
  TextEditingController? nomUtilisateurController;
  TextEditingController? prenomController;
  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: currentUserEmail);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 2,
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
                    child: StreamBuilder<UsersRecord?>(
                      stream: UsersRecord.getDocument(currentUserReference!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ),
                          );
                        }
                        final columnUsersRecord = snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, -0.85),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 20, 0),
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Stack(
                                  alignment: const AlignmentDirectional(0, 1),
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, -0.55),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color:
                                                      MizzUpTheme.primaryColor,
                                                  width: 1,
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          MizzUpExpandedImageView(
                                                        image: Image.network(
                                                          valueOrDefault<
                                                              String?>(
                                                            columnUsersRecord
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                                                          )!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: 'circleImageTag',
                                                        useHeroAnimation: false,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String?>(
                                                      columnUsersRecord
                                                          .photoUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                                                    )!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MizzUpIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 40,
                                          fillColor: MizzUpTheme.secondaryColor,
                                          icon: const Icon(
                                            Icons.add,
                                            color: MizzUpTheme.primaryColor,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    child:
                                                        const ModifierPhotoProfilWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: Text(
                                            'Nom d\'utilisateur',
                                            style: MizzUpTheme.title3.override(
                                              fontFamily: 'Avenir Next Bold',
                                              color: Colors.black,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 10, 20, 0),
                                              child: TextFormField(
                                                controller:
                                                    nomUtilisateurController ??=
                                                        TextEditingController(
                                                  text: columnUsersRecord
                                                      .displayName,
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Votre nom  d\'utilisateur ici...',
                                                  hintStyle: MizzUpTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Avenir Book',
                                                    color: Colors.black,
                                                    useGoogleFonts: false,
                                                  ),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: MizzUpTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'Avenir Book',
                                                  color: Colors.black,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: Text(
                                            'Prénom',
                                            style: MizzUpTheme.title3.override(
                                              fontFamily: 'Avenir Next Bold',
                                              color: Colors.black,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 10, 20, 0),
                                              child: TextFormField(
                                                controller: prenomController ??=
                                                    TextEditingController(
                                                  text:
                                                      columnUsersRecord.prenom,
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Votre prénom ici...',
                                                  hintStyle: MizzUpTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Avenir Book',
                                                    color: Colors.black,
                                                    useGoogleFonts: false,
                                                  ),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: MizzUpTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'Avenir Book',
                                                  color: Colors.black,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: Text(
                                            'Nom',
                                            style: MizzUpTheme.title3.override(
                                              fontFamily: 'Avenir Next Bold',
                                              color: Colors.black,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 10, 20, 0),
                                              child: TextFormField(
                                                controller: nomController ??=
                                                    TextEditingController(
                                                  text: columnUsersRecord.nom,
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Votre nom ici...',
                                                  hintStyle: MizzUpTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Avenir Book',
                                                    color: Colors.black,
                                                    useGoogleFonts: false,
                                                  ),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: MizzUpTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'Avenir Book',
                                                  color: Colors.black,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: Text(
                                            'Date de naissance',
                                            style: MizzUpTheme.title3.override(
                                              fontFamily: 'Avenir Next Bold',
                                              color: Colors.black,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
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
                                          minTime: DateTime(1930, 1, 1),
                                          locale: LocaleType.fr,
                                          showTitleActions: true,
                                          onConfirm: (date) {
                                            setState(() => datePicked = date);
                                          },
                                          currentTime: datePicked,
                                        );
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          dateNaissance: datePicked,
                                        );
                                        await columnUsersRecord.reference!
                                            .update(usersUpdateData);
                                      },
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 0, 0),
                                      child: Text(
                                        dateTimeFormat('yMMMd',
                                            columnUsersRecord.dateNaissance!),
                                        style: MizzUpTheme.bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: Text(
                                            'Adresse email',
                                            style: MizzUpTheme.title3.override(
                                              fontFamily: 'Avenir Next Bold',
                                              color: Colors.black,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 10, 20, 0),
                                              child: TextFormField(
                                                controller: emailController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Votre adresse email ici...',
                                                  hintStyle: MizzUpTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Avenir Book',
                                                    color: Colors.black,
                                                    useGoogleFonts: false,
                                                  ),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: MizzUpTheme
                                                          .secondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: MizzUpTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'Avenir Book',
                                                  color: Colors.black,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          email: emailController!.text,
                                          displayName:
                                              nomUtilisateurController?.text ??
                                                  '',
                                          nom: nomController?.text ?? '',
                                          prenom: prenomController?.text ?? '',
                                        );
                                        await columnUsersRecord.reference!
                                            .update(usersUpdateData);
                                        Navigator.pop(context);
                                      },
                                      text: 'Sauvegarder',
                                      options: MizzUpOptionButton(
                                        width: 230,
                                        height: 40,
                                        color: MizzUpTheme.secondaryColor,
                                        textStyle:
                                            MizzUpTheme.subtitle2.override(
                                          fontFamily: 'Avenir Next Bold',
                                          color: const Color(0x9D000000),
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
