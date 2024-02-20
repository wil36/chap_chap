import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'nouveaux_message_record.g.dart';

abstract class NouveauxMessageRecord
    implements Built<NouveauxMessageRecord, NouveauxMessageRecordBuilder> {
  static Serializer<NouveauxMessageRecord> get serializer =>
      _$nouveauxMessageRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  String? get nomPrenom;

  String? get email;

  String? get message;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(NouveauxMessageRecordBuilder builder) =>
      builder
        ..nomPrenom = ''
        ..email = ''
        ..message = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nouveauxMessage');

  static Stream<NouveauxMessageRecord?> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NouveauxMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NouveauxMessageRecord._();
  factory NouveauxMessageRecord(
          [void Function(NouveauxMessageRecordBuilder) updates]) =
      _$NouveauxMessageRecord;

  static NouveauxMessageRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNouveauxMessageRecordData({
  DateTime? createTime,
  String? nomPrenom,
  String? email,
  String? message,
}) =>
    serializers.toFirestore(
        NouveauxMessageRecord.serializer,
        NouveauxMessageRecord((n) => n
          ..createTime = createTime
          ..nomPrenom = nomPrenom
          ..email = email
          ..message = message));
