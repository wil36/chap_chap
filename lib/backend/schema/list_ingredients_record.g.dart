// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ingredients_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListIngredientsRecord> _$listIngredientsRecordSerializer =
    new _$ListIngredientsRecordSerializer();

class _$ListIngredientsRecordSerializer
    implements StructuredSerializer<ListIngredientsRecord> {
  @override
  final Iterable<Type> types = const [
    ListIngredientsRecord,
    _$ListIngredientsRecord
  ];
  @override
  final String wireName = 'ListIngredientsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ListIngredientsRecord object,
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
    value = object.poudresAroma;
    if (value != null) {
      result
        ..add('poudresAroma')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.huilesAroma;
    if (value != null) {
      result
        ..add('huilesAroma')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.poudresBaB;
    if (value != null) {
      result
        ..add('poudresBaB')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.huilesBaB;
    if (value != null) {
      result
        ..add('huilesBaB')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.divers;
    if (value != null) {
      result
        ..add('divers')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.titre;
    if (value != null) {
      result
        ..add('titre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienExterne;
    if (value != null) {
      result
        ..add('lienExterne')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.progRef;
    if (value != null) {
      result
        ..add('progRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ListIngredientsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListIngredientsRecordBuilder();

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
        case 'poudresAroma':
          result.poudresAroma = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'huilesAroma':
          result.huilesAroma = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'poudresBaB':
          result.poudresBaB = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'huilesBaB':
          result.huilesBaB = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'divers':
          result.divers = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'titre':
          result.titre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienExterne':
          result.lienExterne = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'progRef':
          result.progRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ListIngredientsRecord extends ListIngredientsRecord {
  @override
  final DateTime? createTime;
  @override
  final bool? poudresAroma;
  @override
  final bool? huilesAroma;
  @override
  final bool? poudresBaB;
  @override
  final bool? huilesBaB;
  @override
  final bool? divers;
  @override
  final String? image;
  @override
  final String? titre;
  @override
  final String? lienExterne;
  @override
  final DocumentReference<Object?>? progRef;
  @override
  final DocumentReference<Object?>? reference;

  factory _$ListIngredientsRecord(
          [void Function(ListIngredientsRecordBuilder)? updates]) =>
      (new ListIngredientsRecordBuilder()..update(updates))._build();

  _$ListIngredientsRecord._(
      {this.createTime,
      this.poudresAroma,
      this.huilesAroma,
      this.poudresBaB,
      this.huilesBaB,
      this.divers,
      this.image,
      this.titre,
      this.lienExterne,
      this.progRef,
      this.reference})
      : super._();

  @override
  ListIngredientsRecord rebuild(
          void Function(ListIngredientsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListIngredientsRecordBuilder toBuilder() =>
      new ListIngredientsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListIngredientsRecord &&
        createTime == other.createTime &&
        poudresAroma == other.poudresAroma &&
        huilesAroma == other.huilesAroma &&
        poudresBaB == other.poudresBaB &&
        huilesBaB == other.huilesBaB &&
        divers == other.divers &&
        image == other.image &&
        titre == other.titre &&
        lienExterne == other.lienExterne &&
        progRef == other.progRef &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, poudresAroma.hashCode);
    _$hash = $jc(_$hash, huilesAroma.hashCode);
    _$hash = $jc(_$hash, poudresBaB.hashCode);
    _$hash = $jc(_$hash, huilesBaB.hashCode);
    _$hash = $jc(_$hash, divers.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, titre.hashCode);
    _$hash = $jc(_$hash, lienExterne.hashCode);
    _$hash = $jc(_$hash, progRef.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListIngredientsRecord')
          ..add('createTime', createTime)
          ..add('poudresAroma', poudresAroma)
          ..add('huilesAroma', huilesAroma)
          ..add('poudresBaB', poudresBaB)
          ..add('huilesBaB', huilesBaB)
          ..add('divers', divers)
          ..add('image', image)
          ..add('titre', titre)
          ..add('lienExterne', lienExterne)
          ..add('progRef', progRef)
          ..add('reference', reference))
        .toString();
  }
}

class ListIngredientsRecordBuilder
    implements Builder<ListIngredientsRecord, ListIngredientsRecordBuilder> {
  _$ListIngredientsRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  bool? _poudresAroma;
  bool? get poudresAroma => _$this._poudresAroma;
  set poudresAroma(bool? poudresAroma) => _$this._poudresAroma = poudresAroma;

  bool? _huilesAroma;
  bool? get huilesAroma => _$this._huilesAroma;
  set huilesAroma(bool? huilesAroma) => _$this._huilesAroma = huilesAroma;

  bool? _poudresBaB;
  bool? get poudresBaB => _$this._poudresBaB;
  set poudresBaB(bool? poudresBaB) => _$this._poudresBaB = poudresBaB;

  bool? _huilesBaB;
  bool? get huilesBaB => _$this._huilesBaB;
  set huilesBaB(bool? huilesBaB) => _$this._huilesBaB = huilesBaB;

  bool? _divers;
  bool? get divers => _$this._divers;
  set divers(bool? divers) => _$this._divers = divers;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _titre;
  String? get titre => _$this._titre;
  set titre(String? titre) => _$this._titre = titre;

  String? _lienExterne;
  String? get lienExterne => _$this._lienExterne;
  set lienExterne(String? lienExterne) => _$this._lienExterne = lienExterne;

  DocumentReference<Object?>? _progRef;
  DocumentReference<Object?>? get progRef => _$this._progRef;
  set progRef(DocumentReference<Object?>? progRef) => _$this._progRef = progRef;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  ListIngredientsRecordBuilder() {
    ListIngredientsRecord._initializeBuilder(this);
  }

  ListIngredientsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _poudresAroma = $v.poudresAroma;
      _huilesAroma = $v.huilesAroma;
      _poudresBaB = $v.poudresBaB;
      _huilesBaB = $v.huilesBaB;
      _divers = $v.divers;
      _image = $v.image;
      _titre = $v.titre;
      _lienExterne = $v.lienExterne;
      _progRef = $v.progRef;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListIngredientsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListIngredientsRecord;
  }

  @override
  void update(void Function(ListIngredientsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListIngredientsRecord build() => _build();

  _$ListIngredientsRecord _build() {
    final _$result = _$v ??
        new _$ListIngredientsRecord._(
            createTime: createTime,
            poudresAroma: poudresAroma,
            huilesAroma: huilesAroma,
            poudresBaB: poudresBaB,
            huilesBaB: huilesBaB,
            divers: divers,
            image: image,
            titre: titre,
            lienExterne: lienExterne,
            progRef: progRef,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
