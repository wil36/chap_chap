import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'instagram_record.g.dart';

abstract class InstagramRecord
    implements Built<InstagramRecord, InstagramRecordBuilder> {
  static Serializer<InstagramRecord> get serializer =>
      _$instagramRecordSerializer;

  String? get photo1;

  String? get photo2;

  String? get photo3;

  String? get photo4;

  String? get photo5;

  String? get photo6;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(InstagramRecordBuilder builder) => builder
    ..photo1 = ''
    ..photo2 = ''
    ..photo3 = ''
    ..photo4 = ''
    ..photo5 = ''
    ..photo6 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('instagram');

  static Stream<InstagramRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<InstagramRecord?> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  InstagramRecord._();
  factory InstagramRecord([void Function(InstagramRecordBuilder) updates]) =
      _$InstagramRecord;

  static InstagramRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createInstagramRecordData({
  String? photo1,
  String? photo2,
  String? photo3,
  String? photo4,
  String? photo5,
  String? photo6,
}) =>
    serializers.toFirestore(
        InstagramRecord.serializer,
        InstagramRecord((i) => i
          ..photo1 = photo1
          ..photo2 = photo2
          ..photo3 = photo3
          ..photo4 = photo4
          ..photo5 = photo5
          ..photo6 = photo6));
