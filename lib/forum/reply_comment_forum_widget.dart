import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/backend/backend.dart';
import 'package:chap_chap/forum/Models/forum_comments_model.dart';
import 'package:chap_chap/forum/Models/forum_comments_reply_model.dart';
import 'package:chap_chap/forum/add_comment_reply_forum.dart';
import 'package:chap_chap/notification/notifcontroller.dart';
import 'package:chap_chap/profil/other_profile_page.dart';
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
        .orderBy('createdDate', descending: false)
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
          .orderBy('createdDate', descending: false)
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
                              return Center(
                                  child:
                                      CircularProgressIndicator()); // Affichez un indicateur de chargement pendant le chargement initial
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
        child: StreamBuilder<UsersRecord?>(
            stream: UsersRecord.getDocument(currentUserReference!),
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
              // var user = snapshot.data;
              String userPhoto = forumCommentModel.userProfilePhoto.isNotEmpty
                  ? forumCommentModel.userProfilePhoto
                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg';

              return SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtherProfilePage(
                                    userId: forumCommentModel.userId),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(valueOrDefault<
                                        String?>(userPhoto,
                                    "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg")!),
                                backgroundColor: Colors.transparent,
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
                        ),
                        Text(
                          timeAgo(forumCommentModel.createdDate),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(forumCommentModel.comment,
                        style: MizzUpTheme.bodyText3),
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
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await incrementLikeCount(
                                        forumCommentModel.id,
                                        1,
                                        FirebaseAuth.instance.currentUser!.uid);
                                    forumComment = await getSingleForumComment(
                                        forumComment!.id);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    forumCommentModel.likedBy.contains(
                                            FirebaseAuth
                                                .instance.currentUser!.uid)
                                        ? Icons.thumb_up_alt
                                        : Icons.thumb_up_alt_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await incrementLikeCount(
                                        forumCommentModel.id,
                                        1,
                                        FirebaseAuth.instance.currentUser!.uid);
                                    forumComment = await getSingleForumComment(
                                        forumComment!.id);
                                    setState(() {});
                                  },
                                  child: Text(
                                      forumCommentModel.likeCount.toString() +
                                          " Like(s)",
                                      style: MizzUpTheme.bodyText3),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {},
                                  icon: Icon(
                                    Icons.comment,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                    forumCommentModel.commentCount.toString() +
                                        " Réponse(s)",
                                    style: MizzUpTheme.bodyText3),
                              ],
                            ),
                            IconButton(
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.9,
                                        child: AddCommentReplyForum(
                                            forumComment:
                                                widget.forumCommentModel,
                                            forumCommentReply: null,
                                            isAnAnswer: false),
                                      ),
                                    );
                                  },
                                ).then((value) async {
                                  forumComment = await getSingleForumComment(
                                      widget.forumCommentModel.id);
                                  if (mounted) {
                                    setState(() {});
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
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
        child: StreamBuilder<UsersRecord?>(
            stream: UsersRecord.getDocument(currentUserReference!),
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
              // var user = snapshot.data;
              String userPhoto = forumCommentReplyModel
                      .userProfilePhoto.isNotEmpty
                  ? forumCommentReplyModel.userProfilePhoto
                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg';
              return SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtherProfilePage(
                                    userId: forumCommentReplyModel.userId),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(valueOrDefault<
                                        String?>(userPhoto,
                                    "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg")!),
                                backgroundColor: Colors.transparent,
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
                        ),
                        Row(
                          children: [
                            Text(
                              timeAgo(forumCommentReplyModel.createdDate),
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
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
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.9,
                                            child: AddCommentReplyForum(
                                                forumComment:
                                                    widget.forumCommentModel,
                                                forumCommentReply:
                                                    forumCommentReplyModel,
                                                isAnAnswer: true),
                                          ),
                                        );
                                      },
                                    ).then((value) {
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    });
                                  } else if (value == 'delete') {
                                    // Logique pour supprimer le commentaire
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Theme(
                                          data: ThemeData(
                                            useMaterial3: false,
                                          ),
                                          child: AlertDialog(
                                            title: Text(
                                                'Confirmer la suppression'),
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
                                                  deleteCommentReply(
                                                      forumCommentReplyModel
                                                          .id); // Appeler la fonction de suppression
                                                },
                                              ),
                                            ],
                                          ),
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
                            ),
                          ],
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
                            incrementLikeCountReply(forumCommentReplyModel.id,
                                1, FirebaseAuth.instance.currentUser!.uid);
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  incrementLikeCountReply(
                                      forumCommentReplyModel.id,
                                      1,
                                      FirebaseAuth.instance.currentUser!.uid);
                                },
                                icon: Icon(
                                  forumCommentReplyModel.likedBy.contains(
                                          FirebaseAuth
                                              .instance.currentUser!.uid)
                                      ? Icons.thumb_up_alt
                                      : Icons.thumb_up_alt_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  incrementLikeCountReply(
                                      forumCommentReplyModel.id,
                                      1,
                                      FirebaseAuth.instance.currentUser!.uid);
                                },
                                child: Text(
                                    forumCommentReplyModel.likeCount
                                            .toString() +
                                        " Like(s)",
                                    style: MizzUpTheme.bodyText2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
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

  String timeAgo(DateTime dateTime) {
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return "il y a ${difference.inSeconds} secondes";
    } else if (difference.inMinutes < 60) {
      return difference.inMinutes == 1
          ? "il y a une minute"
          : "il y a ${difference.inMinutes} minutes";
    } else if (difference.inHours < 24) {
      return difference.inHours == 1
          ? "il y a une heure"
          : "il y a ${difference.inHours} heures";
    } else if (difference.inDays < 30) {
      return difference.inDays == 1
          ? "il y a un jour"
          : "il y a ${difference.inDays} jours";
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return months == 1 ? "il y a un mois" : "il y a $months mois";
    } else {
      int years = (difference.inDays / 365).floor();
      return years == 1 ? "il y a un an" : "il y a $years ans";
    }
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
        if (widget.forumCommentModel.userId !=
            FirebaseAuth.instance.currentUser!.uid) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(widget.forumCommentModel.userId)
              .get()
              .then((value1) async {
            if (value1.exists &&
                valueOrDefault(
                    value1.data()!['recevoirNotifForum'] ?? false, false)) {
              FirebaseFirestore.instance
                  .collection('forum')
                  .doc(widget.forumCommentModel.forumId)
                  .get()
                  .then((value) async {
                if (value.data() != null) {
                  await NotifController().addDocToNotificationSpecificUser(
                      'Nouvelle réponse',
                      "Tu as un nouveau like pour ta réponse au commentaire de " +
                          widget.forumCommentModel.userFirstName +
                          " dans le forum " +
                          valueOrDefault(value.data()!['titre'], ""),
                      'Forum',
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(comment.userId),
                      FirebaseFirestore.instance
                          .collection('forum')
                          .doc(widget.forumCommentModel.forumId));
                }
              });
            }
          });
        }
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

        if (widget.forumCommentModel.userId !=
            FirebaseAuth.instance.currentUser!.uid) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(widget.forumCommentModel.userId)
              .get()
              .then((value1) async {
            if (value1.exists &&
                valueOrDefault(
                    value1.data()!['recevoirNotifForum'] ?? false, false)) {
              FirebaseFirestore.instance
                  .collection('forum')
                  .doc(widget.forumCommentModel.forumId)
                  .get()
                  .then((value) async {
                if (value.data() != null) {
                  await NotifController().addDocToNotificationSpecificUser(
                      'Nouvelle réponse',
                      "Tu as un nouveau like pour ton commentaire dans le forum " +
                          valueOrDefault(value.data()!['titre'], ""),
                      'Forum',
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.forumCommentModel.userId),
                      FirebaseFirestore.instance
                          .collection('forum')
                          .doc(widget.forumCommentModel.forumId));
                }
              });
            }
          });
        }
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

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserById(String userId) {
    return FirebaseFirestore.instance.collection('users').doc(userId).get();
  }
}
