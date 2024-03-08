import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/backend/backend.dart';
import 'package:chap_chap/forum/Models/forum_comments_model.dart';
import 'package:chap_chap/forum/Models/forum_comments_reply_model.dart';
import 'package:chap_chap/forum/add_comment_reply_forum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReplyCommentForum extends StatefulWidget {
  const ReplyCommentForum({Key? key, required this.forumCommentModel})
      : super();
  final ForumCommentModel forumCommentModel;

  @override
  State<ReplyCommentForum> createState() => _ReplyCommentForumState();
}

class _ReplyCommentForumState extends State<ReplyCommentForum> {
  List<ForumCommentModel> items = [];
  ScrollController scrollController = new ScrollController();
  bool isLoading = true;
  ForumCommentModel? forumComment;

  Future<List<ForumCommentReplyModel>> getForumCommentData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('forum_comments_reply')
        .where('forumCommentId', isEqualTo: widget.forumCommentModel.id)
        .orderBy('createdDate', descending: true)
        .get();
    List<ForumCommentReplyModel> forumCommentReplyList =
        querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      ForumCommentReplyModel forum = ForumCommentReplyModel.fromJson(data);
      forum.id = doc.id;
      return forum;
    }).toList();
    print('hello' + widget.forumCommentModel.id);
    print(forumCommentReplyList.length);
    return forumCommentReplyList;
  }

  Stream<List<ForumCommentReplyModel>> forumCommentReplyStream = Stream.empty();

  @override
  void initState() {
    super.initState();

    forumComment = widget.forumCommentModel;
    setState(() {
      forumCommentReplyStream = FirebaseFirestore.instance
          .collection('forum_comments_reply')
          .where('forumCommentId', isEqualTo: widget.forumCommentModel.id)
          .orderBy('createdDate', descending: true)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((doc) => ForumCommentReplyModel.fromJson(doc.data()))
              .toList());

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MizzUpTheme.tertiaryColor,
      floatingActionButton: FloatingActionButton(
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
                  child: AddCommentReplyForum(
                      forumComment: widget.forumCommentModel,
                      forumCommentReply: null,
                      isAnAnswer: false),
                ),
              );
            },
          ).then((value) async {
            forumComment =
                await getSingleForumComment(widget.forumCommentModel.id);
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                ),
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
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: MizzUpTheme.primaryColor,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      buildItems(forumComment!),
                      SizedBox(
                        height: 20,
                      ),
                      if (isLoading)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: MizzUpTheme.primaryColor,
                            ),
                          ),
                        )
                      else
                        StreamBuilder<List<ForumCommentReplyModel>>(
                          stream:
                              forumCommentReplyStream, // Remplacez yourStream par votre flux de commentaires de forum
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator(); // Affichez un indicateur de chargement pendant le chargement initial
                            } else {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                if (snapshot.data!.isEmpty) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 30,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Aucune réponse',
                                        style: MizzUpTheme.subtitle2,
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  // physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              25,
                                        ),
                                        child: buildItemsReply(
                                            snapshot.data![index]));
                                  },
                                );
                              }
                            }
                          },
                        ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08 + 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItems(ForumCommentModel forumCommentModel) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: MizzUpTheme.tertiaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.network(forumCommentModel
                                .userProfilePhoto.isEmpty
                            ? "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg"
                            : forumCommentModel.userProfilePhoto),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        forumCommentModel.userName,
                        style: TextStyle(
                          fontFamily: 'IBM',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(forumCommentModel.comment, style: MizzUpTheme.bodyText3),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await incrementLikeCount(forumCommentModel.id, 1,
                          FirebaseAuth.instance.currentUser!.uid);
                      forumComment =
                          await getSingleForumComment(forumComment!.id);
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await incrementLikeCount(forumCommentModel.id, 1,
                                FirebaseAuth.instance.currentUser!.uid);
                            forumComment =
                                await getSingleForumComment(forumComment!.id);
                            setState(() {});
                          },
                          icon: Icon(
                            forumCommentModel.likedBy.contains(
                                    FirebaseAuth.instance.currentUser!.uid)
                                ? Icons.thumb_up_alt
                                : Icons.thumb_up_alt_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                            forumCommentModel.likeCount.toString() + " Vote(s)",
                            style: MizzUpTheme.bodyText3),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {},
                          icon: Icon(
                            Icons.comment_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                            forumCommentModel.commentCount.toString() +
                                " Replies",
                            style: MizzUpTheme.bodyText3),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemsReply(ForumCommentReplyModel forumCommentReplyModel) {
    return Card(
      elevation: 2,
      shadowColor: MizzUpTheme.tertiaryColor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.network(
                          (valueOrDefault<String>(
                              forumCommentReplyModel.userProfilePhoto,
                              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg")),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        forumCommentReplyModel.userName,
                        style: TextStyle(
                          fontFamily: 'IBM',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: forumCommentReplyModel.userId ==
                        FirebaseAuth.instance.currentUser!.uid,
                    child: PopupMenuButton<String>(
                      onSelected: (value) async {
                        if (value == 'edit') {
                          // Logique pour modifier le commentaire
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  child: AddCommentReplyForum(
                                      forumComment: widget.forumCommentModel,
                                      forumCommentReply: forumCommentReplyModel,
                                      isAnAnswer: true),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        } else if (value == 'delete') {
                          // Logique pour supprimer le commentaire
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirmer la suppression'),
                                content: Text(
                                    'Voulez-vous vraiment supprimer ce commentaire ?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Annuler'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Fermer la boîte de dialogue
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Supprimer'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Fermer la boîte de dialogue
                                      deleteCommentReply(forumCommentReplyModel
                                          .id); // Appeler la fonction de suppression
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Modifier le commentaire'),
                        ),
                        PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('Supprimer le commentaire'),
                        ),
                      ],
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(forumCommentReplyModel.comment,
                  style: MizzUpTheme.bodyText2),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      incrementLikeCountReply(forumCommentReplyModel.id, 1,
                          FirebaseAuth.instance.currentUser!.uid);
                    },
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            incrementLikeCountReply(forumCommentReplyModel.id,
                                1, FirebaseAuth.instance.currentUser!.uid);
                          },
                          icon: Icon(
                            forumCommentReplyModel.likedBy.contains(
                                    FirebaseAuth.instance.currentUser!.uid)
                                ? Icons.thumb_up_alt
                                : Icons.thumb_up_alt_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                            forumCommentReplyModel.likeCount.toString() +
                                " Vote(s)",
                            style: MizzUpTheme.bodyText2),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteCommentReply(String commentId) async {
    // Supprimer le commentaire
    await FirebaseFirestore.instance
        .collection('forum_comments_reply')
        .doc(commentId)
        .delete();
    decrementCommentCount(widget.forumCommentModel.id, 1);
  }

  Future<void> incrementLikeCountReply(
      String commentId, int incrementAmount, String likerId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('forum_comments_reply')
        .doc(commentId)
        .get();

    if (snapshot.exists) {
      ForumCommentReplyModel comment = ForumCommentReplyModel.fromJson(
          snapshot.data() as Map<String, dynamic>);
      if (!comment.likedBy.contains(likerId)) {
        int currentLikeCount = comment.likeCount;
        int newLikeCount = currentLikeCount + incrementAmount;

        List<String> likedBy = List<String>.from(comment.likedBy);
        likedBy.add(likerId);

        await snapshot.reference
            .update({'likeCount': newLikeCount, 'likedBy': likedBy});
      } else {
        int currentLikeCount = comment.likeCount;
        int newLikeCount = currentLikeCount - incrementAmount;

        List<String> likedBy = List<String>.from(comment.likedBy);
        likedBy.remove(likerId);

        await snapshot.reference
            .update({'likeCount': newLikeCount, 'likedBy': likedBy});
      }
    } else {
      print('Commentaire introuvable');
    }
  }

  Future<void> deleteComment(String commentId) async {
    // Supprimer les réponses associées au commentaire
    QuerySnapshot replySnapshot = await FirebaseFirestore.instance
        .collection('forum_comments_reply')
        .where('forumCommentId', isEqualTo: commentId)
        .get();
    List<QueryDocumentSnapshot> replies = replySnapshot.docs;
    for (var reply in replies) {
      await reply.reference.delete();
    }

    // Supprimer le commentaire
    await FirebaseFirestore.instance
        .collection('forum_comments')
        .doc(commentId)
        .delete();
  }

  Future<void> decrementCommentCount(
      String commentId, int incrementAmount) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('forum_comments')
        .doc(commentId)
        .get();

    if (snapshot.exists) {
      ForumCommentModel comment =
          ForumCommentModel.fromJson(snapshot.data() as Map<String, dynamic>);

      int currentCommentCount = comment.commentCount;
      int newCommentCount = currentCommentCount - incrementAmount;

      await snapshot.reference.update({'commentCount': newCommentCount});
    } else {
      print('Commentaire introuvable');
    }
  }

  Future<ForumCommentModel> getSingleForumComment(String commentId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('forum_comments')
        .doc(commentId)
        .get();

    if (documentSnapshot.exists) {
      var data = documentSnapshot.data();
      return ForumCommentModel.fromJson(data as Map<String, dynamic>);
    } else {
      throw Exception('Commentaire introuvable.');
    }
  }

  Future<void> incrementLikeCount(
      String commentId, int incrementAmount, String likerId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('forum_comments')
        .doc(commentId)
        .get();

    if (snapshot.exists) {
      ForumCommentModel comment =
          ForumCommentModel.fromJson(snapshot.data() as Map<String, dynamic>);
      if (!comment.likedBy.contains(likerId)) {
        int currentLikeCount = comment.likeCount;
        int newLikeCount = currentLikeCount + incrementAmount;

        List<String> likedBy = List<String>.from(comment.likedBy);
        likedBy.add(likerId);

        await snapshot.reference
            .update({'likeCount': newLikeCount, 'likedBy': likedBy});
      } else {
        int currentLikeCount = comment.likeCount;
        int newLikeCount = currentLikeCount - incrementAmount;

        List<String> likedBy = List<String>.from(comment.likedBy);
        likedBy.remove(likerId);

        await snapshot.reference
            .update({'likeCount': newLikeCount, 'likedBy': likedBy});
      }
    } else {
      print('Commentaire introuvable');
    }
  }
}
