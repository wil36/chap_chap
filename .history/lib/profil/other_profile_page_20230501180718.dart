import 'package:chap_chap/profil/mon_profil_chap_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../auth/auth_util.dart';
import '../MizzUp_Code/MizzUp_expanded_image_view.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import 'package:flutter/material.dart';

class OtherProfilePage extends StatefulWidget {
  final String userId;
  const OtherProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  _OtherProfilePageState createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: MizzUpTheme.tertiaryColor,
        ),
        child: StreamBuilder(
          stream: getUsersInfo(widget.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var userDoc = snapshot.data;
              return Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(left: 14),
                          child: Icon(Icons.arrow_back, color: MizzUpTheme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, MediaQuery.of(context).size.height * 0.425, 0, 0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.50,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                                Text(textAlign: TextAlign.center, userDoc!['display_name'].toString(), style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
                                SizedBox(height: 16),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      userDoc!['bio'] != '' ? userDoc!['bio'].toString() : 'Aucune bio enregistrée',
                                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, fontFamily: 'Montserrat')),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    userDoc["instagram"] == ''
                                        ? SizedBox()
                                        : GestureDetector(
                                            onTap: () async {
                                              await _launchUrl(Uri.parse('https://www.instagram.com/${userDoc["instagram"].split('@')[1]}'));
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(right: 20),
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: MizzUpTheme.secondaryColor,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: SvgPicture.asset('assets/profil/instagram_logo.svg'),
                                            ),
                                          ),
                                    currentUserDocument!.tiktok! == ''
                                        ? SizedBox()
                                        : GestureDetector(
                                            onTap: () async {
                                              await _launchUrl(Uri.parse('https://www.tiktok.com/${userDoc["tiktok"].split('@')[1]}'));
                                            },
                                            child: Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: MizzUpTheme.secondaryColor,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Icon(Icons.tiktok, color: MizzUpTheme.primaryColor)),
                                          ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, MediaQuery.of(context).size.height * 0.25, 0, 0),
                          child: Material(
                            elevation: 2,
                            shape: CircleBorder(),
                            child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: AuthUserStreamWidget(
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MizzUpExpandedImageView(
                                            image: Image.network(
                                              valueOrDefault<String>(
                                                userDoc["photo_url"],
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            useHeroAnimation: false,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        userDoc["photo_url"],
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            userDoc["photo_url"],
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Impossible de récupérer le profil'));
            } else {
              return Center(child: CircularProgressIndicator(color: MizzUpTheme.primaryColor));
            }
          },
        ),
      ),
    );
  }

  Stream getUsersInfo(String userId) {
    return FirebaseFirestore.instance.collection('users').doc(userId).snapshots();
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
