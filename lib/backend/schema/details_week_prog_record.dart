import 'dart:async';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'details_week_prog_record.g.dart';

abstract class DetailsWeekProgRecord
    implements Built<DetailsWeekProgRecord, DetailsWeekProgRecordBuilder> {
  static Serializer<DetailsWeekProgRecord> get serializer =>
      _$detailsWeekProgRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  DocumentReference? get progRef;

  int? get semaineNumero;

  DocumentReference? get recette1;

  DocumentReference? get recette2;

  DocumentReference? get recette3;

  DocumentReference? get userRef;

  String? get texte1;

  String? get texte2;

  String? get titreEtape1;

  String? get titreEtape2;

  String? get titreEtape3;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(DetailsWeekProgRecordBuilder builder) =>
      builder
        ..semaineNumero = 0
        ..texte1 = ''
        ..texte2 = ''
        ..titreEtape1 = ''
        ..titreEtape2 = ''
        ..titreEtape3 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('detailsWeekProg');

  static Stream<DetailsWeekProgRecord?> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DetailsWeekProgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DetailsWeekProgRecord._();
  factory DetailsWeekProgRecord(
          [void Function(DetailsWeekProgRecordBuilder) updates]) =
      _$DetailsWeekProgRecord;

  static DetailsWeekProgRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDetailsWeekProgRecordData({
  DateTime? createTime,
  DocumentReference? progRef,
  int? semaineNumero,
  DocumentReference? userRef,
  String? texte1,
  String? texte2,
  String? titreEtape1,
  String? titreEtape2,
  String? titreEtape3,
  DocumentReference? recette1,
  DocumentReference? recette2,
  DocumentReference? recette3,
}) =>
    serializers.toFirestore(
        DetailsWeekProgRecord.serializer,
        DetailsWeekProgRecord((d) => d
          ..createTime = createTime
          ..progRef = progRef as DocumentReference<Object>?
          ..semaineNumero = semaineNumero
          ..recette1 = recette1 as DocumentReference<Object>?
          ..recette2 = recette2 as DocumentReference<Object>?
          ..recette3 = recette3 as DocumentReference<Object>?
          ..userRef = userRef as DocumentReference<Object>?
          ..texte1 = texte1
          ..texte2 = texte2
          ..titreEtape1 = titreEtape1
          ..titreEtape2 = titreEtape2
          ..titreEtape3 = titreEtape3));
