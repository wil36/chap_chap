import 'package:flutter/material.dart';
import '../MizzUp_Code/MizzUp_expanded_image_view.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../auth/auth_util.dart';

class ProfilVisitWidget extends StatefulWidget {
  const ProfilVisitWidget({Key? key}) : super(key: key);

  @override
  _ProfilVisitWidgetState createState() => _ProfilVisitWidgetState();
}

class _ProfilVisitWidgetState extends State<ProfilVisitWidget> {
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
        child: Stack(
          children: [
            Align( 
              alignment: AlignmentDirectional(0,1),
              child: Container(
                width: double.infinity, 
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: AuthUserStreamWidget(
                                child: Text(
                                  currentUserDisplayName,
                                  style: MizzUpTheme.title1.override(
                                    fontFamily: 'IBM',
                                    color: Colors.black,
                                    useGoogleFonts: false,
                                  ),
                                ),
                              ),
                            ), 

                             Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: AuthUserStreamWidget(
                                child: Text(
                                  currentUserDisplayName,
                                  style: MizzUpTheme.title1.override(
                                    fontFamily: 'IBM',
                                    color: Colors.black,
                                    useGoogleFonts: false,
                                  ),
                                ),
                              ),
                            ),
                        Container(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
       
           Align(
              alignment: const AlignmentDirectional(0, -0.3),
              child: Material(
                elevation: 2,
                shape: CircleBorder(),
                child: Container(
                    width: 315,
                    height: 315,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: AuthUserStreamWidget(
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: MizzUpExpandedImageView(
                                image: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
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
                            currentUserPhoto,
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
                                currentUserPhoto,
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
            Align(
              alignment: AlignmentDirectional(0, 0.2),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilVisitWidget(),
                      ));
                },
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: MizzUpTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Icon(
                        Icons.create,
                        color: MizzUpTheme.primaryColor,
                        size: 10,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
