import 'dart:async';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'articles_record.g.dart';

abstract class ArticlesRecord
    implements Built<ArticlesRecord, ArticlesRecordBuilder> {
  static Serializer<ArticlesRecord> get serializer =>
      _$articlesRecordSerializer;

  @BuiltValueField(wireName: 'create_time')
  DateTime? get createTime;

  DocumentReference? get userCreate;

  String? get titre;

  String? get imagePrincipale;

  String? get categorie;

  String? get description;

  bool? get isUp;

  bool? get isVisible;

  String? get bouton1;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(ArticlesRecordBuilder builder) => builder
    ..titre = ''
    ..imagePrincipale = ''
    ..description = ''
    ..categorie = ''
    ..isUp = false
    ..isVisible = false
    ..bouton1 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('articles');

  static Stream<ArticlesRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ArticlesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ArticlesRecord._();
  factory ArticlesRecord([void Function(ArticlesRecordBuilder) updates]) =
      _$ArticlesRecord;

  static ArticlesRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});

  static search({String? term, int? maxResults}) {}
}

Map<String, dynamic> createArticlesRecordData({
  DateTime? createTime,
  DocumentReference? userCreate,
  String? titre,
  String? imagePrincipale, 
  String? categorie,
  String? description,
  bool? isUp,
  bool? isVisible,
  String? bouton1,
}) =>
    serializers.toFirestore(
        ArticlesRecord.serializer,
        ArticlesRecord((a) => a
          ..createTime = createTime
          ..userCreate = userCreate as DocumentReference<Object>?
          ..titre = titre
          ..imagePrincipale = imagePrincipale
          ..description = description
          ..categorie = categorie
          ..isUp = isUp
          ..isVisible = isVisible
          ..bouton1 = bouton1));
