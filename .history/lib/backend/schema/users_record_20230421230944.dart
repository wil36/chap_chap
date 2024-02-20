import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'bio')
  String? get bio;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  DateTime? get dateNaissance;

  @BuiltValueField(wireName: 'Nom')
  String? get nom;

  @BuiltValueField(wireName: 'Prenom')
  String? get prenom;

  @BuiltValueField(wireName: 'tiktok')
  String? get tiktok;

  DocumentReference? get progRef;

  bool? get recevoirNotif;

  int? get userNotifications;

  bool? get recevoirNewsletter;

  bool? get recevoirMail;

  BuiltList<DocumentReference>? get favorisRecettes;

  bool? get admin;

  bool? get threeMonth;

  bool? get sixMonth;

  bool? get twelveMonth;

  bool? get member;

  DateTime? get dateFinAbo;

  BuiltList<DocumentReference>? get favorisArticles;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..bio = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..nom = ''
    ..prenom = ''
    ..tiktok = ''
    ..userNotifications = 0
    ..recevoirNotif = false
    ..recevoirNewsletter = false
    ..recevoirMail = false
    ..favorisRecettes = ListBuilder()
    ..admin = false
    ..threeMonth = false
    ..sixMonth = false
    ..twelveMonth = false
    ..member = false
    ..favorisArticles = ListBuilder();

  static CollectionReference get collection => FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord?> getDocument(DocumentReference ref) => ref.snapshots().map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref.get().then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) = _$UsersRecord;

  static UsersRecord? getDocumentFromData(Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer, {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? dateNaissance,
  String? nom,
  String? prenom,
  DocumentReference? progRef,
  bool? recevoirNotif,
  bool? recevoirNewsletter,
  bool? recevoirMail,
  bool? admin,
  bool? twelveMonth,
  bool? sixMonth,
  bool? member,
  bool? threeMonth,
  int? userNotifications,
  DateTime? dateFinAbo,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..dateNaissance = dateNaissance
          ..nom = nom
          ..prenom = prenom
          ..progRef = progRef as DocumentReference<Object>?
          ..userNotifications = userNotifications
          ..recevoirNotif = recevoirNotif
          ..recevoirNewsletter = recevoirNewsletter
          ..recevoirMail = recevoirMail
          ..favorisRecettes = null
          ..admin = admin
          ..sixMonth = sixMonth
          ..threeMonth = threeMonth
          ..twelveMonth = twelveMonth
          ..member = member
          ..favorisArticles = null
          ..dateFinAbo = dateFinAbo));
