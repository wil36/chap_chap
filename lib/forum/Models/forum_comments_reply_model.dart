import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';
import 'package:chap_chap/backend/backend.dart';

class ForumCommentReplyModel {
  String id;
  String userId;
  String forumCommentId;
  DateTime createdDate;
  String userName;
  String userFirstName;
  String userProfilePhoto;
  String comment;
  int likeCount;
  List<String> likedBy;
  int commentCount;

  ForumCommentReplyModel({
    required this.id,
    required this.forumCommentId,
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

  factory ForumCommentReplyModel.fromJson(Map<String, dynamic> json) {
    return ForumCommentReplyModel(
      id: valueOrDefault(json['id'], ''),
      userId: valueOrDefault(json['userId'], ''),
      forumCommentId: valueOrDefault(json['forumCommentId'], ''),
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
      'forumCommentId': forumCommentId,
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
