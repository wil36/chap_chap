import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cheveux_user_record.g.dart';

abstract class CheveuxUserRecord
    implements Built<CheveuxUserRecord, CheveuxUserRecordBuilder> {
  static Serializer<CheveuxUserRecord> get serializer =>
      _$cheveuxUserRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  DocumentReference? get userRef;

  int? get styleCheveux;

  int? get cuirCheveulu;

  int? get perteCheveux;

  int? get pellicules;

  int? get routineCapillaire;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(CheveuxUserRecordBuilder builder) => builder
    ..styleCheveux = 0
    ..cuirCheveulu = 0
    ..perteCheveux = 0
    ..pellicules = 0
    ..routineCapillaire = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cheveuxUser');

  static Stream<CheveuxUserRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CheveuxUserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CheveuxUserRecord._();
  factory CheveuxUserRecord([void Function(CheveuxUserRecordBuilder) updates]) =
      _$CheveuxUserRecord;

  static CheveuxUserRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCheveuxUserRecordData({
  DateTime? createTime,
  DocumentReference? userRef,
  int? styleCheveux,
  int? cuirCheveulu,
  int? perteCheveux,
  int? pellicules,
  int? routineCapillaire,
}) =>
    serializers.toFirestore(
        CheveuxUserRecord.serializer,
        CheveuxUserRecord((c) => c
          ..createTime = createTime
          ..userRef = userRef as DocumentReference<Object>?
          ..styleCheveux = styleCheveux
          ..cuirCheveulu = cuirCheveulu
          ..perteCheveux = perteCheveux
          ..pellicules = pellicules
          ..routineCapillaire = routineCapillaire));
