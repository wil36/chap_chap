// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// ignore_for_file: avoid_print, deprecated_member_use
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../backend/backend.dart';

class EditReply extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> comment;
  bool isAnAnswer;
  EditReply({
    required this.comment,
    required this.isAnAnswer,
    Key? key,
  }) : super(key: key);
  @override
  _EditReplyState createState() => _EditReplyState();
}

class _EditReplyState extends State<EditReply> {
  late TextEditingController commentController = TextEditingController(text: widget.isAnAnswer ? widget.comment["comment_reply"] : widget.comment["comment"] );

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
              widget.isAnAnswer ? await editCommentAnswer() :  await editComment();
              Navigator.pop(context);
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
    await FirebaseFirestore.instance.collection('comments').doc(widget.comment.id).update({
      'comment': commentController.text,
      'date': DateTime.now(),
    });
  }

  Future<void> editCommentAnswer() async {
    await FirebaseFirestore.instance.collection('comments_reply').doc(widget.comment.id).update({
      'comment_reply': commentController.text,
      'date': DateTime.now(),
    });
  }
}
