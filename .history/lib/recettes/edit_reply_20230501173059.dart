import 'package:flutter/material.dart';

// ignore_for_file: avoid_print, deprecated_member_use

import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';

class EditReply extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> comment;
  EditReply({
    required this.comment,
    Key? key,
  }) : super(key: key);
  @override
  _EditReplyState createState() => _EditReplyState();
}

class _EditReplyState extends State<EditReply> {
  TextEditingController commentController = TextEditingController();
  String newComment = '';
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
                  'Modifier mon commentaire',
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
                initialValue: widget.comment.data()['comment'],
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
              await editComment();
              // Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MizzUpTheme.secondaryColor,
                ),
                child: const Text('Modifier mon commentaire', style: TextStyle(color: Colors.black, fontSize: 16))),
          ),
        ],
      ),
    );
  }

  Future<void> editComment() async {
    print(commentController.text);
    // await FirebaseFirestore.instance.collection('comments').add({
    //   'comment': commentController.text,
    //   'user_id': currentUserUid,
    //   'date': DateTime.now(),
    //   'likes': [],
    //   'show_replies': false,
    // });
  }
}
