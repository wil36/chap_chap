import 'package:chap_chap/MizzUp_Code/MizzUp_icon_button.dart';
import 'package:chap_chap/main.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../backend/backend.dart';
import '../components/manage_offer.dart';
import 'package:flutter/material.dart';

class GetOfferWidget extends StatefulWidget {
  const GetOfferWidget({Key? key}) : super(key: key);

  @override
  _GetOfferWidgetState createState() => _GetOfferWidgetState();
}

class _GetOfferWidgetState extends State<GetOfferWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? searchKey;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

   @override
  void dispose() {
    super.dispose();
    textController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord?>>(
      stream: queryUsersRecord(),
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
        List<UsersRecord?> getOfferUsersRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: MizzUpTheme.primaryColor,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: MizzUpTheme.tertiaryColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                            buttonSize: 60,
                            fillColor: MizzUpTheme.primaryColor,
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NavBarPage(index: 2),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                           onChanged: (value) {
                                  setState(() {
                                    searchKey = value;
                                  });
                                },
                          controller: textController,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Rechercher par email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          ),
                          style: MizzUpTheme.bodyText1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Container(
                        width: 350,
                        decoration: const BoxDecoration(),
                        child: Text(
                          '${getOfferUsersRecordList.length.toString()} utilisateurs inscrits',
                          style: MizzUpTheme.bodyText1.override(
                            fontFamily: 'IBM',
                            fontWeight: FontWeight.w900,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                    if (searchKey != null)
                      Container(
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
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Builder(
                            builder: (context) {
                              final listUsers = getOfferUsersRecordList.toList();
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(listUsers.length,
                                      (listUsersIndex) {
                                    final listUsersItem =
                                        listUsers[listUsersIndex];
                                    if (listUsersItem!.email!
                                        .toUpperCase()
                                        .contains(searchKey!.toUpperCase())) {
                                      return Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0, 10, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 350,
                                              decoration: const BoxDecoration(),
                                              child: InkWell(
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding:
                                                            MediaQuery.of(context)
                                                                .viewInsets,
                                                        child: SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.4,
                                                          child:
                                                              ManageOfferWidget(
                                                            thisUser:
                                                                listUsersItem,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  listUsersItem.email!,
                                                  style: MizzUpTheme.bodyText1
                                                      .override(
                                                    fontFamily: 'IBM',
                                                    fontSize: 18,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    if (searchKey == null)
                      Container(
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
                        child: const Align(
                            alignment: AlignmentDirectional(0, -0.5),
                            child: Text('Rechercher un(e) client(e)')),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
