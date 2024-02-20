import 'dart:async';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'list_ingredients_record.g.dart';

abstract class ListIngredientsRecord
    implements Built<ListIngredientsRecord, ListIngredientsRecordBuilder> {
  static Serializer<ListIngredientsRecord> get serializer =>
      _$listIngredientsRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  bool? get poudresAroma;

  bool? get huilesAroma;

  bool? get poudresBaB;

  bool? get huilesBaB;

  bool? get divers;

  String? get image;

  String? get titre;

  String? get lienExterne;

  DocumentReference? get progRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(ListIngredientsRecordBuilder builder) =>
      builder
        ..poudresAroma = false
        ..huilesAroma = false
        ..poudresBaB = false
        ..huilesBaB = false
        ..divers = false
        ..image = ''
        ..titre = ''
        ..lienExterne = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listIngredients');

  static Stream<ListIngredientsRecord?> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ListIngredientsRecord?> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ListIngredientsRecord._();
  factory ListIngredientsRecord(
          [void Function(ListIngredientsRecordBuilder) updates]) =
      _$ListIngredientsRecord;

  static ListIngredientsRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createListIngredientsRecordData({
  DateTime? createTime,
  bool? poudresAroma,
  bool? huilesAroma,
  bool? poudresBaB,
  bool? huilesBaB,
  bool? divers,
  String? image,
  String? titre,
  String? lienExterne,
  DocumentReference? progRef,
}) =>
    serializers.toFirestore(
        ListIngredientsRecord.serializer,
        ListIngredientsRecord((l) => l
          ..createTime = createTime
          ..poudresAroma = poudresAroma
          ..huilesAroma = huilesAroma
          ..poudresBaB = poudresBaB
          ..huilesBaB = huilesBaB
          ..divers = divers
          ..image = image
          ..titre = titre
          ..lienExterne = lienExterne
          ..progRef = progRef));
