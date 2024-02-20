import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/schema/cheveux_user_record.dart';
import '../components/cuir_chevelu_widget.dart';
import '../components/perte_cheveux_widget.dart';
import '../components/perte_pellicule_widget.dart';
import '../components/routine_widget.dart';
import '../components/style_cheveux_widget.dart';

class ProfilePreview extends StatefulWidget {
  const ProfilePreview({Key? key}) : super(key: key);

  @override
  State<ProfilePreview> createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MizzUpTheme.tertiaryColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(margin: EdgeInsets.only(left: 20, top: 50), child: Icon(Icons.arrow_back)),
                  Container(margin: EdgeInsets.only(right: 20, top: 50), child: Icon(Icons.settings)),
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Container(
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
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                                  if (currentUserDocument?.member != true)
                                    Align(
                                      alignment: const AlignmentDirectional(-0.04, -0.58),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const PreniumWidget(),
                                              ),
                                            );
                                          },
                                          text: 'Passer à la version Premium',
                                          options: MizzUpOptionButton(
                                            width: 300,
                                            height: 40,
                                            color: MizzUpTheme.secondaryColor,
                                            textStyle: MizzUpTheme.subtitle1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 16,
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
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.08,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0, 0.06),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const MesInfosPersoWidget(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: MizzUpTheme.secondaryColor,
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: const Align(
                                                  alignment: AlignmentDirectional(0, 0),
                                                  child: Icon(
                                                    Icons.info_outline,
                                                    color: MizzUpTheme.primaryColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  'Mes informations personnelles',
                                                  style: MizzUpTheme.subtitle1.override(
                                                    fontFamily: 'IBM',
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const ProfilePreview(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: MizzUpTheme.secondaryColor,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: const Align(
                                                alignment: AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.person_outline,
                                                  color: MizzUpTheme.primaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'Mon profil Chap Chap',
                                                style: MizzUpTheme.subtitle1.override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const MesFavorisWidget(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: MizzUpTheme.secondaryColor,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(0, 0),
                                                child: SvgPicture.asset('assets/profil/saved_recipe_icon.svg', width: 10, height: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'Mes recettes enregistrées',
                                                style: MizzUpTheme.subtitle1.override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                   
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
