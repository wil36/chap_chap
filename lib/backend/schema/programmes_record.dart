import 'dart:async';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'programmes_record.g.dart';

abstract class ProgrammesRecord
    implements Built<ProgrammesRecord, ProgrammesRecordBuilder> {
  static Serializer<ProgrammesRecord> get serializer =>
      _$programmesRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  DocumentReference? get userRef;

  String? get imagePrincipale;

  String? get titre;

  String? get sousTitre;

  int? get duree;

  int? get addDuration;

  String? get description;

  String? get listeAvantages;

  String? get intro;

  String? get commentPasse;

  String? get lienRecette1;

  String? get lienRecette2;

  String? get lienRecette3;

  String? get lienRecette4;

  String? get lienRecette5;

  String? get photoRecette1;

  String? get photoRecette2;

  String? get photoRecette3;

  String? get photoRecette4;

  String? get photoRecette5;

  String? get lienPhoto1;

  String? get lienPhoto2;

  String? get lienPhoto3;

  String? get lienPhoto4;

  String? get lienPhoto5;

  bool? get free;

  BuiltList<DocumentReference>? get semaineAdd;

  BuiltList<DocumentReference>? get ingredientProg;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(ProgrammesRecordBuilder builder) => builder
    ..imagePrincipale = ''
    ..titre = ''
    ..sousTitre = ''
    ..duree = 0
    ..addDuration = 0
    ..description = ''
    ..listeAvantages = ''
    ..intro = ''
    ..commentPasse = ''
    ..lienRecette1 = ''
    ..lienRecette2 = ''
    ..lienRecette3 = ''
    ..lienRecette4 = ''
    ..lienRecette5 = ''
    ..lienRecette1 = ''
    ..photoRecette1 = ''
    ..photoRecette2 = ''
    ..photoRecette3 = ''
    ..photoRecette4 = ''
    ..photoRecette5 = ''
    ..lienPhoto1 = ''
    ..lienPhoto2 = ''
    ..lienPhoto3 = ''
    ..lienPhoto4 = ''
    ..lienPhoto5 = ''
    ..free = false
    ..semaineAdd = ListBuilder()
    ..ingredientProg = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('programmes');

  static Stream<ProgrammesRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProgrammesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProgrammesRecord._();
  factory ProgrammesRecord([void Function(ProgrammesRecordBuilder) updates]) =
      _$ProgrammesRecord;

  static ProgrammesRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProgrammesRecordData({
  DateTime? createTime,
  DocumentReference? userRef,
  String? imagePrincipale,
  String? titre,
  String? sousTitre,
  int? duree,
  int? addDuration,
  String? intro,
  String? commentPasse,
  String? description,
  String? lienRecette1,
  String? lienRecette2,
  String? lienRecette3,
  String? lienRecette4,
  String? lienRecette5,
  String? photoRecette1,
  String? photoRecette2,
  String? photoRecette3,
  String? photoRecette4,
  String? photoRecette5,
  String? listeAvantages,
  String? lienPhoto1,
  String? lienPhoto2,
  String? lienPhoto3,
  String? lienPhoto4,
  String? lienPhoto5,
  bool? free,
}) =>
    serializers.toFirestore(
        ProgrammesRecord.serializer,
        ProgrammesRecord((p) => p
          ..createTime = createTime
          ..userRef = userRef as DocumentReference<Object>?
          ..imagePrincipale = imagePrincipale
          ..titre = titre
          ..sousTitre = sousTitre
          ..duree = duree
          ..addDuration = addDuration
          ..description = description
          ..listeAvantages = listeAvantages
          ..intro = intro
          ..commentPasse = commentPasse
          ..lienRecette1 = lienRecette1
          ..lienRecette2 = lienRecette2
          ..lienRecette3 = lienRecette3
          ..lienRecette4 = lienRecette4
          ..lienRecette5 = lienRecette5
          ..photoRecette1 = photoRecette1
          ..photoRecette2 = photoRecette2
          ..photoRecette3 = photoRecette3
          ..photoRecette4 = photoRecette4
          ..photoRecette5 = photoRecette5
          ..lienPhoto1 = lienPhoto1
          ..lienPhoto2 = lienPhoto2
          ..lienPhoto3 = lienPhoto3
          ..lienPhoto4 = lienPhoto4
          ..lienPhoto5 = lienPhoto5
          ..free = free
          ..ingredientProg = null
          ..semaineAdd = null));
