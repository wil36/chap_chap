import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/backend/backend.dart';

class ForumCommentModel {
  String id;
  String userId;
  String forumId;
  DateTime createdDate;
  String userName;
  String userFirstName;
  String userProfilePhoto;
  String comment;
  int likeCount;
  List<String> likedBy;
  int commentCount;

  ForumCommentModel({
    required this.id,
    required this.forumId,
    required this.createdDate,
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
      id: valueOrDefault(json['id'], ''),
      userId: valueOrDefault(json['userId'], ''),
      forumId: valueOrDefault(json['forumId'], ''),
      createdDate: valueOrDefault(
          (json['createdDate'] as Timestamp).toDate(), DateTime.now()),
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
      'id': id,
      'userId': userId,
      'forumId': forumId,
      'createdDate': Timestamp.fromDate(createdDate),
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
