// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArticlesRecord> _$articlesRecordSerializer =
    new _$ArticlesRecordSerializer();

class _$ArticlesRecordSerializer
    implements StructuredSerializer<ArticlesRecord> {
  @override
  final Iterable<Type> types = const [ArticlesRecord, _$ArticlesRecord];
  @override
  final String wireName = 'ArticlesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArticlesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createTime;
    if (value != null) {
      result
        ..add('create_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userCreate;
    if (value != null) {
      result
        ..add('userCreate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.titre;
    if (value != null) {
      result
        ..add('titre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imagePrincipale;
    if (value != null) {
      result
        ..add('imagePrincipale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categorie;
    if (value != null) {
      result
        ..add('categorie')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isUp;
    if (value != null) {
      result
        ..add('isUp')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isVisible;
    if (value != null) {
      result
        ..add('isVisible')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bouton1;
    if (value != null) {
      result
        ..add('bouton1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ArticlesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArticlesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'create_time':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userCreate':
          result.userCreate = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'titre':
          result.titre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imagePrincipale':
          result.imagePrincipale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categorie':
          result.categorie = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isUp':
          result.isUp = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isVisible':
          result.isVisible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'bouton1':
          result.bouton1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ArticlesRecord extends ArticlesRecord {
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? userCreate;
  @override
  final String? titre;
  @override
  final String? imagePrincipale;
  @override
  final String? categorie;
  @override
  final String? description;
  @override
  final bool? isUp;
  @override
  final bool? isVisible;
  @override
  final String? bouton1;
  @override
  final DocumentReference<Object?>? reference;

  factory _$ArticlesRecord([void Function(ArticlesRecordBuilder)? updates]) =>
      (new ArticlesRecordBuilder()..update(updates))._build();

  _$ArticlesRecord._(
      {this.createTime,
      this.userCreate,
      this.titre,
      this.imagePrincipale,
      this.categorie,
      this.description,
      this.isUp,
      this.isVisible,
      this.bouton1,
      this.reference})
      : super._();

  @override
  ArticlesRecord rebuild(void Function(ArticlesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticlesRecordBuilder toBuilder() =>
      new ArticlesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArticlesRecord &&
        createTime == other.createTime &&
        userCreate == other.userCreate &&
        titre == other.titre &&
        imagePrincipale == other.imagePrincipale &&
        categorie == other.categorie &&
        description == other.description &&
        isUp == other.isUp &&
        isVisible == other.isVisible &&
        bouton1 == other.bouton1 &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, userCreate.hashCode);
    _$hash = $jc(_$hash, titre.hashCode);
    _$hash = $jc(_$hash, imagePrincipale.hashCode);
    _$hash = $jc(_$hash, categorie.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isUp.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jc(_$hash, bouton1.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArticlesRecord')
          ..add('createTime', createTime)
          ..add('userCreate', userCreate)
          ..add('titre', titre)
          ..add('imagePrincipale', imagePrincipale)
          ..add('categorie', categorie)
          ..add('description', description)
          ..add('isUp', isUp)
          ..add('isVisible', isVisible)
          ..add('bouton1', bouton1)
          ..add('reference', reference))
        .toString();
  }
}

class ArticlesRecordBuilder
    implements Builder<ArticlesRecord, ArticlesRecordBuilder> {
  _$ArticlesRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _userCreate;
  DocumentReference<Object?>? get userCreate => _$this._userCreate;
  set userCreate(DocumentReference<Object?>? userCreate) =>
      _$this._userCreate = userCreate;

  String? _titre;
  String? get titre => _$this._titre;
  set titre(String? titre) => _$this._titre = titre;

  String? _imagePrincipale;
  String? get imagePrincipale => _$this._imagePrincipale;
  set imagePrincipale(String? imagePrincipale) =>
      _$this._imagePrincipale = imagePrincipale;

  String? _categorie;
  String? get categorie => _$this._categorie;
  set categorie(String? categorie) => _$this._categorie = categorie;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isUp;
  bool? get isUp => _$this._isUp;
  set isUp(bool? isUp) => _$this._isUp = isUp;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  String? _bouton1;
  String? get bouton1 => _$this._bouton1;
  set bouton1(String? bouton1) => _$this._bouton1 = bouton1;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  ArticlesRecordBuilder() {
    ArticlesRecord._initializeBuilder(this);
  }

  ArticlesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _userCreate = $v.userCreate;
      _titre = $v.titre;
      _imagePrincipale = $v.imagePrincipale;
      _categorie = $v.categorie;
      _description = $v.description;
      _isUp = $v.isUp;
      _isVisible = $v.isVisible;
      _bouton1 = $v.bouton1;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArticlesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArticlesRecord;
  }

  @override
  void update(void Function(ArticlesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArticlesRecord build() => _build();

  _$ArticlesRecord _build() {
    final _$result = _$v ??
        new _$ArticlesRecord._(
            createTime: createTime,
            userCreate: userCreate,
            titre: titre,
            imagePrincipale: imagePrincipale,
            categorie: categorie,
            description: description,
            isUp: isUp,
            isVisible: isVisible,
            bouton1: bouton1,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
