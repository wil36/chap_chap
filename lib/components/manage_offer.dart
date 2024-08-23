// ignore_for_file: unnecessary_null_comparison

import 'package:chap_chap/MizzUp_Code/MizzUp_icon_button.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_widgets.dart';
import 'package:chap_chap/auth/auth_util.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../backend/backend.dart';
import 'package:flutter/material.dart';

class ManageOfferWidget extends StatefulWidget {
  const ManageOfferWidget({
    Key? key,
    this.thisUser,
  }) : super(key: key);

  final UsersRecord? thisUser;

  @override
  _ManageOfferWidgetState createState() => _ManageOfferWidgetState();
}

class _ManageOfferWidgetState extends State<ManageOfferWidget> {
  DateTime datePicked = DateTime.now();
  Future<void> selectTimePicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: datePicked,
      locale: const Locale("fr", "FR"),
      firstDate: DateTime(1940),
      lastDate: DateTime(2030),
    );
    if (picker != null && picker != datePicked) {
      setState(() {
        datePicked = DateTime(
          picker.year,
          picker.month,
          picker.day,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord?>(
      stream: UsersRecord.getDocument(widget.thisUser!.reference!),
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
        final containerUsersRecord = snapshot.data;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Ajouter une date de fin',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: MizzUpTheme.primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                    MizzUpIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () async {
                        await selectTimePicker(context);
                        final usersUpdateData1 = createUsersRecordData(
                          dateFinAbo: datePicked,
                        );
                        await containerUsersRecord!.reference!
                            .update(usersUpdateData1);
                      },
                    ),
                    if (currentUserDocument?.dateFinAbo != null) ...{
                      if (datePicked != null) ...{
                        Text('Se termine le ', style: MizzUpTheme.bodyText1),
                        Text(
                          dateTimeFormat('MMMMEEEEd', datePicked),
                          style: MizzUpTheme.bodyText1,
                        ),
                      } else ...{
                        Text('Se termine le ', style: MizzUpTheme.bodyText1),
                        Text(
                          dateTimeFormat(
                              'MMMMEEEEd', currentUserDocument?.dateFinAbo),
                          style: MizzUpTheme.bodyText1,
                        ),
                      },
                    } else ...{
                      if (datePicked != null) ...{
                        Text('Se termine le ', style: MizzUpTheme.bodyText1),
                        Text(
                          dateTimeFormat('MMMMEEEEd', datePicked),
                          style: MizzUpTheme.bodyText1,
                        ),
                      } else ...{
                        Text(
                            "Si aucune date n'est entrée, l'abonnement sera illimité",
                            style: MizzUpTheme.bodyText1),
                      }
                    }
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Débloquer l\'abonnement',
                        style: MizzUpTheme.bodyText1.override(
                          fontFamily: 'IBM',
                          color: MizzUpTheme.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                      ),
                      ToggleIcon(
                        onPressed: () async {
                          final usersUpdateData = createUsersRecordData(
                            member: !containerUsersRecord.member!,
                          );
                          await containerUsersRecord.reference!
                              .update(usersUpdateData);
                        },
                        value: containerUsersRecord!.member,
                        onIcon: const Icon(
                          Icons.check_box,
                          color: Colors.black,
                          size: 25,
                        ),
                        offIcon: const Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Mettre à jour',
                        options: MizzUpOptionButton(
                          width: 230,
                          height: 40,
                          color: MizzUpTheme.primaryColor,
                          textStyle: MizzUpTheme.subtitle2.override(
                            fontFamily: 'IBM',
                            color: Colors.white,
                            useGoogleFonts: false,
                          ),
                          elevation: 10,
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
          ),
        );
      },
    );
  }
}
