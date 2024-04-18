import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'profilchap2_widget.dart';
import 'package:flutter/material.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

_subscribeToTopic() async {
  await messaging.subscribeToTopic('ProgrammesNotification');
  await messaging.subscribeToTopic('RoutinesNotification');
  await messaging.subscribeToTopic('ArticlesNotification');
}

class ProfilchapWidget extends StatefulWidget {
  const ProfilchapWidget({Key? key}) : super(key: key);

  @override
  _ProfilchapWidgetState createState() => _ProfilchapWidgetState();
}

class _ProfilchapWidgetState extends State<ProfilchapWidget> {
  TextEditingController? prenomController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    prenomController = TextEditingController(text: currentUserDisplayName);
  }

  @override
  void dispose() {
    prenomController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFF9E8DE),
          body: Expanded(
            child: Align(
              alignment: const AlignmentDirectional(-0.05, 0),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 40, 20, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 10),
                              child: Text(
                                'Ton profil Chap Chap',
                                style: MizzUpTheme.title1.override(
                                  fontFamily: 'Avenir Next Bold',
                                  color: Colors.black,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50, 0, 50, 20),
                              child: Text(
                                'Pour t\'aider à trouver les soins qui te conviennent, nous avons besoin de mieux te connaître.',
                                textAlign: TextAlign.center,
                                style: MizzUpTheme.bodyText2.override(
                                  fontFamily: 'Avenir Book',
                                  color: Colors.black,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-0.95, -1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 20),
                                child: Text(
                                  'Question 1 sur 6',
                                  textAlign: TextAlign.start,
                                  style: MizzUpTheme.bodyText2.override(
                                    fontFamily: 'Avenir Book',
                                    color: Colors.black,
                                    useGoogleFonts: false,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 30),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                    color: const Color(0xFF844631),
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(-1, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF844631),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(2),
                                        bottomRight: Radius.circular(2),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(2),
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(
                                        0.19999999999999996, 0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1, -1),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 0, 20, 50),
                            child: AuthUserStreamWidget(
                              child: TextFormField(
                                controller: prenomController,
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: InputDecoration(
                                  labelText:
                                      'Par quel prénom doit-on t\'appeler ?',
                                  labelStyle: MizzUpTheme.bodyText1.override(
                                    fontFamily: 'Avenir Book',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                                  hintText: 'Votre prénom ici...',
                                  hintStyle: MizzUpTheme.title1.override(
                                    fontFamily: 'Avenir Next Bold',
                                    color: MizzUpTheme.primaryColor,
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF844631),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF844631),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                ),
                                style: MizzUpTheme.title1.override(
                                  fontFamily: 'Avenir Next Bold',
                                  color: MizzUpTheme.primaryColor,
                                  fontSize: 16,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _subscribeToTopic();
                              final usersUpdateData = createUsersRecordData(
                                displayName: prenomController!.text,
                                recevoirNotif: true,
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Bienvenue ${prenomController!.text}, Nous allons pouvoir mieux comprendre tes cheveux ensemble afin de t'aider à devenir un/une expert(e) Chap Chap",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: MizzUpTheme.primaryColor,
                                ),
                              );
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Profilchap2Widget(),
                                ),
                              );
                            },
                            text: 'Valider',
                            options: MizzUpOptionButton(
                              width: 130,
                              height: 40,
                              color: Colors.white,
                              textStyle: MizzUpTheme.title2.override(
                                fontFamily: 'Avenir Next Bold',
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
                        SvgPicture.asset(
                          'assets/images/FORME2.svg',
                          width: 280,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
