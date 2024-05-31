import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/backend/backend.dart';

class NotificationUserModel {
  final DocumentReference userRef;
  final String title;
  final String message;
  final bool lu;
  final String image;
  final String type;
  final String id;
  final DocumentReference docNotifRef;
  final Timestamp createTime;

  NotificationUserModel({
    required this.userRef,
    required this.title,
    required this.message,
    required this.lu,
    required this.image,
    required this.type,
    required this.docNotifRef,
    required this.createTime,
    required this.id,
  });

  factory NotificationUserModel.fromJson(Map<String, dynamic> json) {
    return NotificationUserModel(
      userRef: json['userRef'] as DocumentReference,
      title: json['Titre'],
      message: json['description'],
      lu: json['lu'],
      image: json['image'],
      type: json['type'],
      docNotifRef: json['Document__Reference__Field'] as DocumentReference,
      createTime: json['create_time'] as Timestamp,
      id: json['id'],
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification_user');

  Map<String, dynamic> toJson() {
    return {
      'create_time': FieldValue.serverTimestamp(),
      'Titre': title,
      'description': message,
      'lu': lu,
      'image': image,
      'userRef': userRef.id,
      'type': type,
      'Document__Reference__Field': docNotifRef.id,
      'id': ""
    };
  }

  static Stream<List<NotificationUserModel>> getAllNotifications() {
    return FirebaseFirestore.instance
        .collection('notification_user')
        .where('userRef', isEqualTo: currentUserReference)
        .where('lu', isEqualTo: false)
        .orderBy('create_time', descending: true)
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => NotificationUserModel.fromJson(doc.data()))
            .toList());
  }

  static Future<List<NotificationUserModel>> getAllNotificationsSync() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('notification_user')
        .where('userRef', isEqualTo: currentUserReference)
        .where('lu', isEqualTo: false)
        .orderBy('create_time', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      final notif = NotificationUserModel.fromJson(doc.data());
      print(notif);
      return notif;
    }).toList();
  }

  static Future<void> markAsRead(String id) async {
    await FirebaseFirestore.instance
        .collection('notification_user')
        .doc(id)
        .update({'lu': true});
  }
}
