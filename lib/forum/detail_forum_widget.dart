import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';
import 'package:chap_chap/backend/backend.dart';
import 'package:chap_chap/forum/Models/forum_comments_model.dart';
import 'package:chap_chap/forum/Models/forum_model.dart';
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
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('forum_comments').get();
    List<ForumCommentModel> forumCommentList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      ForumCommentModel forum = ForumCommentModel.fromJson(data);
      forum.id = doc.id;
      return forum;
    }).toList();
    print('hello');
    print(forumCommentList.length);
    return forumCommentList;
  }

  @override
  void initState() {
    super.initState();
    getForumCommentData().then((value) {
      setState(() {
        items = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MizzUpTheme.tertiaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: MizzUpTheme.tertiaryColor,
        ),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1.5,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                  physics: NeverScrollableScrollPhysics(),
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
                      isLoading
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: MizzUpTheme.primaryColor,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: double.infinity,
                              child: ListView.builder(
                                controller: scrollController,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: buildItems(items[index]));
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
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
              SizedBox(
                height: 20,
              ),
              Text(forumCommentModel.comment, style: MizzUpTheme.bodyText3),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(forumCommentModel.likeCount.toString() + " Votes",
                          style: MizzUpTheme.bodyText3),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment_outlined,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                          forumCommentModel.commentCount.toString() +
                              " Replies",
                          style: MizzUpTheme.bodyText3),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
