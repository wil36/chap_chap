// ignore_for_file: must_be_immutable

import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/forum/Models/forum_comments_model.dart';
import 'package:chap_chap/forum/Models/forum_comments_reply_model.dart';
import 'package:chap_chap/notification/notifcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore_for_file: avoid_print, deprecated_member_use
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../backend/backend.dart';

class AddCommentReplyForum extends StatefulWidget {
  final ForumCommentModel? forumComment;
  final ForumCommentReplyModel? forumCommentReply;
  bool isAnAnswer;
  AddCommentReplyForum({
    this.forumComment,
    this.forumCommentReply,
    required this.isAnAnswer,
    Key? key,
  }) : super(key: key);
  @override
  _AddCommentReplyForumState createState() => _AddCommentReplyForumState();
}

class _AddCommentReplyForumState extends State<AddCommentReplyForum> {
  late TextEditingController commentController = TextEditingController(
      text: widget.isAnAnswer ? widget.forumCommentReply!.comment : "");
  bool isSender = false;

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
                  widget.isAnAnswer
                      ? 'Modifier mon commentaire'
                      : 'Ajouter mon commentaire',
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
                maxLines: 20,
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
              widget.isAnAnswer ? await editComment() : await addComment();
              Navigator.pop(context);
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MizzUpTheme.secondaryColor,
                ),
                child: isSender
                    ? CircularProgressIndicator()
                    : Text(
                        widget.isAnAnswer
                            ? 'Modifier mon commentaire'
                            : 'Ajouter mon commentaire',
                        style: TextStyle(color: Colors.black, fontSize: 16))),
          ),
        ],
      ),
    );
  }

  Future<void> editComment() async {
    if (isSender == false) {
      setState(() {
        isSender = true;
      });
      await FirebaseFirestore.instance
          .collection('forum_comments_reply')
          .doc(widget.forumCommentReply!.id)
          .update({
        'comment': commentController.text,
        'createdDate': DateTime.now(),
      });
    }
  }

  Future<void> incrementCommentCount(
      String commentId, int incrementAmount) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('forum_comments')
        .doc(commentId)
        .get();

    if (snapshot.exists) {
      ForumCommentModel comment =
          ForumCommentModel.fromJson(snapshot.data() as Map<String, dynamic>);

      int currentCommentCount = comment.commentCount;
      int newCommentCount = currentCommentCount + incrementAmount;

      await snapshot.reference.update({'commentCount': newCommentCount});
    } else {
      print('Commentaire introuvable');
    }
  }

  Future<void> addComment() async {
    if (isSender == false) {
      setState(() {
        isSender = true;
      });
      ForumCommentReplyModel forumCommentModel = new ForumCommentReplyModel(
        id: "", // L'ID sera mis à jour après l'enregistrement
        comment: commentController.text,
        createdDate: DateTime.now(),
        userId: FirebaseAuth.instance.currentUser!.uid,
        userName: currentUserDisplayName,
        commentCount: 0,
        forumCommentId: widget.forumComment!.id,
        likeCount: 0,
        likedBy: [],
        userFirstName: currentUserDisplayName,
        userProfilePhoto: currentUserPhoto,
      );

      DocumentReference docRef = await FirebaseFirestore.instance
          .collection('forum_comments_reply')
          .add(forumCommentModel.toJson());

      String commentId = docRef.id; // Obtient l'ID du document créé
      forumCommentModel.id = commentId; // Met à jour l'ID dans le modèle

      await docRef
          .update({'id': commentId}); // Met à jour l'ID dans le document

      await incrementCommentCount(forumCommentModel.forumCommentId, 1);

      if (widget.forumComment!.userId !=
          FirebaseAuth.instance.currentUser!.uid) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.forumComment!.userId)
            .get()
            .then((value1) async {
          if (value1.exists &&
              valueOrDefault(
                  value1.data()!['recevoirNotifForum'] ?? false, false)) {
            FirebaseFirestore.instance
                .collection('forum')
                .doc(widget.forumComment!.forumId)
                .get()
                .then((value) async {
              if (value.data() != null) {
                await NotifController().addDocToNotificationSpecificUser(
                    'Nouvelle réponse',
                    "Tu as une nouvelle réponse pour ton commentaire dans le forum " +
                        valueOrDefault(value.data()!['titre'], ""),
                    'Forum',
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.forumComment!.userId),
                    FirebaseFirestore.instance
                        .collection('forum')
                        .doc(widget.forumComment!.forumId));
              }
            });
          }
        });
      }
    }
  }
}
