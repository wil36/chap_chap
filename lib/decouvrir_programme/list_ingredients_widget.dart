// ignore_for_file: avoid_print, prefer_is_empty

import 'package:chap_chap/MizzUp_Code/MizzUp_icon_button.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../backend/backend.dart';
import 'package:flutter/material.dart';

class ListIngredientsWidget extends StatefulWidget {
  const ListIngredientsWidget({
    Key? key,
    required this.progRef,
  }) : super(key: key);

  final ProgrammesRecord progRef;

  @override
  _ListIngredientsWidgetState createState() => _ListIngredientsWidgetState();
}

class _ListIngredientsWidgetState extends State<ListIngredientsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MizzUpTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [],
              ),
            ),
            Container(
              width: double.infinity,
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
                                          Icons.arrow_back,
                                          color: MizzUpTheme.tertiaryColor,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Text(
                                        'Ma liste d\'ingrédients',
                                        style: MizzUpTheme.title3.override(
                                          fontFamily: 'IBM',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: MizzUpTheme.tertiaryColor,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 5, 0, 0),
                                          child: Text(
                                            'En partenariat avec',
                                            style: MizzUpTheme.title3.override(
                                              fontFamily: 'IBM',
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 5),
                                          child: Container(
                                            width: 200,
                                            height: 40,
                                            decoration: const BoxDecoration(),
                                            child: Image.network(
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/idh6y1s24egd/AROMAZONE_BLANC.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                StreamBuilder<List<ListIngredientsRecord?>>(
                                  stream: queryListIngredientsRecord(
                                    queryBuilder: (listIngredientsRecord) =>
                                        listIngredientsRecord.where(
                                            'poudresAroma',
                                            isEqualTo: true),
                                  ),
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
                                    List<ListIngredientsRecord?>
                                        containerListIngredientsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((containerListIngredientsRecordList
                                                  .length) >
                                              0)
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                        20, 30, 0, 30),
                                                child: Text(
                                                  'Les poudres',
                                                  style: MizzUpTheme.bodyText1
                                                      .override(
                                                    fontFamily: 'IBM',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Builder(
                                            builder: (context) {
                                              final listPoudres =
                                                  containerListIngredientsRecordList
                                                      .toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    listPoudres.length,
                                                    (listPoudresIndex) {
                                                  final listPoudresItem =
                                                      listPoudres[
                                                          listPoudresIndex];

                                                  if (listPoudresItem!
                                                          .progRef ==
                                                      widget
                                                          .progRef.reference) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              20, 10, 10, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await launchURL(
                                                              listPoudresItem
                                                                  .lienExterne!);
                                                        },
                                                        child: Material(
                                                          elevation: 5,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          child: Container(
                                                            width: 350,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  child:
                                                                       Image.network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                      listPoudresItem
                                                                          .image!,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/subghoup3kka/app_launcher_icon.png',
                                                                    ),
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.15,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    listPoudresItem
                                                                        .titre!,
                                                                    style: MizzUpTheme
                                                                        .subtitle2
                                                                        .override(
                                                                      fontFamily:
                                                                          'IBM',
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1,
                                                                            0),
                                                                    child:
                                                                        MizzUpIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          60,
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .shopping_cart_outlined,
                                                                        color: MizzUpTheme
                                                                            .tertiaryColor,
                                                                        size:
                                                                            25,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                StreamBuilder<List<ListIngredientsRecord?>>(
                                  stream: queryListIngredientsRecord(
                                    queryBuilder: (listIngredientsRecord) =>
                                        listIngredientsRecord.where(
                                            'huilesAroma',
                                            isEqualTo: true),
                                  ),
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
                                    List<ListIngredientsRecord?>
                                        containerListIngredientsRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (containerListIngredientsRecordList
                                                  .length >
                                              0)
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                        20, 30, 0, 30),
                                                child: Text(
                                                  'Les huiles',
                                                  style: MizzUpTheme.bodyText1
                                                      .override(
                                                    fontFamily: 'IBM',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Builder(
                                            builder: (context) {
                                              final listHuilesBaB =
                                                  containerListIngredientsRecordList
                                                      .toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    listHuilesBaB.length,
                                                    (listHuilesBaBIndex) {
                                                  final listHuilesBaBItem =
                                                      listHuilesBaB[
                                                          listHuilesBaBIndex];
                                                  if (listHuilesBaBItem!
                                                          .progRef ==
                                                      widget
                                                          .progRef.reference) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              20, 10, 10, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await launchURL(
                                                              listHuilesBaBItem
                                                                  .lienExterne!);
                                                        },
                                                        child: Material(
                                                          elevation: 5,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          child: Container(
                                                            width: 350,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  child:
                                                                      Image.network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                      listHuilesBaBItem
                                                                          .image!,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/subghoup3kka/app_launcher_icon.png',
                                                                    ),
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.15,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    listHuilesBaBItem
                                                                        .titre!,
                                                                    style: MizzUpTheme
                                                                        .subtitle2
                                                                        .override(
                                                                      fontFamily:
                                                                          'IBM',
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1,
                                                                            0),
                                                                    child:
                                                                        MizzUpIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          60,
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .shopping_cart_outlined,
                                                                        color: MizzUpTheme
                                                                            .tertiaryColor,
                                                                        size:
                                                                            25,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            StreamBuilder<List<ListIngredientsRecord?>>(
                              stream: queryListIngredientsRecord(
                                queryBuilder: (listIngredientsRecord) =>
                                    listIngredientsRecord
                                        .where('progRef',
                                            isEqualTo: widget.progRef.reference)
                                        .where('divers', isEqualTo: true),
                              ),
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
                                List<ListIngredientsRecord?>
                                    containerListIngredientsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((containerListIngredientsRecordList
                                              .length) >
                                          0)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(20, 30, 0, 30),
                                            child: Text(
                                              'Divers',
                                              style: MizzUpTheme.bodyText1
                                                  .override(
                                                fontFamily: 'IBM',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        child: Builder(
                                          builder: (context) {
                                            final listDivers =
                                                containerListIngredientsRecordList
                                                    .toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  listDivers.length,
                                                  (listDiversIndex) {
                                                final listDiversItem =
                                                    listDivers[listDiversIndex];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          20, 10, 10, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await launchURL(
                                                          listDiversItem
                                                              .lienExterne!);
                                                    },
                                                    child: Material(
                                                      elevation: 5,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Container(
                                                        width: 350,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listDiversItem!
                                                                      .image!,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/subghoup3kka/app_launcher_icon.png',
                                                                ),
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.15,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                      10,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                listDiversItem
                                                                    .titre!,
                                                                style: MizzUpTheme
                                                                    .subtitle2
                                                                    .override(
                                                                  fontFamily:
                                                                      'IBM',
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1, 0),
                                                                child:
                                                                    MizzUpIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      60,
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .shopping_cart_outlined,
                                                                    color: MizzUpTheme
                                                                        .tertiaryColor,
                                                                    size: 25,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 10),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: MizzUpTheme.tertiaryColor,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                      child: Text(
                                        'En partenariat avec',
                                        style: MizzUpTheme.title3.override(
                                          fontFamily: 'IBM',
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 5),
                                      child: Container(
                                        width: 250,
                                        height: 40,
                                        decoration: const BoxDecoration(),
                                        child: Image.network(
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/sn16r1exdgvr/BARABOUCLE_2_BLANC.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            StreamBuilder<List<ListIngredientsRecord?>>(
                              stream: queryListIngredientsRecord(
                                queryBuilder: (listIngredientsRecord) =>
                                    listIngredientsRecord.where('poudresBaB',
                                        isEqualTo: true),
                              ),
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
                                List<ListIngredientsRecord?>
                                    containerListIngredientsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final listPoudresBaB =
                                              containerListIngredientsRecordList
                                                  .toList();
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                listPoudresBaB.length,
                                                (listPoudresBaBIndex) {
                                              final listPoudresBaBItem =
                                                  listPoudresBaB[
                                                      listPoudresBaBIndex];
                                              if (listPoudresBaBItem!.progRef ==
                                                  widget.progRef.reference) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          20, 10, 10, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await launchURL(
                                                          listPoudresBaBItem
                                                              .lienExterne!);
                                                    },
                                                    child: Material(
                                                      elevation: 5,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Container(
                                                        width: 350,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listPoudresBaBItem
                                                                      .image!,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/subghoup3kka/app_launcher_icon.png',
                                                                ),
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.15,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                      10,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: SizedBox(
                                                                width: 200,
                                                                child: Text(
                                                                  listPoudresBaBItem
                                                                      .titre!,
                                                                  style: MizzUpTheme
                                                                      .subtitle2
                                                                      .override(
                                                                    fontFamily:
                                                                        'IBM',
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1, 0),
                                                                child:
                                                                    MizzUpIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      60,
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .shopping_cart_outlined,
                                                                    color: MizzUpTheme
                                                                        .tertiaryColor,
                                                                    size: 25,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container();
                                              }
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<ListIngredientsRecord?>>(
                              stream: queryListIngredientsRecord(
                                queryBuilder: (listIngredientsRecord) =>
                                    listIngredientsRecord.where('huilesBaB',
                                        isEqualTo: true).orderBy('create_time', descending: true),
                              ),
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
                                List<ListIngredientsRecord?>
                                    containerListIngredientsRecordList =
                                    snapshot.data!;
                                print(containerListIngredientsRecordList);
                                return Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final listHuileBaB =
                                              containerListIngredientsRecordList
                                                  .toList();
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                listHuileBaB.length,
                                                (listHuileBaBIndex) {
                                              final listHuileBaBItem =
                                                  listHuileBaB[
                                                      listHuileBaBIndex];
                                              if (listHuileBaBItem!.progRef ==
                                                  widget.progRef.reference) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          20, 10, 10, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await launchURL(
                                                          listHuileBaBItem
                                                              .lienExterne!);
                                                    },
                                                    child: Material(
                                                      elevation: 5,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Container(
                                                        width: 350,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listHuileBaBItem
                                                                      .image!,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/subghoup3kka/app_launcher_icon.png',
                                                                ),
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.15,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                      10,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: SizedBox(
                                                                width: 200,
                                                                child: Text(
                                                                  listHuileBaBItem
                                                                      .titre!,
                                                                  style: MizzUpTheme
                                                                      .subtitle2
                                                                      .override(
                                                                    fontFamily:
                                                                        'IBM',
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1, 0),
                                                                child:
                                                                    MizzUpIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      60,
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .shopping_cart_outlined,
                                                                    color: MizzUpTheme
                                                                        .tertiaryColor,
                                                                    size: 25,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container();
                                              }
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: double.infinity,
                              height: 200,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
