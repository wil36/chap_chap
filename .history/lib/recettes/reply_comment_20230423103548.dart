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

class ReplyComment extends StatefulWidget {
  QueryDocumentSnapshot<Map<String, dynamic>> comment;
  DocumentSnapshot<Map<String, dynamic>> user;
  ReplyComment({
    required this.comment,
    required this.user,
    Key? key,
  }) : super(key: key);
  @override
  _ReplyCommentState createState() => _ReplyCommentState();
}

class _ReplyCommentState extends State<ReplyComment> {
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
                  'Répondre au commentaire',
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
          ),
          Padding(
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
                                  widget.user!['photo_url'],
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
                                    widget.user['display_name'],
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
                            widget.comment['date'].toDate().toString().substring(0, 10),
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
                            widget.comment['comment'].toString(),
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
                    ],
                  );
                },
              ),
            ),
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
              await replyComment();
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



  Future<void> replyComment() async {
    await FirebaseFirestore.instance.collection('comments_reply').add({
      'comment': commentController.text,
      'date': DateTime.now(),
      'user': widget.user.reference,
      'comment_id': widget.comment.reference,

    });
}
