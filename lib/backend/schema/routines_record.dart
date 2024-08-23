import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'routines_record.g.dart';

abstract class RoutinesRecord
    implements Built<RoutinesRecord, RoutinesRecordBuilder> {
  static Serializer<RoutinesRecord> get serializer =>
      _$routinesRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  DocumentReference? get userRef;

  bool? get soinNourissant;

  @BuiltValueField(wireName: 'ShampoingClarifiant')
  bool? get shampoingClarifiant;

  bool? get shampoingDoux;

  bool? get coWash;

  bool? get noPoo;

  bool? get apresShampoing;

  bool? get soinHydratant;

  bool? get soinProteine;

  bool? get autres;

  String? get autresDescription;

  String? get recurrence;

  bool? get alerte;

  String? get notes;

  String? get photo1;

  String? get photo2;

  String? get photo3;

  String? get photo4;

  DateTime? get deBut;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(RoutinesRecordBuilder builder) => builder
    ..soinNourissant = false
    ..shampoingClarifiant = false
    ..shampoingDoux = false
    ..coWash = false
    ..noPoo = false
    ..apresShampoing = false
    ..soinHydratant = false
    ..soinProteine = false
    ..autres = false
    ..autresDescription = ''
    ..recurrence = ''
    ..alerte = false
    ..notes = ''
    ..photo1 = ''
    ..photo2 = ''
    ..photo3 = ''
    ..photo4 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('routines');

  static Stream<RoutinesRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RoutinesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RoutinesRecord._();
  factory RoutinesRecord([void Function(RoutinesRecordBuilder) updates]) =
      _$RoutinesRecord;

  static RoutinesRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRoutinesRecordData({
  DateTime? createTime,
  DocumentReference? userRef,
  bool? soinNourissant,
  bool? shampoingClarifiant,
  bool? shampoingDoux,
  bool? coWash,
  bool? noPoo,
  bool? apresShampoing,
  bool? soinHydratant,
  bool? soinProteine,
  bool? autres,
  String? autresDescription,
  String? recurrence,
  bool? alerte,
  String? notes,
  String? photo1,
  String? photo2,
  String? photo3,
  String? photo4,
  DateTime? deBut,
}) =>
    serializers.toFirestore(
        RoutinesRecord.serializer,
        RoutinesRecord((r) => r
          ..createTime = createTime
          ..userRef = userRef as DocumentReference<Object>?
          ..soinNourissant = soinNourissant
          ..shampoingClarifiant = shampoingClarifiant
          ..shampoingDoux = shampoingDoux
          ..coWash = coWash
          ..noPoo = noPoo
          ..apresShampoing = apresShampoing
          ..soinHydratant = soinHydratant
          ..soinProteine = soinProteine
          ..autres = autres
          ..autresDescription = autresDescription
          ..recurrence = recurrence
          ..alerte = alerte
          ..notes = notes
          ..photo1 = photo1
          ..photo2 = photo2
          ..photo3 = photo3
          ..photo4 = photo4
          ..deBut = deBut));
