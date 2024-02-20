// ignore_for_file: unrelated_type_equality_checks, avoid_print
import 'package:chap_chap/main.dart';
import 'package:chap_chap/notification/notifcontroller.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../MizzUp_Code/MizzUp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NouveauProgrammeWidget extends StatefulWidget {
  const NouveauProgrammeWidget({
    Key? key,
    this.detailsProg,
  }) : super(key: key);

  final ProgrammesRecord? detailsProg;

  @override
  _NouveauProgrammeWidgetState createState() => _NouveauProgrammeWidgetState();
}

extension DateTimeExtension on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }
}

class _NouveauProgrammeWidgetState extends State<NouveauProgrammeWidget> {
  DateTime picker1 = DateTime.now();

  DocumentReference semaineSpecial0 = FirebaseFirestore.instance
      .collection('detailsWeekProg')
      .doc('HrB5csYvIUaIGytdhVl0');
  DocumentReference semaineSpecial1 = FirebaseFirestore.instance
      .collection('detailsWeekProg')
      .doc('2S7VhnVhFnWQW4yI06Xz');
  int? defaultChoiceIndex;
  final List<String> _choicesList = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];
  String nextDay = '';

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('progUser')
        .where('userRef', isEqualTo: currentUserReference)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final picker = DateTime(picker1.year, picker1.month, picker1.day);
    return StreamBuilder<ProgrammesRecord?>(
      stream: ProgrammesRecord.getDocument(widget.detailsProg!.reference!),
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
        final containerProgProgrammesRecord = snapshot.data;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: StreamBuilder<List<DetailsWeekProgRecord?>>(
            stream: queryDetailsWeekProgRecord(
              queryBuilder: (detailsWeekProgRecord) => detailsWeekProgRecord
                  .where('progRef',
                      isEqualTo: containerProgProgrammesRecord!.reference)
                  .where('semaineNumero', isEqualTo: 1),
              singleRecord: true,
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
              List<DetailsWeekProgRecord?> week1DetailsWeekProgRecordList =
                  snapshot.data!;
              final week1DetailsWeekProgRecord =
                  week1DetailsWeekProgRecordList.isNotEmpty
                      ? week1DetailsWeekProgRecordList.first
                      : null;
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: StreamBuilder<List<DetailsWeekProgRecord?>>(
                  stream: queryDetailsWeekProgRecord(
                    queryBuilder: (detailsWeekProgRecord) =>
                        detailsWeekProgRecord
                            .where('progRef',
                                isEqualTo:
                                    containerProgProgrammesRecord!.reference)
                            .where('semaineNumero', isEqualTo: 2),
                    singleRecord: true,
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
                    List<DetailsWeekProgRecord?>
                        week2DetailsWeekProgRecordList = snapshot.data!;
                    final week2DetailsWeekProgRecord =
                        week2DetailsWeekProgRecordList.isNotEmpty
                            ? week2DetailsWeekProgRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: StreamBuilder<List<DetailsWeekProgRecord?>>(
                        stream: queryDetailsWeekProgRecord(
                          queryBuilder: (detailsWeekProgRecord) =>
                              detailsWeekProgRecord
                                  .where('progRef',
                                      isEqualTo: containerProgProgrammesRecord!
                                          .reference)
                                  .where('semaineNumero', isEqualTo: 3),
                          singleRecord: true,
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
                          List<DetailsWeekProgRecord?>
                              week3DetailsWeekProgRecordList = snapshot.data!;
                          final week3DetailsWeekProgRecord =
                              week3DetailsWeekProgRecordList.isNotEmpty
                                  ? week3DetailsWeekProgRecordList.first
                                  : null;
                          return Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: StreamBuilder<List<DetailsWeekProgRecord?>>(
                              stream: queryDetailsWeekProgRecord(
                                queryBuilder: (detailsWeekProgRecord) =>
                                    detailsWeekProgRecord
                                        .where('progRef',
                                            isEqualTo:
                                                containerProgProgrammesRecord!
                                                    .reference)
                                        .where('semaineNumero', isEqualTo: 4),
                                singleRecord: true,
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
                                List<DetailsWeekProgRecord?>
                                    week4DetailsWeekProgRecordList =
                                    snapshot.data!;
                                final week4DetailsWeekProgRecord =
                                    week4DetailsWeekProgRecordList.isNotEmpty
                                        ? week4DetailsWeekProgRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<
                                      List<DetailsWeekProgRecord?>>(
                                    stream: queryDetailsWeekProgRecord(
                                      queryBuilder: (detailsWeekProgRecord) =>
                                          detailsWeekProgRecord
                                              .where('progRef',
                                                  isEqualTo:
                                                      containerProgProgrammesRecord!
                                                          .reference)
                                              .where('semaineNumero',
                                                  isEqualTo: 5),
                                      singleRecord: true,
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
                                      List<DetailsWeekProgRecord?>
                                          week5DetailsWeekProgRecordList =
                                          snapshot.data!;
                                      final week5DetailsWeekProgRecord =
                                          week5DetailsWeekProgRecordList
                                                  .isNotEmpty
                                              ? week5DetailsWeekProgRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: StreamBuilder<
                                            List<DetailsWeekProgRecord?>>(
                                          stream: queryDetailsWeekProgRecord(
                                            queryBuilder: (detailsWeekProgRecord) =>
                                                detailsWeekProgRecord
                                                    .where('progRef',
                                                        isEqualTo:
                                                            containerProgProgrammesRecord!
                                                                .reference)
                                                    .where('semaineNumero',
                                                        isEqualTo: 6),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return const Center(
                                                child: SizedBox(
                                                  width: 60,
                                                  height: 60,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<DetailsWeekProgRecord?>
                                                week6DetailsWeekProgRecordList =
                                                snapshot.data!;
                                            final week6DetailsWeekProgRecord =
                                                week6DetailsWeekProgRecordList
                                                        .isNotEmpty
                                                    ? week6DetailsWeekProgRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<DetailsWeekProgRecord?>>(
                                                stream:
                                                    queryDetailsWeekProgRecord(
                                                  queryBuilder: (detailsWeekProgRecord) =>
                                                      detailsWeekProgRecord
                                                          .where('progRef',
                                                              isEqualTo:
                                                                  containerProgProgrammesRecord!
                                                                      .reference)
                                                          .where(
                                                              'semaineNumero',
                                                              isEqualTo: 7),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 60,
                                                        height: 60,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<DetailsWeekProgRecord?>
                                                      week7DetailsWeekProgRecordList =
                                                      snapshot.data!;
                                                  final week7DetailsWeekProgRecord =
                                                      week7DetailsWeekProgRecordList
                                                              .isNotEmpty
                                                          ? week7DetailsWeekProgRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: StreamBuilder<
                                                        List<
                                                            DetailsWeekProgRecord?>>(
                                                      stream:
                                                          queryDetailsWeekProgRecord(
                                                        queryBuilder: (detailsWeekProgRecord) =>
                                                            detailsWeekProgRecord
                                                                .where(
                                                                    'progRef',
                                                                    isEqualTo:
                                                                        containerProgProgrammesRecord!
                                                                            .reference)
                                                                .where(
                                                                    'semaineNumero',
                                                                    isEqualTo:
                                                                        8),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const Center(
                                                            child: SizedBox(
                                                              width: 60,
                                                              height: 60,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<DetailsWeekProgRecord?>
                                                            week8DetailsWeekProgRecordList =
                                                            snapshot.data!;
                                                        final week8DetailsWeekProgRecord =
                                                            week8DetailsWeekProgRecordList
                                                                    .isNotEmpty
                                                                ? week8DetailsWeekProgRecordList
                                                                    .first
                                                                : null;
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: StreamBuilder<
                                                              List<
                                                                  DetailsWeekProgRecord?>>(
                                                            stream:
                                                                queryDetailsWeekProgRecord(
                                                              queryBuilder: (detailsWeekProgRecord) => detailsWeekProgRecord
                                                                  .where(
                                                                      'progRef',
                                                                      isEqualTo:
                                                                          containerProgProgrammesRecord!
                                                                              .reference)
                                                                  .where(
                                                                      'semaineNumero',
                                                                      isEqualTo:
                                                                          9),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return const Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<DetailsWeekProgRecord?>
                                                                  week9DetailsWeekProgRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final week9DetailsWeekProgRecord =
                                                                  week9DetailsWeekProgRecordList
                                                                          .isNotEmpty
                                                                      ? week9DetailsWeekProgRecordList
                                                                          .first
                                                                      : null;
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        DetailsWeekProgRecord?>>(
                                                                  stream:
                                                                      queryDetailsWeekProgRecord(
                                                                    queryBuilder: (detailsWeekProgRecord) => detailsWeekProgRecord
                                                                        .where(
                                                                            'progRef',
                                                                            isEqualTo: containerProgProgrammesRecord!
                                                                                .reference)
                                                                        .where(
                                                                            'semaineNumero',
                                                                            isEqualTo:
                                                                                10),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return const Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              60,
                                                                          height:
                                                                              60,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<DetailsWeekProgRecord?>
                                                                        week10DetailsWeekProgRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final week10DetailsWeekProgRecord = week10DetailsWeekProgRecordList
                                                                            .isNotEmpty
                                                                        ? week10DetailsWeekProgRecordList
                                                                            .first
                                                                        : null;
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              DetailsWeekProgRecord?>>(
                                                                        stream:
                                                                            queryDetailsWeekProgRecord(
                                                                          queryBuilder: (detailsWeekProgRecord) => detailsWeekProgRecord.where('progRef', isEqualTo: containerProgProgrammesRecord!.reference).where(
                                                                              'semaineNumero',
                                                                              isEqualTo: 11),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<DetailsWeekProgRecord?>
                                                                              week11DetailsWeekProgRecordList =
                                                                              snapshot.data!;
                                                                          final week11DetailsWeekProgRecord = week11DetailsWeekProgRecordList.isNotEmpty
                                                                              ? week11DetailsWeekProgRecordList.first
                                                                              : null;
                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                StreamBuilder<List<DetailsWeekProgRecord?>>(
                                                                              stream: queryDetailsWeekProgRecord(
                                                                                queryBuilder: (detailsWeekProgRecord) => detailsWeekProgRecord.where('progRef', isEqualTo: containerProgProgrammesRecord!.reference).where('semaineNumero', isEqualTo: 12),
                                                                                singleRecord: true,
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
                                                                                List<DetailsWeekProgRecord?> week12DetailsWeekProgRecordList = snapshot.data!;
                                                                                final week12DetailsWeekProgRecord = week12DetailsWeekProgRecordList.isNotEmpty ? week12DetailsWeekProgRecordList.first : null;
                                                                                return Container(
                                                                                  width: double.infinity,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(0, -0.85),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 20, 0),
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
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: const BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 20),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  MizzUpIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30,
                                                                                                    borderWidth: 1,
                                                                                                    buttonSize: 60,
                                                                                                    icon: const FaIcon(
                                                                                                      FontAwesomeIcons.clock,
                                                                                                      color: MizzUpTheme.tertiaryColor,
                                                                                                      size: 30,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Quel est ton jour de Wash Day préféré ?',
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: MizzUpTheme.bodyText1.override(
                                                                                                      fontFamily: 'IBM',
                                                                                                      color: Colors.black,
                                                                                                      fontSize: 12,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 25),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0, 0),
                                                                                            child: SizedBox(
                                                                                              width: 365,
                                                                                              child: Wrap(
                                                                                                spacing: 8,
                                                                                                alignment: WrapAlignment.spaceEvenly,
                                                                                                children: List.generate(_choicesList.length, (index) {
                                                                                                  return ChoiceChip(
                                                                                                    labelPadding: const EdgeInsets.all(2.0),
                                                                                                    label: Text(
                                                                                                      _choicesList[index],
                                                                                                      style: MizzUpTheme.bodyText1.override(
                                                                                                        fontFamily: 'IBM',
                                                                                                        fontSize: 14,
                                                                                                        color: defaultChoiceIndex == index ? Colors.white : Colors.black,
                                                                                                        fontWeight: FontWeight.w400,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                    ),

                                                                                                    selected: defaultChoiceIndex == index,
                                                                                                    selectedColor: MizzUpTheme.primaryColor,
                                                                                                    backgroundColor: Colors.white,
                                                                                                    onSelected: (value) {
                                                                                                      if (_choicesList[index] == 'Lundi') {
                                                                                                        setState(() {
                                                                                                          var test = picker.next(DateTime.monday);
                                                                                                          nextDay = DateFormat.MMMMEEEEd('fr').format(test);
                                                                                                          defaultChoiceIndex = 0;
                                                                                                        });
                                                                                                      }
                                                                                                      if (_choicesList[index] == 'Mardi') {
                                                                                                        setState(() {
                                                                                                          var test = picker.next(DateTime.tuesday);
                                                                                                          nextDay = DateFormat.MMMMEEEEd('fr').format(test);
                                                                                                          defaultChoiceIndex = 1;
                                                                                                        });
                                                                                                      }
                                                                                                      if (_choicesList[index] == 'Mercredi') {
                                                                                                        setState(() {
                                                                                                          var test = picker.next(DateTime.wednesday);
                                                                                                          nextDay = DateFormat.MMMMEEEEd('fr').format(test);
                                                                                                          defaultChoiceIndex = 2;
                                                                                                        });
                                                                                                      }
                                                                                                      if (_choicesList[index] == 'Jeudi') {
                                                                                                        setState(() {
                                                                                                          var test = picker.next(DateTime.thursday);
                                                                                                          nextDay = DateFormat.MMMMEEEEd('fr').format(test);
                                                                                                          defaultChoiceIndex = 3;
                                                                                                        });
                                                                                                      }
                                                                                                      if (_choicesList[index] == 'Vendredi') {
                                                                                                        setState(() {
                                                                                                          var test = picker.next(DateTime.friday);
                                                                                                          nextDay = DateFormat.MMMMEEEEd('fr').format(test);
                                                                                                          defaultChoiceIndex = 4;
                                                                                                        });
                                                                                                      }
                                                                                                      if (_choicesList[index] == 'Samedi') {
                                                                                                        setState(() {
                                                                                                          var test = picker.next(DateTime.saturday);
                                                                                                          nextDay = DateFormat.MMMMEEEEd('fr').format(test);
                                                                                                          defaultChoiceIndex = 5;
                                                                                                        });
                                                                                                      }
                                                                                                      if (_choicesList[index] == 'Dimanche') {
                                                                                                        setState(() {
                                                                                                          var test = picker.next(DateTime.sunday);
                                                                                                          nextDay = DateFormat.MMMMEEEEd('fr').format(test);
                                                                                                          defaultChoiceIndex = 6;
                                                                                                        });
                                                                                                      }
                                                                                                    },
                                                                                                    // backgroundColor: color,
                                                                                                    elevation: 5,
                                                                                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                                                                                  );
                                                                                                }),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                                                                                          child: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 250,
                                                                                                child: Text(
                                                                                                  'Ton programme commencera \n${nextDay.toUpperCase()}',
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: MizzUpTheme.bodyText1.override(
                                                                                                    fontFamily: 'IBM',
                                                                                                    color: Colors.black,
                                                                                                    fontSize: 12,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0, -1),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                if (containerProgProgrammesRecord!.titre == 'Programme Pousse') {
                                                                                                  if (defaultChoiceIndex == 0) {
                                                                                                    NotifController().subscribeToPousseProgram(picker.next(DateTime.monday));
                                                                                                    final progUserCreateData01 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.monday), numberDay: 1, progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData02 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.monday).add(const Duration(days: 1)), numberDay: 1, progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 1)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData03 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.monday).add(const Duration(days: 2)), numberDay: 1, progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 2)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData04 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.monday).add(const Duration(days: 3)), numberDay: 1, progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 3)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData05 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.monday).add(const Duration(days: 4)), numberDay: 1, progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 4)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData06 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.monday).add(const Duration(days: 5)), numberDay: 1, progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 5)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData07 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.monday).add(const Duration(days: 6)), numberDay: 1, progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 6)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 7)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 14)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 21)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 28)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 35)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 42)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 49)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 56)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 63)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 70)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 77)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 84)),
                                                                                                        numberDay: 1,
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 84)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);

                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData02);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData03);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData04);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData05);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData06);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData07);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 1) {
                                                                                                    NotifController().subscribeToPousseProgram(picker.next(DateTime.tuesday));
                                                                                                    final progUserCreateData01 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData02 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday).add(const Duration(days: 1)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 1)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData03 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday).add(const Duration(days: 2)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 2)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData04 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday).add(const Duration(days: 3)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 3)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData05 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday).add(const Duration(days: 4)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 4)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData06 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday).add(const Duration(days: 5)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 5)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData07 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday).add(const Duration(days: 6)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 6)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 84)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 84)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData02);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData03);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData04);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData05);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData06);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData07);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                  }
                                                                                                  if (defaultChoiceIndex == 2) {
                                                                                                    NotifController().subscribeToPousseProgram(picker.next(DateTime.wednesday));
                                                                                                    final progUserCreateData01 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData02 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday).add(const Duration(days: 1)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 1)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData03 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday).add(const Duration(days: 2)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 2)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData04 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday).add(const Duration(days: 3)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 3)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData05 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday).add(const Duration(days: 4)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 4)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData06 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday).add(const Duration(days: 5)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 5)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData07 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday).add(const Duration(days: 6)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 6)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 84)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 84)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData02);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData03);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData04);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData05);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData06);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData07);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 3) {
                                                                                                    NotifController().subscribeToPousseProgram(picker.next(DateTime.thursday));
                                                                                                    final progUserCreateData01 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.thursday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData02 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.thursday).add(const Duration(days: 1)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 1)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData03 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.thursday).add(const Duration(days: 2)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 2)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData04 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.thursday).add(const Duration(days: 3)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 3)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData05 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.thursday).add(const Duration(days: 4)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 4)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData06 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.thursday).add(const Duration(days: 5)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 5)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData07 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.thursday).add(const Duration(days: 6)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 6)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 84)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 84)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData02);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData03);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData04);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData05);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData06);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData07);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 4) {
                                                                                                    NotifController().subscribeToPousseProgram(picker.next(DateTime.friday));
                                                                                                    final progUserCreateData01 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.friday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData02 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.friday).add(const Duration(days: 1)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 1)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData03 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.friday).add(const Duration(days: 2)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 2)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData04 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.friday).add(const Duration(days: 3)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 3)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData05 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.friday).add(const Duration(days: 4)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 4)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData06 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.friday).add(const Duration(days: 5)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 5)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData07 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.friday).add(const Duration(days: 6)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 6)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 84)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 84)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData02);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData03);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData04);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData05);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData06);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData07);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 5) {
                                                                                                    NotifController().subscribeToPousseProgram(picker.next(DateTime.saturday));
                                                                                                    final progUserCreateData01 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.saturday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData02 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.saturday).add(const Duration(days: 1)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 1)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData03 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.saturday).add(const Duration(days: 2)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 2)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData04 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.saturday).add(const Duration(days: 3)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 3)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData05 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.saturday).add(const Duration(days: 4)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 4)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData06 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.saturday).add(const Duration(days: 5)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 5)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData07 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.saturday).add(const Duration(days: 6)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 6)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 84)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 84)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData02);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData03);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData04);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData05);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData06);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData07);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 6) {
                                                                                                    NotifController().subscribeToPousseProgram(picker.next(DateTime.sunday));
                                                                                                    final progUserCreateData01 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.sunday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData02 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.sunday).add(const Duration(days: 1)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 1)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData03 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.sunday).add(const Duration(days: 2)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 2)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData04 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.sunday).add(const Duration(days: 3)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 3)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData05 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.sunday).add(const Duration(days: 4)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 4)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData06 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.sunday).add(const Duration(days: 5)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 5)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData07 = {
                                                                                                      ...createProgUserRecordData(createTime: picker.next(DateTime.sunday).add(const Duration(days: 6)), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: semaineSpecial0),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 6)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 84)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 84)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData02);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData03);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData04);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData05);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData06);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData07);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                  } else {
                                                                                                    await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: const Text('Aucune date n\'a été choisie'),
                                                                                                            content: const Text('Rajoute une date avant de commencer ton programme'),
                                                                                                            actions: [
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                child: const Text('Ok'),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        });
                                                                                                  }
                                                                                                }

                                                                                                if (containerProgProgrammesRecord.titre == 'Programme Découverte') {
                                                                                                  
                                                                                                    if (defaultChoiceIndex == 0) {
                                                                                                      NotifController().subscribeToDecouverteProgram(picker.next(DateTime.monday));
                                                                                                      final progUserCreateData01 = {
                                                                                                        ...createProgUserRecordData(createTime: picker.next(DateTime.monday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: week1DetailsWeekProgRecord!.reference),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.monday),
                                                                                                        ],
                                                                                                      };

                                                                                                      final progUserCreateData = {
                                                                                                        ...createProgUserRecordData(
                                                                                                          createTime: picker.next(DateTime.monday).add(const Duration(days: 7)),
                                                                                                          progRef: widget.detailsProg!.reference,
                                                                                                          userRef: currentUserReference,
                                                                                                          semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                        ),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.monday).add(const Duration(days: 7)),
                                                                                                        ],
                                                                                                      };

                                                                                                      final usersUpdateData = createUsersRecordData(
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                      );
                                                                                                      await currentUserReference!.update(usersUpdateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                      await Navigator.pushAndRemoveUntil(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                        (r) => false,
                                                                                                      );
                                                                                                    }

                                                                                                    if (defaultChoiceIndex == 1) {
                                                                                                      NotifController().subscribeToDecouverteProgram(picker.next(DateTime.tuesday));
                                                                                                      final progUserCreateData01 = {
                                                                                                        ...createProgUserRecordData(createTime: picker.next(DateTime.tuesday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: week1DetailsWeekProgRecord!.reference),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.tuesday),
                                                                                                        ],
                                                                                                      };

                                                                                                      final progUserCreateData = {
                                                                                                        ...createProgUserRecordData(
                                                                                                          createTime: picker.next(DateTime.tuesday).add(const Duration(days: 7)),
                                                                                                          progRef: widget.detailsProg!.reference,
                                                                                                          userRef: currentUserReference,
                                                                                                          semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                        ),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.tuesday).add(const Duration(days: 7)),
                                                                                                        ],
                                                                                                      };

                                                                                                      final usersUpdateData = createUsersRecordData(
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                      );
                                                                                                      await currentUserReference!.update(usersUpdateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                      await Navigator.pushAndRemoveUntil(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                        (r) => false,
                                                                                                      );
                                                                                                    }
                                                                                                    if (defaultChoiceIndex == 2) {
                                                                                                      NotifController().subscribeToDecouverteProgram(picker.next(DateTime.wednesday));
                                                                                                      final progUserCreateData01 = {
                                                                                                        ...createProgUserRecordData(createTime: picker.next(DateTime.wednesday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: week1DetailsWeekProgRecord!.reference),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.wednesday),
                                                                                                        ],
                                                                                                      };

                                                                                                      final progUserCreateData = {
                                                                                                        ...createProgUserRecordData(
                                                                                                          createTime: picker.next(DateTime.wednesday).add(const Duration(days: 7)),
                                                                                                          progRef: widget.detailsProg!.reference,
                                                                                                          userRef: currentUserReference,
                                                                                                          semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                        ),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.wednesday).add(const Duration(days: 7)),
                                                                                                        ],
                                                                                                      };

                                                                                                      final usersUpdateData = createUsersRecordData(
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                      );
                                                                                                      await currentUserReference!.update(usersUpdateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                      await Navigator.pushAndRemoveUntil(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                        (r) => false,
                                                                                                      );
                                                                                                    }

                                                                                                    if (defaultChoiceIndex == 3) {
                                                                                                      NotifController().subscribeToDecouverteProgram(picker.next(DateTime.thursday));
                                                                                                      final progUserCreateData01 = {
                                                                                                        ...createProgUserRecordData(createTime: picker.next(DateTime.thursday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: week1DetailsWeekProgRecord!.reference),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.thursday),
                                                                                                        ],
                                                                                                      };

                                                                                                      final progUserCreateData = {
                                                                                                        ...createProgUserRecordData(
                                                                                                          createTime: picker.next(DateTime.thursday).add(const Duration(days: 7)),
                                                                                                          progRef: widget.detailsProg!.reference,
                                                                                                          userRef: currentUserReference,
                                                                                                          semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                        ),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.thursday).add(const Duration(days: 7)),
                                                                                                        ],
                                                                                                      };

                                                                                                      final usersUpdateData = createUsersRecordData(
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                      );
                                                                                                      await currentUserReference!.update(usersUpdateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                      await Navigator.pushAndRemoveUntil(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                        (r) => false,
                                                                                                      );
                                                                                                    }

                                                                                                    if (defaultChoiceIndex == 4) {
                                                                                                      NotifController().subscribeToDecouverteProgram(picker.next(DateTime.friday));
                                                                                                      final progUserCreateData01 = {
                                                                                                        ...createProgUserRecordData(createTime: picker.next(DateTime.friday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: week1DetailsWeekProgRecord!.reference),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.friday),
                                                                                                        ],
                                                                                                      };

                                                                                                      final progUserCreateData = {
                                                                                                        ...createProgUserRecordData(
                                                                                                          createTime: picker.next(DateTime.friday).add(const Duration(days: 7)),
                                                                                                          progRef: widget.detailsProg!.reference,
                                                                                                          userRef: currentUserReference,
                                                                                                          semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                        ),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.friday).add(const Duration(days: 7)),
                                                                                                        ],
                                                                                                      };

                                                                                                      final usersUpdateData = createUsersRecordData(
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                      );
                                                                                                      await currentUserReference!.update(usersUpdateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                      await Navigator.pushAndRemoveUntil(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                        (r) => false,
                                                                                                      );
                                                                                                    }

                                                                                                    if (defaultChoiceIndex == 5) {
                                                                                                      NotifController().subscribeToDecouverteProgram(picker.next(DateTime.saturday));
                                                                                                      final progUserCreateData01 = {
                                                                                                        ...createProgUserRecordData(createTime: picker.next(DateTime.saturday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: week1DetailsWeekProgRecord!.reference),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.saturday),
                                                                                                        ],
                                                                                                      };

                                                                                                      final progUserCreateData = {
                                                                                                        ...createProgUserRecordData(
                                                                                                          createTime: picker.next(DateTime.saturday).add(const Duration(days: 7)),
                                                                                                          progRef: widget.detailsProg!.reference,
                                                                                                          userRef: currentUserReference,
                                                                                                          semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                        ),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.saturday).add(const Duration(days: 7)),
                                                                                                        ],
                                                                                                      };

                                                                                                      final usersUpdateData = createUsersRecordData(
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                      );
                                                                                                      await currentUserReference!.update(usersUpdateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                      await Navigator.pushAndRemoveUntil(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                        (r) => false,
                                                                                                      );
                                                                                                    }

                                                                                                    if (defaultChoiceIndex == 6) {
                                                                                                      NotifController().subscribeToDecouverteProgram(picker.next(DateTime.sunday));
                                                                                                      final progUserCreateData01 = {
                                                                                                        ...createProgUserRecordData(createTime: picker.next(DateTime.sunday), progRef: widget.detailsProg!.reference, userRef: currentUserReference, semaineShow: week1DetailsWeekProgRecord!.reference),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.sunday),
                                                                                                        ],
                                                                                                      };

                                                                                                      final progUserCreateData = {
                                                                                                        ...createProgUserRecordData(
                                                                                                          createTime: picker.next(DateTime.sunday).add(const Duration(days: 7)),
                                                                                                          progRef: widget.detailsProg!.reference,
                                                                                                          userRef: currentUserReference,
                                                                                                          semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                        ),
                                                                                                        'dateAffichage1': [
                                                                                                          picker.next(DateTime.sunday).add(const Duration(days: 7)),
                                                                                                        ],
                                                                                                      };

                                                                                                      final usersUpdateData = createUsersRecordData(
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                      );
                                                                                                      await currentUserReference!.update(usersUpdateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                      await ProgUserRecord.collection.doc().set(progUserCreateData01);
                                                                                                      await Navigator.pushAndRemoveUntil(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                        (r) => false,
                                                                                                      );
                                                                                                    } else {
                                                                                                      await showDialog(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return AlertDialog(
                                                                                                              title: const Text('Aucune date n\'a été choisie'),
                                                                                                              content: const Text('Rajoute une date avant de commencer ton programme'),
                                                                                                              actions: [
                                                                                                                TextButton(
                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                  child: const Text('Ok'),
                                                                                                                ),
                                                                                                              ],
                                                                                                            );
                                                                                                          });
                                                                                                    }
                                                                                                  
                                                                                                } 
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                else {
                                                                                                  if (defaultChoiceIndex == 0) {
                                                                                                    NotifController().subscribeToChapChapProgram(picker.next(DateTime.monday));
                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday),
                                                                                                      ],
                                                                                                    };
                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.monday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.monday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                    FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference).get().then((snapshot) {
                                                                                                      for (DocumentSnapshot ds in snapshot.docs) {
                                                                                                        ds.reference.delete();
                                                                                                      }
                                                                                                    });
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 1) {
                                                                                                    NotifController().subscribeToChapChapProgram(picker.next(DateTime.tuesday));
                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday)
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.tuesday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.tuesday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                    FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference).get().then((snapshot) {
                                                                                                      for (DocumentSnapshot ds in snapshot.docs) {
                                                                                                        ds.reference.delete();
                                                                                                      }
                                                                                                    });
                                                                                                  }
                                                                                                  if (defaultChoiceIndex == 2) {
                                                                                                    NotifController().subscribeToChapChapProgram(picker.next(DateTime.wednesday));
                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday)
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.wednesday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.wednesday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                    FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference).get().then((snapshot) {
                                                                                                      for (DocumentSnapshot ds in snapshot.docs) {
                                                                                                        ds.reference.delete();
                                                                                                      }
                                                                                                    });
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 3) {
                                                                                                    NotifController().subscribeToChapChapProgram(picker.next(DateTime.thursday));
                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday)
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.thursday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.thursday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                    FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference).get().then((snapshot) {
                                                                                                      for (DocumentSnapshot ds in snapshot.docs) {
                                                                                                        ds.reference.delete();
                                                                                                      }
                                                                                                    });
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 4) {
                                                                                                    NotifController().subscribeToChapChapProgram(picker.next(DateTime.friday));
                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday)
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.friday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.friday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                    FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference).get().then((snapshot) {
                                                                                                      for (DocumentSnapshot ds in snapshot.docs) {
                                                                                                        ds.reference.delete();
                                                                                                      }
                                                                                                    });
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 5) {
                                                                                                    NotifController().subscribeToChapChapProgram(picker.next(DateTime.saturday));
                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday)
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.saturday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.saturday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                    FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference).get().then((snapshot) {
                                                                                                      for (DocumentSnapshot ds in snapshot.docs) {
                                                                                                        ds.reference.delete();
                                                                                                      }
                                                                                                    });
                                                                                                  }

                                                                                                  if (defaultChoiceIndex == 6) {
                                                                                                    NotifController().subscribeToChapChapProgram(picker.next(DateTime.sunday));
                                                                                                    final progUserCreateData = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week1DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday)
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData2 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 7)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week2DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 7)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData3 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 14)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week3DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 14)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData4 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 21)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week4DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 21)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData5 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 28)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week5DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 28)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData6 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 35)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week6DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 35)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData7 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 42)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week7DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 42)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData8 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 49)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week8DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 49)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData9 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 56)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week9DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 56)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData10 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 63)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week10DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 63)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData11 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 70)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week11DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 70)),
                                                                                                      ],
                                                                                                    };

                                                                                                    final progUserCreateData12 = {
                                                                                                      ...createProgUserRecordData(
                                                                                                        createTime: picker.next(DateTime.sunday).add(const Duration(days: 77)),
                                                                                                        progRef: widget.detailsProg!.reference,
                                                                                                        userRef: currentUserReference,
                                                                                                        semaineShow: week12DetailsWeekProgRecord!.reference,
                                                                                                      ),
                                                                                                      'dateAffichage1': [
                                                                                                        picker.next(DateTime.sunday).add(const Duration(days: 77)),
                                                                                                      ],
                                                                                                    };
                                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                                      progRef: widget.detailsProg!.reference,
                                                                                                    );
                                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData2);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData3);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData4);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData5);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData6);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData7);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData8);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData9);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData10);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData11);
                                                                                                    await ProgUserRecord.collection.doc().set(progUserCreateData12);
                                                                                                    await Navigator.pushAndRemoveUntil(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => const NavBarPage(index: 2)),
                                                                                                      (r) => false,
                                                                                                    );
                                                                                                    FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference).get().then((snapshot) {
                                                                                                      for (DocumentSnapshot ds in snapshot.docs) {
                                                                                                        ds.reference.delete();
                                                                                                      }
                                                                                                    });
                                                                                                  } else {
                                                                                                    await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: const Text('Aucune date n\'a été choisie'),
                                                                                                            content: const Text('Rajoute une date avant de commencer ton programme'),
                                                                                                            actions: [
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                child: const Text('Ok'),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        });
                                                                                                  }
                                                                                                }
                                                                                              },
                                                                                              text: 'Valider',
                                                                                              options: MizzUpOptionButton(
                                                                                                width: 130,
                                                                                                height: 40,
                                                                                                color: MizzUpTheme.secondaryColor,
                                                                                                textStyle: MizzUpTheme.title2.override(
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
                                                                                );
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
