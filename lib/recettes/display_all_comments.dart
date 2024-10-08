import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/profil/other_profile_page.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
import 'package:chap_chap/recettes/reply_comment.dart';
import 'package:flutter/material.dart';

// ignore_for_file: avoid_print, deprecated_member_use

import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';

import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import '../backend/backend.dart';
import 'edit_reply.dart';

class DisplayAllComments extends StatefulWidget {
  final DocumentReference recetteRef;
  DisplayAllComments({
    required this.recetteRef,
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
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
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
            ),
            StreamBuilder(
                stream: getAllRecipeComments(widget.recetteRef),
                builder: (context, recipes) {
                  if (recipes.hasData) {
                    if (recipes.data!.docs.length == 0) {
                      return Center(child: Text('Pas encore de commentaires'));
                    }
                    var recipeComments = recipes.data!.docs;
                    return FutureBuilder(
                      future: getUserById(recipeComments[0]['user_id']),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var user = snapshot.data;
                          String userPhoto = user!
                                  .data()!
                                  .containsKey('photo_url')
                              ? user['photo_url']
                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg';
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              for (var recipe in recipeComments)
                                FutureBuilder(
                                  future: getUserById(recipe['user_id']),
                                  builder: (context, snapshot) {
                                    var comment = recipe;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: LayoutBuilder(
                                          builder: (BuildContext context,
                                              BoxConstraints constraints) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  OtherProfilePage(
                                                                userId: recipe[
                                                                    'user_id'],
                                                              ),
                                                            ));
                                                      },
                                                      child: Row(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50), // Adjust the radius to your liking
                                                            child:
                                                                Image.network(
                                                              userPhoto,
                                                              width: 30,
                                                              height: 30,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                user[
                                                                    'display_name'],
                                                                style: MizzUpTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'IBM',
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      recipe['date']
                                                          .toDate()
                                                          .toString()
                                                          .substring(0, 10),
                                                      style: MizzUpTheme
                                                          .bodyText1
                                                          .override(
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Text(
                                                    textAlign: TextAlign.left,
                                                    comment['comment']
                                                        .toString(),
                                                    style: MizzUpTheme.bodyText1
                                                        .override(
                                                      color: Colors.black,
                                                      fontFamily: 'IBM',
                                                      fontSize: 12,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    //repondre button
                                                    TextButton(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.9,
                                                                child: ReplyComment(
                                                                    comment:
                                                                        comment,
                                                                    user: user),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) {
                                                          if (mounted) {
                                                            setState(() {});
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      15),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.3),
                                                                spreadRadius: 0,
                                                                blurRadius: 5,
                                                                offset: const Offset(
                                                                    0,
                                                                    4), // changes position of shadow
                                                              ),
                                                            ],
                                                          ),
                                                          child: const Text(
                                                              'Répondre',
                                                              style: TextStyle(
                                                                  color: MizzUpTheme
                                                                      .primaryColor,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300))),
                                                    ),
                                                    //like button
                                                    Row(
                                                      children: [
                                                        Text(
                                                          comment['likes']
                                                              .length
                                                              .toString(),
                                                          style: MizzUpTheme
                                                              .bodyText1
                                                              .override(
                                                            color: Colors.black,
                                                            fontFamily: 'IBM',
                                                            fontSize: 14,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                        ),
                                                        ToggleIcon(
                                                          onPressed: () async {
                                                            comment['likes']
                                                                    .contains(
                                                                        currentUserUid)
                                                                ? await unlikeComment(
                                                                    comment.id)
                                                                : await likeComment(
                                                                    comment.id);
                                                            setState(() {});
                                                          },
                                                          value: comment[
                                                                  'likes']
                                                              .contains(
                                                                  currentUserUid),
                                                          onIcon: Icon(
                                                              Icons.favorite,
                                                              color: MizzUpTheme
                                                                  .primaryColor),
                                                          offIcon: Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: MizzUpTheme
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                //replies
                                                StreamBuilder(
                                                    stream: getCommentReplies(
                                                        comment.id),
                                                    builder:
                                                        ((context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        var replies =
                                                            snapshot.data!.docs;
                                                        if (replies.length == 0)
                                                          return Container();
                                                        return Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () async {
                                                                comment['show_replies']
                                                                    ? await hideReplies(
                                                                        comment
                                                                            .id)
                                                                    : await showReplies(
                                                                        comment
                                                                            .id);
                                                              },
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      replies.length >
                                                                              1
                                                                          ? '${replies.length} réponses'
                                                                          : '${replies.length} réponse',
                                                                      style:
                                                                          TextStyle(
                                                                        color: MizzUpTheme
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: MizzUpTheme
                                                                            .primaryColor),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            comment[
                                                                    'show_replies']
                                                                ? Column(
                                                                    children: [
                                                                        for (var reply
                                                                            in replies)
                                                                          FutureBuilder(
                                                                              future: getUserById(reply['user']),
                                                                              builder: (context, snapshot) {
                                                                                if (snapshot.hasData) {
                                                                                  var user = snapshot.data;
                                                                                  String userPhoto = user!.data()!.containsKey('photo_url') ? user['photo_url'] : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chap-chap-1137ns/assets/n3ejaipxw085/user-22.jpg';
                                                                                  return Padding(
                                                                                    padding: const EdgeInsets.only(right: 10),
                                                                                    child: Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width,
                                                                                        padding: const EdgeInsets.all(10),
                                                                                        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 30),
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
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                SingleChildScrollView(
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      GestureDetector(
                                                                                                        onTap: () async {
                                                                                                          await Navigator.push(
                                                                                                              context,
                                                                                                              MaterialPageRoute(
                                                                                                                builder: (context) => OtherProfilePage(
                                                                                                                  userId: user['uid'],
                                                                                                                ),
                                                                                                              ));
                                                                                                        },
                                                                                                        child: Row(
                                                                                                          children: [
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(30), // Adjust the radius to your liking
                                                                                                              child: Image.network(
                                                                                                                userPhoto,
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
                                                                                                      ),
                                                                                                      Text(
                                                                                                        DateFormat.yMd('fr_FR').format(reply['date'].toDate()),
                                                                                                        style: MizzUpTheme.bodyText1.override(
                                                                                                          color: Colors.grey,
                                                                                                          fontFamily: 'IBM',
                                                                                                          fontSize: 10,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(width: 5),
                                                                                                      reply["user"] == currentUserUid
                                                                                                          ? GestureDetector(
                                                                                                              onTap: () {
                                                                                                                showCommentOptions(context, reply);
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.more_vert,
                                                                                                                color: Colors.grey,
                                                                                                                size: 20,
                                                                                                              ),
                                                                                                            )
                                                                                                          : SizedBox()
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  height: 10,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 30,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    reply['comment_reply'],
                                                                                                    textAlign: TextAlign.left,
                                                                                                    style: MizzUpTheme.bodyText1.override(
                                                                                                      color: Colors.black,
                                                                                                      fontFamily: 'IBM',
                                                                                                      fontSize: 12,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else if (snapshot.hasError) {
                                                                                  return Text('Erreur: ${snapshot.error}');
                                                                                } else {
                                                                                  return const Center(child: CircularProgressIndicator());
                                                                                }
                                                                              })
                                                                      ])
                                                                : Divider(),
                                                          ],
                                                        );
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return Text(
                                                            'Erreur: ${snapshot.error}');
                                                      } else {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      }
                                                    })),
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
                        } else if (snapshot.hasError) {
                          return Text('Erreur: ${snapshot.error}');
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    );
                  } else if (recipes.hasError) {
                    return Text('Erreur: ${recipes.error}');
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }

  void showCommentOptions(BuildContext context,
      QueryDocumentSnapshot<Map<String, dynamic>> comment) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'edit',
          child: Text('Modifier',
              style: TextStyle(color: Colors.black, fontSize: 12)),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Text('Supprimer',
              style: TextStyle(color: Colors.black, fontSize: 12)),
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? selected) async {
      if (selected == null) return;
      if (selected == 'edit') {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: EditReply(
                  comment: comment,
                  isAnAnswer: true,
                ),
              ),
            );
          },
        ).then((value) {
          if (mounted) {
            setState(() {});
          }
        });
      } else if (selected == 'delete') {
        await deleteCommentAnswer(comment.id);
      }
    });
  }

  Future<void> deleteCommentAnswer(String commentId) async {
    await FirebaseFirestore.instance
        .collection('comments_reply')
        .doc(commentId)
        .delete();
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> getCommentReplies(
    String commentId) {
  return FirebaseFirestore.instance
      .collection('comments_reply')
      .where('comment_id'.split('/comments/')[0], isEqualTo: commentId)
      .snapshots();
}

Future<void> showReplies(String commentId) async {
  await FirebaseFirestore.instance
      .collection('comments')
      .doc(commentId)
      .update({
    'show_replies': true,
  });
}

Future<void> hideReplies(String commentId) async {
  await FirebaseFirestore.instance
      .collection('comments')
      .doc(commentId)
      .update({
    'show_replies': false,
  });
}
