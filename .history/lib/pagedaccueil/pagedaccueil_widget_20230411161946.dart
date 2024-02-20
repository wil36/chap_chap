// ignore_for_file: avoid_print, unnecessary_statements
import 'package:chap_chap/components/pas_de_prog_en_cours_widget.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_Calendar.dart';
import 'package:chap_chap/notification/notification_widget.dart';
import 'package:chap_chap/decouvrir_programme/programme_suite_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/nouvelle_routine_widget.dart';
import '../components/supprimer_programme_widget.dart';
import '../components/supprimer_routines_widget.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagedaccueilWidget extends StatefulWidget {
  const PagedaccueilWidget({Key? key}) : super(key: key);

  @override
  _PagedaccueilWidgetState createState() => _PagedaccueilWidgetState();
}

class _PagedaccueilWidgetState extends State<PagedaccueilWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<DateTime> dateProg = [DateTime.now()];
  List<dynamic> dateRoutine = [DateTime.now()];
  List<DateTime> dateRoutineOther = [DateTime.now()];
  DateTime recurrencePoint = DateTime.now();
  final Query<Map<String, dynamic>> collectionProg = FirebaseFirestore.instance.collection('progUser').where('userRef', isEqualTo: currentUserReference);
  final Query<Map<String, dynamic>> collectionRoutines = FirebaseFirestore.instance.collection('routines').where('userRef', isEqualTo: currentUserReference);

  @override
  void initState() {
    super.initState();
    getProgPoint(collectionProg);
    getRoutinePoint(collectionRoutines);
    //  endSubscription();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: MizzUpTheme.tertiaryColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
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
                    icon: const FaIcon(
                      FontAwesomeIcons.bell,
                      color: MizzUpTheme.primaryColor,
                      size: 20,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationWidget(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(40, 5, 0, 10),
                    child: GestureDetector(
                      onTap: () async {
                        // Récupère la référence de la collection "users"
                        final usersCollection = FirebaseFirestore.instance.collection('users');
                        print(usersCollection);

// Récupère la référence de la collection "likes"
                        final likesCollection = FirebaseFirestore.instance.collection('likes');
                        print(likesCollection);

                        await addLikesFromUsers(usersCollection, likesCollection);
                      },
                      child: Text(
                        'Bonjour $currentUserDisplayName',
                        textAlign: TextAlign.start,
                        style: MizzUpTheme.title1.override(
                          fontFamily: 'IBM',
                          color: Colors.white,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 10),
                    child: Text(
                      'Prêt(e) pour prendre soin de tes cheveux ?',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.white,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.8, 0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          calendar(),
                          addRoutine(),
                          progUser(),
                          routineUser(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<DateTime>?> getProgPoint(Query<Map<String, dynamic>> collection) async {
    var querySnapshot = await collection.where('create_time').get();
    var tut = querySnapshot.docs.map((doc) => doc.get('create_time').toDate()).toList();
    if (mounted) {
      setState(() {
        dateProg = tut.cast<DateTime>();
      });
    }
    return dateProg;
  }

  Future<List<DateTime>?> getRoutinePoint(Query<Map<String, dynamic>> collection) async {
    var querySnapshot = await collection.get();
    var tut = querySnapshot.docs.map((doc) => doc.get('reccurenceTime')).toList();
    for (var doc in tut) {
      final allDataFirst = doc;
      final listPointFirst = allDataFirst.map((allData1) => allData1.toDate()).toList();
      for (var doc2 in listPointFirst) {
        if (mounted) {
          setState(() {
            dateRoutineOther.add(doc2);
          });
        }
      }
    }
    for (var doc in querySnapshot.docs) {
      final allData = doc["reccurenceTime"];
      final listPointSecond = allData.map((allData) => allData.toDate()).toList();
      if (mounted) {
        setState(() {
          dateRoutine = listPointSecond;
        });
      }
    }

    return dateRoutineOther;
  }

  Future<void> endSubscription() async {
    if (currentUserDocument?.member == true) {
      if (currentUserDocument?.dateFinAbo != null) {
        if (currentUserDocument!.dateFinAbo! < DateTime.now()) {
          final usersUpdateData = createUsersRecordData(
            member: false,
          );
          await currentUserReference!.update(usersUpdateData);
        }
      }
    }
  }

  Widget calendar() {
    return TableCalendar(
      locale: "fr",
      firstDay: kFirstDay,
      lastDay: kLastDay,
      eventLoader: (day) {
        DateTime dayTolocal = DateTime(day.year, day.month, day.day);
        if (dateProg.contains(dayTolocal)) {
          (date, locale) => DateFormat.E(locale).format(date).toCapitalized();

          return [const Event('Cyclic event')];
        }
        if (dateProg.contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateProg.contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine.contains(dayTolocal)) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine.contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutine.contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther.contains(dayTolocal.add(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther.contains(dayTolocal.subtract(const Duration(hours: 1)))) {
          return [const Event('Cyclic event')];
        }
        if (dateRoutineOther.contains(dayTolocal)) {
          return [const Event('Cyclic event')];
        }

        return [];
      },
      focusedDay: DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day),
      weekendDays: const [DateTime.saturday, DateTime.sunday],
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: const TextStyle(
          fontSize: 17.0,
          fontFamily: 'IBM',
          color: MizzUpTheme.primaryColor,
          fontWeight: FontWeight.w700,
        ),
        formatButtonTextStyle: const TextStyle(fontSize: 17.0, fontFamily: 'IBM'),
        formatButtonDecoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        headerMargin: const EdgeInsets.all(0.0),
        headerPadding: const EdgeInsets.symmetric(vertical: 8.0),
        formatButtonPadding: const EdgeInsets.all(10.0),
        leftChevronPadding: const EdgeInsets.all(12.0),
        rightChevronPadding: const EdgeInsets.all(12.0),
        leftChevronMargin: const EdgeInsets.symmetric(horizontal: 8.0),
        rightChevronMargin: const EdgeInsets.symmetric(horizontal: 8.0),
        leftChevronIcon: const Icon(Icons.chevron_left),
        rightChevronIcon: const Icon(Icons.chevron_right),
        leftChevronVisible: true,
        rightChevronVisible: true,
        decoration: const BoxDecoration(),
        titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date).toCapitalized(),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date).toCapitalized(),
      ),
      calendarStyle: const CalendarStyle(
        markerSize: 4,
        markerMargin: EdgeInsets.symmetric(vertical: 5),
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        todayDecoration: BoxDecoration(
          color: MizzUpTheme.secondaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        selectedDecoration: BoxDecoration(
          color: MizzUpTheme.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = selectedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  Widget addRoutine() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 25, 10),
          child: Material(
            color: Colors.transparent,
            elevation: 5,
            shape: const CircleBorder(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: MizzUpIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
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
                        padding: MediaQuery.of(context).viewInsets,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 1,
                          child: const NouvelleRoutineWidget(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget progUser() {
    return FutureBuilder<List<ProgUserRecord?>>(
      future: queryProgUserRecordOnce(
        queryBuilder: (progUserRecord) => progUserRecord.where('dateAffichage1', arrayContainsAny: [
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day).toLocal(),
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day).toLocal().add(const Duration(hours: 1)),
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day).toLocal().subtract(const Duration(hours: 1))
        ]).where('userRef', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 0,
              height: 0,
              child: CircularProgressIndicator(
                color: MizzUpTheme.primaryColor,
              ),
            ),
          );
        }

        List<ProgUserRecord?> columnProgUserRecordList = snapshot.data!;

        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            child: const PasDeProgEnCoursWidget(),
          );
        }
        final columnProgUserRecord = columnProgUserRecordList.isNotEmpty ? columnProgUserRecordList.first : null;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: FutureBuilder<DetailsWeekProgRecord?>(
                future: DetailsWeekProgRecord.getDocumentOnce(columnProgUserRecord!.semaineShow!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 0,
                        height: 0,
                        child: CircularProgressIndicator(
                          color: MizzUpTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  // ignore: unused_local_variable
                  final containerDetailsWeekProgRecord = snapshot.data;

                  return Material(
                    color: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8E7DE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FutureBuilder<ProgrammesRecord?>(
                        future: ProgrammesRecord.getDocumentOnce(columnProgUserRecord.progRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 0,
                                height: 0,
                                child: CircularProgressIndicator(
                                  color: MizzUpTheme.primaryColor,
                                ),
                              ),
                            );
                          }
                          final columnProgrammesRecord = snapshot.data;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProgrammeSuiteWidget(
                                        detailsProg: columnProgrammesRecord,
                                        detailsWeek: containerDetailsWeekProgRecord!,
                                        detailsProgUser: columnProgUserRecord,
                                        date: _selectedDay,
                                      ),
                                    ),
                                    (r) => false,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                                          child: Container(
                                            width: 100,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFEEEEEE),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          columnProgrammesRecord!.imagePrincipale!,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/z0582h302sn8/Rectangle_29_(1).png',
                                                        ),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                columnProgrammesRecord.titre!,
                                                style: MizzUpTheme.title1.override(
                                                  fontFamily: 'IBM',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding: MediaQuery.of(context).viewInsets,
                                                  child: SizedBox(
                                                    height: MediaQuery.of(context).size.height * 0.5,
                                                    child: const SupprimerProgrammeWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget routineUser() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 200),
      child: FutureBuilder<List<RoutinesRecord?>>(
        future: queryRoutinesRecordOnce(
          queryBuilder: (routinesRecord) => routinesRecord.where('userRef', isEqualTo: currentUserReference).where('reccurenceTime', arrayContainsAny: [
            DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day).toLocal(),
            DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day).toLocal().add(
                  const Duration(hours: 1),
                ),
          ]),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  color: MizzUpTheme.primaryColor,
                ),
              ),
            );
          }
          List<RoutinesRecord?>? columnRoutinesRecordList = snapshot.data!;
          // Return an empty Container when the document does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final columnRoutinesRecord = columnRoutinesRecordList.isNotEmpty ? columnRoutinesRecordList.first! : null;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8E7DE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 20),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          valueOrDefault<String?>(
                                            columnRoutinesRecord!.photo1,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/r8nmesqrsycy/Rectangle_13_(1).png',
                                          )!,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 20, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if ((columnRoutinesRecord.soinNourissant) == true)
                                          Text(
                                            'Soin Nourissant',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.shampoingClarifiant) == true)
                                          Text(
                                            'Shampoing clarifiant',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.shampoingDoux) == true)
                                          Text(
                                            'Shampoing doux',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.coWash) == true)
                                          Text(
                                            'Co wash',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.noPoo) == true)
                                          Text(
                                            'No poo',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.apresShampoing) == true)
                                          Text(
                                            'Après shampoing',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.soinHydratant) == true)
                                          Text(
                                            'Soin Hydratant',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        if ((columnRoutinesRecord.soinNourissant) == true)
                                          Text(
                                            'Soin protéiné',
                                            style: MizzUpTheme.title1.override(
                                              fontFamily: 'IBM',
                                              color: Colors.black,
                                              fontSize: 14,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                columnRoutinesRecord.recurrence!,
                                style: MizzUpTheme.bodyText1.override(
                                  fontFamily: 'IBM',
                                  fontSize: 10,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.4,
                                    child: SupprimerRoutinesWidget(
                                      detailRoutine: columnRoutinesRecord,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
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
    );
  }

  // Définit une fonction asynchrone pour récupérer les favoris de chaque utilisateur
  Future<void> addLikesFromUsers(usersCollection, likesCollection) async {
    // Démarre un nouveau batch pour les opérations à réaliser
    final batch = FirebaseFirestore.instance.batch();

    // Récupère tous les documents de la collection "users"
    final usersSnapshots = await usersCollection.get();
    print(usersSnapshots.docs);

    // Pour chaque document d'utilisateur
    for (final userSnapshot in usersSnapshots.docs) {
      // Récupère le champ "favorisRecettes" sous forme de liste
      final favorisRecettes = List<DocumentReference>.from(userSnapshot.data()['favorisRecettes']);

      // Crée un nouveau document dans la collection "likes"
      final likeDocument = likesCollection.doc();

      // Convertit la liste de DocumentReference en une liste de Map pour le batch
      final recettesData = favorisRecettes.map((ref) => {'ref': ref}).toList();

      // Ajoute les champs "recette_id" et "user_id" au nouveau document
      batch.set(
        likeDocument,
        {
          'recette_id': FieldValue.arrayUnion(recettesData),
          'user_id': userSnapshot.reference,
        },
      );
    }

    // Exécute le batch pour ajouter les documents de "likes"
    await batch.commit();
  }
}
