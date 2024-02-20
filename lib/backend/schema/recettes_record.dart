import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recettes_record.g.dart';

abstract class RecettesRecord
    implements Built<RecettesRecord, RecettesRecordBuilder> {
  static Serializer<RecettesRecord> get serializer =>
      _$recettesRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  DocumentReference? get userCreate;

  String? get photoPrincipale;

  String? get niveauDifficulte;

  String? get titre;

  String? get lien;

  String? get listeIngredients;

  bool? get shampoing;

  bool? get masqueHydratant;

  bool? get masqueProteine;

  bool? get masqueNourissant;

  bool? get gel;

  bool? get leaveIn;

  bool? get free;

  bool? get sprayLotion;

  bool? get eauRincage;

  @BuiltValueField(wireName: 'Gommage')
  bool? get gommage;

  String? get etapes;

  int? get nbIngredients;

  int? get dureePrepa;

  String? get description;

  bool? get isUp;

  bool? get hided;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(RecettesRecordBuilder builder) => builder
    ..photoPrincipale = ''
    ..niveauDifficulte = ''
    ..titre = ''
    ..lien = ''
    ..listeIngredients = ''
    ..shampoing = false
    ..masqueHydratant = false
    ..masqueProteine = false
    ..masqueNourissant = false
    ..gel = false
    ..leaveIn = false
    ..sprayLotion = false
    ..eauRincage = false
    ..gommage = false
    ..etapes = ''
    ..nbIngredients = 0
    ..dureePrepa = 0
    ..description = ''
    ..isUp = false
    ..free = false
    ..hided = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recettes');

  static Stream<RecettesRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RecettesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecettesRecord._();
  factory RecettesRecord([void Function(RecettesRecordBuilder) updates]) =
      _$RecettesRecord;

  static RecettesRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRecettesRecordData({
  DateTime? createTime,
  DocumentReference? userCreate,
  String? photoPrincipale,
  String? niveauDifficulte,
  String? titre,
  String? lien,
  String? listeIngredients,
  bool? shampoing,
  bool? masqueHydratant,
  bool? masqueProteine,
  bool? masqueNourissant,
  bool? gel,
  bool? leaveIn,
  bool? sprayLotion,
  bool? eauRincage,
  bool? gommage,
  bool? free,
  String? etapes,
  int? nbIngredients,
  int? dureePrepa,
  String? description,
  bool? isUp,
  bool? hided,
}) =>
    serializers.toFirestore(
        RecettesRecord.serializer,
        RecettesRecord((r) => r
          ..createTime = createTime
          ..userCreate = userCreate as DocumentReference<Object>?
          ..photoPrincipale = photoPrincipale
          ..niveauDifficulte = niveauDifficulte
          ..titre = titre
          ..listeIngredients = listeIngredients
          ..shampoing = shampoing
          ..masqueHydratant = masqueHydratant
          ..masqueProteine = masqueProteine
          ..masqueNourissant = masqueNourissant
          ..gel = gel
          ..leaveIn = leaveIn
          ..sprayLotion = sprayLotion
          ..eauRincage = eauRincage
          ..gommage = gommage
          ..etapes = etapes
          ..nbIngredients = nbIngredients
          ..dureePrepa = dureePrepa
          ..description = description
          ..free = free
          ..isUp = isUp
          ..hided = hided));
