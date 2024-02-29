import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';

class ForumCommentModel {
  String id;
  String userId;
  String userName;
  String userFirstName;
  String userProfilePhoto;
  String comment;
  int likeCount;
  List<String> likedBy;
  int commentCount;

  ForumCommentModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userFirstName,
    required this.userProfilePhoto,
    required this.comment,
    required this.likeCount,
    required this.likedBy,
    required this.commentCount,
  });

  factory ForumCommentModel.fromJson(Map<String, dynamic> json) {
    return ForumCommentModel(
      id: '',
      userId: valueOrDefault(json['userId'], ''),
      userName: valueOrDefault(json['userName'], ''),
      userFirstName: valueOrDefault(json['userFirstName'], ''),
      userProfilePhoto: valueOrDefault(json['userProfilePhoto'], ''),
      comment: valueOrDefault(json['comment'], ''),
      likeCount: valueOrDefault(json['likeCount'], 0),
      likedBy: List<String>.from(valueOrDefault(json['likedBy'], [])),
      commentCount: valueOrDefault(json['commentCount'], 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userFirstName': userFirstName,
      'userProfilePhoto': userProfilePhoto,
      'comment': comment,
      'likeCount': likeCount,
      'likedBy': likedBy,
      'commentCount': commentCount,
    };
  }
}
