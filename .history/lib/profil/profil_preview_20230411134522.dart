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
      body: Stack(
        children: [
          Align(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 2,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: StreamBuilder<List<CheveuxUserRecord?>>(
                      stream: queryCheveuxUserRecord(
                        queryBuilder: (cheveuxUserRecord) => cheveuxUserRecord.where('userRef', isEqualTo: currentUserReference),
                        singleRecord: true,
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
                        List<CheveuxUserRecord?>? columnCheveuxUserRecordList = snapshot.data;
                        final columnCheveuxUserRecord = columnCheveuxUserRecordList!.isNotEmpty ? columnCheveuxUserRecordList.first : null;
                        return Column(
                          children: [
                            Align(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                      child: Text(
                                        'Mon profil Chap Chap',
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                  child: InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context).viewInsets,
                                            child: SizedBox(
                                              height: MediaQuery.of(context).size.height * 0.45,
                                              child: const StyleCheveuxWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Type de cheveux',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (columnCheveuxUserRecord!.styleCheveux! == 0) ...{
                                                Text(
                                                  'Lisses',
                                                  style: MizzUpTheme.bodyText1.override(
                                                    fontFamily: 'IBM',
                                                    color: MizzUpTheme.tertiaryColor,
                                                    fontSize: 16,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              },
                                              if (columnCheveuxUserRecord.styleCheveux! == 1) ...{
                                                Text(
                                                  'Ondulés',
                                                  style: MizzUpTheme.bodyText1.override(
                                                    fontFamily: 'IBM',
                                                    color: MizzUpTheme.tertiaryColor,
                                                    fontSize: 16,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              },
                                              if (columnCheveuxUserRecord.styleCheveux! == 2) ...{
                                                Text(
                                                  'Frisés',
                                                  style: MizzUpTheme.bodyText1.override(
                                                    fontFamily: 'IBM',
                                                    color: MizzUpTheme.tertiaryColor,
                                                    fontSize: 16,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              },
                                              if (columnCheveuxUserRecord.styleCheveux! == 3) ...{
                                                Text(
                                                  'Crépus',
                                                  style: MizzUpTheme.bodyText1.override(
                                                    fontFamily: 'IBM',
                                                    color: MizzUpTheme.tertiaryColor,
                                                    fontSize: 16,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              },
                                              if (columnCheveuxUserRecord.styleCheveux! == 4) ...{
                                                Text(
                                                  'Bouclés',
                                                  style: MizzUpTheme.bodyText1.override(
                                                    fontFamily: 'IBM',
                                                    color: MizzUpTheme.tertiaryColor,
                                                    fontSize: 16,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              },
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.of(context).viewInsets,
                                          child: SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.45,
                                            child: const CuirCheveluWidget(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Cuir chevelu',
                                              style: MizzUpTheme.bodyText1.override(
                                                fontFamily: 'IBM',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (columnCheveuxUserRecord.cuirCheveulu! == 0) ...{
                                              Text(
                                                'Sec',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                            if (columnCheveuxUserRecord.cuirCheveulu! == 1) ...{
                                              Text(
                                                'Normal',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                            if (columnCheveuxUserRecord.cuirCheveulu! == 2) ...{
                                              Text(
                                                'Gras',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.of(context).viewInsets,
                                          child: SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.45,
                                            child: const PerteCheveuxWidget(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Perte de cheveux',
                                              style: MizzUpTheme.bodyText1.override(
                                                fontFamily: 'IBM',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (columnCheveuxUserRecord.perteCheveux! == 0) ...{
                                              Text(
                                                'Peu',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                            if (columnCheveuxUserRecord.perteCheveux! == 1) ...{
                                              Text(
                                                'Moyen',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                            if (columnCheveuxUserRecord.perteCheveux! == 2) ...{
                                              Text(
                                                'Beaucoup',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.of(context).viewInsets,
                                          child: SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.45,
                                            child: const PertePelliculeWidget(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Pellicules',
                                              style: MizzUpTheme.bodyText1.override(
                                                fontFamily: 'IBM',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (columnCheveuxUserRecord.pellicules! == 0) ...{
                                              Text(
                                                'Oui',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                            if (columnCheveuxUserRecord.pellicules! == 1) ...{
                                              Text(
                                                'Non',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.of(context).viewInsets,
                                          child: SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.45,
                                            child: const RoutineWidget(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Objectif de routine capillaire',
                                              style: MizzUpTheme.bodyText1.override(
                                                fontFamily: 'IBM',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (columnCheveuxUserRecord.routineCapillaire! == 0) ...{
                                              Text(
                                                'Avoir une routine efficace',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                            if (columnCheveuxUserRecord.routineCapillaire! == 1) ...{
                                              Text(
                                                'Débuter une transition',
                                                style: MizzUpTheme.bodyText1.override(
                                                  fontFamily: 'IBM',
                                                  color: MizzUpTheme.tertiaryColor,
                                                  fontSize: 16,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            },
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
