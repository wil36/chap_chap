import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/backend/backend.dart';
import 'package:chap_chap/forum/Models/forum_comments_model.dart';
import 'package:chap_chap/forum/Models/forum_model.dart';
import 'package:chap_chap/forum/add_comment_forum.dart';
import 'package:chap_chap/forum/reply_comment_forum_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailForumWidget extends StatefulWidget {
  const DetailForumWidget({Key? key, required this.forumModel}) : super();
  final ForumModel forumModel;

  @override
  State<DetailForumWidget> createState() => _DetailForumWidgetState();
}

class _DetailForumWidgetState extends State<DetailForumWidget> {
  List<ForumCommentModel> items = [];
  ScrollController scrollController = new ScrollController();
  bool isLoading = true;

  Future<List<ForumCommentModel>> getForumCommentData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('forum_comments')
        .where('forumId', isEqualTo: widget.forumModel.id)
        .orderBy('createdDate', descending: true)
        .get();
    List<ForumCommentModel> forumCommentList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      ForumCommentModel forum = ForumCommentModel.fromJson(data);
      forum.id = doc.id;
      return forum;
    }).toList();
    print('hello' + widget.forumModel.id);
    print(forumCommentList.length);
    return forumCommentList;
  }

  Stream<List<ForumCommentModel>> forumCommentStream = Stream.empty();

  @override
  void initState() {
    super.initState();

    setState(() {
      forumCommentStream = FirebaseFirestore.instance
          .collection('forum_comments')
          .where('forumId', isEqualTo: widget.forumModel.id)
          .orderBy('createdDate', descending: true)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((doc) => ForumCommentModel.fromJson(doc.data()))
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
                  child: AddCommentForum(
                      forum: widget.forumModel,
                      comment: null,
                      isAnAnswer: false),
                ),
              );
            },
          ).then((value) => setState(() {}));
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: MizzUpTheme.primaryColor,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              widget.forumModel.titre,
                              style: MizzUpTheme.title1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.forumModel.description,
                        style: MizzUpTheme.bodyText1,
                      ),
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
                        StreamBuilder<List<ForumCommentModel>>(
                          stream:
                              forumCommentStream, // Remplacez yourStream par votre flux de commentaires de forum
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
                                        'Aucun commentaire',
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
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child:
                                            buildItems(snapshot.data![index]));
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
                        Row(
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
                        Visibility(
                          visible: forumCommentModel.userId ==
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.9,
                                        child: AddCommentForum(
                                            forum: widget.forumModel,
                                            comment: forumCommentModel,
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
                                            deleteComment(forumCommentModel
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
                              color: Colors.white,
                            ),
                          ),
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
                          onTap: () {
                            incrementLikeCount(forumCommentModel.id, 1,
                                FirebaseAuth.instance.currentUser!.uid);
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  incrementLikeCount(forumCommentModel.id, 1,
                                      FirebaseAuth.instance.currentUser!.uid);
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
                              Text(
                                  forumCommentModel.likeCount.toString() +
                                      " Like(s)",
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
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 500),
                                      reverseDuration:
                                          Duration(milliseconds: 500),
                                      child: ReplyCommentForum(
                                        forumCommentModel: forumCommentModel,
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.comment_outlined,
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

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserById(String userId) {
    return FirebaseFirestore.instance.collection('users').doc(userId).get();
  }

  Future<DocumentReference> getUserDocumentReferenceById(String userId) async {
    final documentReference =
        FirebaseFirestore.instance.collection('users').doc(userId);
    final documentSnapshot = await documentReference.get();
    if (!documentSnapshot.exists) {
      throw Exception('Utilisateur introuvable');
    }
    return documentReference;
  }
}
