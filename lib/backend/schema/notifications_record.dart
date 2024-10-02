import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notifications_record.g.dart';

abstract class NotificationsRecord
    implements Built<NotificationsRecord, NotificationsRecordBuilder> {
  static Serializer<NotificationsRecord> get serializer =>
      _$notificationsRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  @BuiltValueField(wireName: 'Titre')
  String? get titre;

  DocumentReference? get userRef;

  String? get description;

  bool? get lu;

  String? get image;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(NotificationsRecordBuilder builder) => builder
    ..titre = ''
    ..description = ''
    ..lu = false
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notification');
  static CollectionReference get collection2 =>
      FirebaseFirestore.instance.collection('notification_user');

  static Stream<NotificationsRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotificationsRecord._();
  factory NotificationsRecord(
          [void Function(NotificationsRecordBuilder) updates]) =
      _$NotificationsRecord;

  static NotificationsRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? userRef,
  DateTime? createTime,
  String? titre,
  String? description,
  bool? lu,
  String? image,
}) =>
    serializers.toFirestore(
        NotificationsRecord.serializer,
        NotificationsRecord((n) => n
          ..createTime = createTime
          ..userRef = userRef as DocumentReference<Object>?
          ..titre = titre
          ..description = description
          ..lu = lu
          ..image = image));
