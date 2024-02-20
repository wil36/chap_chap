import 'dart:async';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'prog_user_record.g.dart';

abstract class ProgUserRecord
    implements Built<ProgUserRecord, ProgUserRecordBuilder> {
  static Serializer<ProgUserRecord> get serializer =>
      _$progUserRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  DocumentReference? get progRef;

  DocumentReference? get userRef;

  DocumentReference? get semaineShow;

  int? get numberDay;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(ProgUserRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('progUser');

  static Stream<ProgUserRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProgUserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProgUserRecord._();
  factory ProgUserRecord([void Function(ProgUserRecordBuilder) updates]) =
      _$ProgUserRecord;

  static ProgUserRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProgUserRecordData({
  DateTime? createTime,
  DocumentReference? progRef,
  DocumentReference? userRef,
  DocumentReference? semaineShow,
  int? numberDay,
}) =>
    serializers.toFirestore(
        ProgUserRecord.serializer,
        ProgUserRecord((p) => p
          ..createTime = createTime
          ..progRef = progRef as DocumentReference<Object>?
          ..userRef = userRef as DocumentReference<Object>?
          ..semaineShow = semaineShow as DocumentReference<Object>?
          ..numberDay = numberDay));
