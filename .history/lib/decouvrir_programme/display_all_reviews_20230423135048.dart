import 'package:chap_chap/decouvrir_programme/fiche_programme_widget.dart';
import 'package:chap_chap/recettes/recette_suite2_widget.dart';
import 'package:chap_chap/recettes/reply_comment.dart';
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

class DisplayAllReviews extends StatefulWidget {
  final String programmeId;
  DisplayAllReviews({
    required this.programmeId,
    Key? key,
  }) : super(key: key);
  @override
  _DisplayAllReviewsState createState() => _DisplayAllReviewsState();
}

class _DisplayAllReviewsState extends State<DisplayAllReviews> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            ),
            StreamBuilder(
                stream: getAllProgrammeReviews(widget.programmeId),
                builder: (context, reviewsFetched) {
                  if (reviewsFetched.hasData) {
                    if (reviewsFetched.data!.docs.length == 0) {
                      return Center(child: Text('Pas encore de commentaires'));
                    }
                    var reviews = reviewsFetched.data!.docs;
                    return FutureBuilder(
                      future: getUserById(reviews[0]['user_id']),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var user = snapshot.data;
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              for (var review in reviews)
                                FutureBuilder(
                                  future: getUserById(review['user_id']),
                                  builder: (context, snapshot) {
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
                                                      review['date'].toDate().toString().substring(0, 10),
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
                                                      review['review'].toString(),
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
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      review['likes'].length.toString(),
                                                      style: MizzUpTheme.bodyText1.override(
                                                        color: Colors.black,
                                                        fontFamily: 'IBM',
                                                        fontSize: 14,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        review['likes'].contains(user['uid']) ? await unlikeReview(review.id) : await likeReview(review.id);
                                                        setState(() {});
                                                      },
                                                      value: review['likes'].contains(user['uid']),
                                                      onIcon: Icon(Icons.favorite, color: MizzUpTheme.primaryColor),
                                                      offIcon: Icon(Icons.favorite_border, color: MizzUpTheme.primaryColor),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
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
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    );
                  } else if (reviewsFetched.hasError) {
                    return Text('Erreur: ${reviewsFetched.error}');
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}

Stream<QuerySnapshot> getCommentReplies(String commentId) {
  return FirebaseFirestore.instance.collection('comments_reply').where('comment_id'.split('/comments/')[0], isEqualTo: commentId).snapshots();
}

Future<void> showReplies(String commentId) async {
  await FirebaseFirestore.instance.collection('comments').doc(commentId).update({
    'show_replies': true,
  });
}

Future<void> hideReplies(String commentId) async {
  await FirebaseFirestore.instance.collection('comments').doc(commentId).update({
    'show_replies': false,
  });
}

Stream<QuerySnapshot<Map<String, dynamic>>> getAllProgrammeReviews(String programmeId) {
  return FirebaseFirestore.instance.collection('reviews').where('programme_id', isEqualTo: programmeId).snapshots();
}
