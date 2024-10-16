// ignore_for_file: unnecessary_const

import 'package:chap_chap/MizzUp_Code/MizzUp_expanded_image_view.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/components/modifier_photo_profil_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/routine_widget.dart';
import '../components/style_cheveux_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MonProfilChapWidget extends StatefulWidget {
  const MonProfilChapWidget({Key? key}) : super(key: key);

  @override
  _MonProfilChapWidgetState createState() => _MonProfilChapWidgetState();
}

class _MonProfilChapWidgetState extends State<MonProfilChapWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController hairTypeController = TextEditingController();
  TextEditingController hairObjectiveController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController tikTokController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  FocusNode userNameFocusNode = FocusNode();
  FocusNode hairTypeFocusNode = FocusNode();
  FocusNode hairObjectiveFocusNode = FocusNode();
  FocusNode instagramFocusNode = FocusNode();
  FocusNode tikTokFocusNode = FocusNode();
  FocusNode bioFocusNode = FocusNode();

  List<String> hairTypes = ['Lisses', 'Ondulés', 'Frisés', 'Crépus', 'Bouclés'];
  List<String> hairObjectives = [
    'Avoir une routine efficace',
    'Débuter une transition'
  ];
  bool isPrivate = currentUserDocument!.isPrivate!;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<List<CheveuxUserRecord?>>(
              stream: queryCheveuxUserRecord(
                queryBuilder: (cheveuxUserRecord) => cheveuxUserRecord
                    .where('userRef', isEqualTo: currentUserReference),
                singleRecord: false,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return const Center(
                    child: const SizedBox(
                      width: 60,
                      height: 60,
                      child: const CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                List<CheveuxUserRecord?>? columnCheveuxUserRecordList =
                    snapshot.data;
                final columnCheveuxUserRecord =
                    columnCheveuxUserRecordList!.isNotEmpty
                        ? columnCheveuxUserRecordList.first
                        : null;

                String typeCheveux = "";
                columnCheveuxUserRecordList.forEach((element) {
                  typeCheveux =
                      typeCheveux + hairTypes[element!.styleCheveux!] + ", ";
                });
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.85),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MizzUpIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: MizzUpTheme.tertiaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 0, 0, 0),
                              child: Text(
                                'Modifier mon profil',
                                style: MizzUpTheme.title1.override(
                                  fontFamily: 'IBM',
                                  color: Colors.black,
                                  fontSize: 20,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    StreamBuilder<UsersRecord?>(
                        stream: UsersRecord.getDocument(currentUserReference!),
                        builder: (context, snapshot) {
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
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Stack(
                              alignment: const AlignmentDirectional(0, 1),
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: const AlignmentDirectional(
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
                                              color: MizzUpTheme.primaryColor,
                                              width: 1,
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      MizzUpExpandedImageView(
                                                    image: Image.network(
                                                      valueOrDefault<String?>(
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
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String?>(
                                                  columnUsersRecord.photoUrl,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MizzUpIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: MizzUpTheme.secondaryColor,
                                      icon: const Icon(
                                        Icons.edit,
                                        color: MizzUpTheme.primaryColor,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
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
                          );
                        }),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nom d\'utilisateur'),
                          TextFormField(
                            focusNode: userNameFocusNode,
                            textInputAction: TextInputAction.next,
                            controller: userNameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              suffixIcon: userNameController.text.isEmpty
                                  ? InkWell(
                                      onTap: () {
                                        userNameFocusNode.requestFocus();
                                        setState(
                                          () => userNameController.clear(),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: MizzUpTheme.primaryColor,
                                        size: 20,
                                      ),
                                    )
                                  : null,
                              hintText: currentUserDisplayName,
                              hintStyle: const TextStyle(
                                color: MizzUpTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              //bottom border
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: MizzUpTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Type de cheveux'),
                          GestureDetector(
                            child: TextFormField(
                              textInputAction: TextInputAction.none,
                              controller: hairTypeController,
                              obscureText: false,
                              decoration: InputDecoration(
                                suffixIcon: hairTypeController.text.isEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            isDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.65,
                                                  child:
                                                      const StyleCheveuxWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.edit,
                                          color: MizzUpTheme.primaryColor,
                                          size: 20,
                                        ),
                                      )
                                    : null,
                                hintText: typeCheveux,
                                hintStyle: const TextStyle(
                                  color: MizzUpTheme.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                //bottom border
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: MizzUpTheme.primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                color: MizzUpTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Objectif capilaire'),
                          TextFormField(
                            textInputAction: TextInputAction.none,
                            controller: hairObjectiveController,
                            obscureText: false,
                            decoration: InputDecoration(
                              suffixIcon: hairObjectiveController.text.isEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.45,
                                                child: const RoutineWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: MizzUpTheme.primaryColor,
                                        size: 20,
                                      ),
                                    )
                                  : null,
                              hintText: hairObjectives[
                                  columnCheveuxUserRecordList.isNotEmpty
                                      ? columnCheveuxUserRecord!
                                          .routineCapillaire!
                                      : 0],
                              hintStyle: const TextStyle(
                                color: MizzUpTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              //bottom border
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: MizzUpTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Instagram'),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: instagramFocusNode,
                            controller: instagramController,
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixText: '@',
                              suffixIcon: instagramController.text.isEmpty
                                  ? InkWell(
                                      onTap: () {
                                        instagramFocusNode.requestFocus();
                                        setState(
                                          () => instagramController.clear(),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: MizzUpTheme.primaryColor,
                                        size: 20,
                                      ),
                                    )
                                  : null,
                              hintText: currentUserDocument!.instagram,
                              hintStyle: const TextStyle(
                                color: MizzUpTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              //bottom border
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: MizzUpTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('TikTok'),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: tikTokController,
                            focusNode: tikTokFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixText: '@',
                              suffixIcon: tikTokController.text.isEmpty
                                  ? InkWell(
                                      onTap: () {
                                        tikTokFocusNode.requestFocus();
                                        setState(
                                          () => tikTokController.clear(),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: MizzUpTheme.primaryColor,
                                        size: 20,
                                      ),
                                    )
                                  : null,
                              hintText: currentUserDocument!.tiktok,
                              hintStyle: const TextStyle(
                                color: MizzUpTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              //bottom border
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: MizzUpTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bio'),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: bioFocusNode,
                            controller: bioController,
                            obscureText: false,
                            decoration: InputDecoration(
                              suffixIcon: bioController.text.isEmpty
                                  ? InkWell(
                                      onTap: () {
                                        bioFocusNode.requestFocus();
                                        setState(
                                          () => bioController.clear(),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: MizzUpTheme.primaryColor,
                                        size: 20,
                                      ),
                                    )
                                  : null,
                              hintText: currentUserDocument!.bio,
                              hintStyle: const TextStyle(
                                color: MizzUpTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              //bottom border
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: MizzUpTheme.primaryColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: MizzUpTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    //add a toggle button to switch account either in privade mode or not
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: MizzUpTheme.primaryColor.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Passer en mode privé',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          SizedBox(),
                          FlutterSwitch(
                            activeColor: MizzUpTheme.primaryColor,
                            activeSwitchBorder: Border.all(
                                color: MizzUpTheme.primaryColor, width: 2),
                            inactiveColor: Colors.transparent,
                            inactiveSwitchBorder: Border.all(
                                color: MizzUpTheme.primaryColor, width: 2),
                            activeToggleColor: Colors.white,
                            inactiveToggleColor: Colors.white,
                            activeToggleBorder: Border.all(
                                color: MizzUpTheme.secondaryColor, width: 2),
                            inactiveToggleBorder: Border.all(
                                color: MizzUpTheme.primaryColor, width: 2),
                            width: 60.0,
                            height: 30.0,
                            valueFontSize: 25.0,
                            toggleSize: 20.0,
                            value: isPrivate,
                            borderRadius: 30.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                isPrivate = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                            textAlign: TextAlign.center,
                            'Si tu passes ton profil en mode privé, tu ne pourras pas commenter ou répondre aux commentaires disponibles sous les recettes')),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () async {
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          if (instagramController.text == '') {
                            instagramController.text =
                                currentUserDocument!.instagram!;
                          } else {
                            if (!instagramController.text.startsWith('@')) {
                              instagramController.text =
                                  '@' + instagramController.text;
                            }
                          }
                          if (tikTokController.text == '') {
                            tikTokController.text =
                                currentUserDocument!.tiktok!;
                          } else {
                            if (!tikTokController.text.startsWith('@')) {
                              tikTokController.text =
                                  '@' + tikTokController.text;
                            }
                          }
                          if (bioController.text == '') {
                            bioController.text = currentUserDocument!.bio!;
                          }
                          if (userNameController.text == '') {
                            userNameController.text =
                                currentUserDocument!.displayName!;
                          }
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .update({
                            'instagram': instagramController.text == ''
                                ? currentUserDocument!.instagram
                                : instagramController.text,
                            'tiktok': tikTokController.text == ''
                                ? currentUserDocument!.tiktok
                                : tikTokController.text,
                            'bio': bioController.text == ''
                                ? currentUserDocument!.bio
                                : bioController.text,
                            'display_name': userNameController.text == ''
                                ? currentUserDocument!.displayName
                                : userNameController.text,
                            'is_private': isPrivate,
                          });
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MizzUpTheme.secondaryColor,
                          ),
                          child: const Text('Enregistrer mes préférences',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget editProfileInfosFormField(TextEditingController controller,
      String hintText, String helperText, bool needKeyboard) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(helperText),
          TextFormField(
            textInputAction:
                needKeyboard ? TextInputAction.next : TextInputAction.none,
            controller: controller,
            obscureText: false,
            decoration: InputDecoration(
              suffixIcon: controller.text.isEmpty
                  ? InkWell(
                      onTap: () => controller.clear(),
                      child: const Icon(
                        Icons.edit,
                        color: MizzUpTheme.primaryColor,
                        size: 20,
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: MizzUpTheme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              //bottom border
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: MizzUpTheme.primaryColor,
                  width: 1,
                ),
              ),
            ),
            style: const TextStyle(
              color: MizzUpTheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}

                  // Padding(
                  //   padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: const BoxDecoration(),
                  //     child: Padding(
                  //       padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //       child: InkWell(
                  //         onTap: () async {
                  //           await showModalBottomSheet(
                  //             isScrollControlled: true,
                  //             context: context,
                  //             builder: (context) {
                  //               return Padding(
                  //                 padding: MediaQuery.of(context).viewInsets,
                  //                 child: SizedBox(
                  //                   height: MediaQuery.of(context).size.height * 0.45,
                  //                   child: const StyleCheveuxWidget(),
                  //                 ),
                  //               );
                  //             },
                  //           );
                  //         },
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //               child: Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Text(
                  //                     'Type de cheveux',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       fontSize: 17,
                  //                       fontWeight: FontWeight.w500,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                   const Icon(
                  //                     Icons.arrow_forward_ios,
                  //                     color: Colors.black,
                  //                     size: 20,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //               child: Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   if (columnCheveuxUserRecord!.styleCheveux! == 0) ...{
                  //                     Text(
                  //                       'Lisses',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 1) ...{
                  //                     Text(
                  //                       'Ondulés',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 2) ...{
                  //                     Text(
                  //                       'Frisés',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 3) ...{
                  //                     Text(
                  //                       'Crépus',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                   if (columnCheveuxUserRecord.styleCheveux! == 4) ...{
                  //                     Text(
                  //                       'Bouclés',
                  //                       style: MizzUpTheme.bodyText1.override(
                  //                         fontFamily: 'IBM',
                  //                         color: MizzUpTheme.tertiaryColor,
                  //                         fontSize: 16,
                  //                         useGoogleFonts: false,
                  //                       ),
                  //                     ),
                  //                   },
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const CuirCheveluWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Cuir chevelu',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.cuirCheveulu! == 0) ...{
                  //                   Text(
                  //                     'Sec',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.cuirCheveulu! == 1) ...{
                  //                   Text(
                  //                     'Normal',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.cuirCheveulu! == 2) ...{
                  //                   Text(
                  //                     'Gras',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const PerteCheveuxWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Perte de cheveux',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.perteCheveux! == 0) ...{
                  //                   Text(
                  //                     'Peu',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.perteCheveux! == 1) ...{
                  //                   Text(
                  //                     'Moyen',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.perteCheveux! == 2) ...{
                  //                   Text(
                  //                     'Beaucoup',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const PertePelliculeWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Pellicules',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.pellicules! == 0) ...{
                  //                   Text(
                  //                     'Oui',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.pellicules! == 1) ...{
                  //                   Text(
                  //                     'Non',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(),
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         await showModalBottomSheet(
                  //           isScrollControlled: true,
                  //           context: context,
                  //           builder: (context) {
                  //             return Padding(
                  //               padding: MediaQuery.of(context).viewInsets,
                  //               child: SizedBox(
                  //                 height: MediaQuery.of(context).size.height * 0.45,
                  //                 child: const RoutineWidget(),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Objectif de routine capillaire',
                  //                   style: MizzUpTheme.bodyText1.override(
                  //                     fontFamily: 'IBM',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //                 ),
                  //                 const Icon(
                  //                   Icons.arrow_forward_ios,
                  //                   color: Colors.black,
                  //                   size: 20,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 if (columnCheveuxUserRecord.routineCapillaire! == 0) ...{
                  //                   Text(
                  //                     'Avoir une routine efficace',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //                 if (columnCheveuxUserRecord.routineCapillaire! == 1) ...{
                  //                   Text(
                  //                     'Débuter une transition',
                  //                     style: MizzUpTheme.bodyText1.override(
                  //                       fontFamily: 'IBM',
                  //                       color: MizzUpTheme.tertiaryColor,
                  //                       fontSize: 16,
                  //                       useGoogleFonts: false,
                  //                     ),
                  //                   ),
                  //                 },
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),