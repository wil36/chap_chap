import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

// ignore_for_file: avoid_print, deprecated_member_use

import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:flutter_svg/svg.dart';
import '../MizzUp_Code/MizzUp_choice_chips.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_text/styled_text.dart';

import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';

class DisplayAllComments extends StatefulWidget {
  QuerySnapshot<Map<String, dynamic>> recipesComment;
  DisplayAllComments({
    required this.recipesComment,
    Key? key,
  }) : super(key: key);
  @override
  _DisplayAllCommentsState createState() => _DisplayAllCommentsState();
}

class _DisplayAllCommentsState extends State<DisplayAllComments> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
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
                  'Commentaires',
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
          SizedBox(
            height: 20,
          ),return FutureBuilder(
                  future: getUserById(recipeComments[0]['user_id']),
                  builder: (context, snapshot) {
                    var user = snapshot.data;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 40),
                                child: Text('Commentaires (${recipeComments.length})',
                                    style: MizzUpTheme.bodyText1.override(fontFamily: 'IBM', color: Colors.black, useGoogleFonts: false, fontWeight: FontWeight.w800, fontSize: 15))),
                            GestureDetector(
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * 0.9,
                                        child: DisplayAllComments(recipesComment: recipes.data!),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(right: 40),
                                  child: Text(
                                    'Voir tout',
                                    style: TextStyle(color: Colors.black, fontFamily: 'IBM', fontSize: 12, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        for (int i = 0; i < 5 && i < recipeComments.length; i++)
                          FutureBuilder(
                            future: getUserById(recipeComments[i]['user_id']),
                            builder: (context, snapshot) {
                              var comment = recipeComments[i];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constraints) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50), // Adjust the radius to your liking
                                                    child: Image.network(
                                                      user!['photo_url'],
                                                      width: 30,
                                                      height: 30,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        user['display_name'],
                                                        style: MizzUpTheme.bodyText1.override(
                                                          color: Colors.black,
                                                          fontFamily: 'IBM',
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                recipeComments[i]['date'].toDate().toString().substring(0, 10),
                                                style: MizzUpTheme.bodyText1.override(
                                                  color: Colors.black,
                                                  fontFamily: 'IBM',
                                                  fontSize: 12,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Center(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                comment['comment'].toString(),
                                                style: MizzUpTheme.bodyText1.override(
                                                  color: Colors.black,
                                                  fontFamily: 'IBM',
                                                  fontSize: 12,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //repondre button
                                              TextButton(
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(context).viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(context).size.height * 0.9,
                                                          child: ReplyComment(comment: comment, user: user),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) => setState(() {}));
                                                },
                                                child: Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.3),
                                                          spreadRadius: 0,
                                                          blurRadius: 5,
                                                          offset: const Offset(0, 4), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: const Text('Répondre', style: TextStyle(color: MizzUpTheme.primaryColor, fontSize: 12, fontWeight: FontWeight.w300))),
                                              ),
                                              //like button
                                              Row(
                                                children: [
                                                  Text(
                                                    comment['likes'].length.toString(),
                                                    style: MizzUpTheme.bodyText1.override(
                                                      color: Colors.black,
                                                      fontFamily: 'IBM',
                                                      fontSize: 14,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                  ToggleIcon(
                                                    onPressed: () async {
                                                      print(comment.id);
                                                      comment['likes'].contains(user['uid']) ? await unlikeComment(comment.id) : await likeComment(comment.id);
                                                      setState(() {});
                                                    },
                                                    value: comment['likes'].contains(user['uid']),
                                                    onIcon: Icon(Icons.favorite, color: MizzUpTheme.primaryColor),
                                                    offIcon: Icon(Icons.favorite_border, color: MizzUpTheme.primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    );
                  },
                ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextFormField(
                controller: commentController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Commentaire',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () async {
              // await leaveComment();
              Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MizzUpTheme.secondaryColor,
                ),
                child: const Text('Valider mon commentaire', style: TextStyle(color: Colors.black, fontSize: 16))),
          ),
        ],
      ),
    );
  }
}
