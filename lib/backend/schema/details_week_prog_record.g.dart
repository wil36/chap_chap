// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_week_prog_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DetailsWeekProgRecord> _$detailsWeekProgRecordSerializer =
    new _$DetailsWeekProgRecordSerializer();

class _$DetailsWeekProgRecordSerializer
    implements StructuredSerializer<DetailsWeekProgRecord> {
  @override
  final Iterable<Type> types = const [
    DetailsWeekProgRecord,
    _$DetailsWeekProgRecord
  ];
  @override
  final String wireName = 'DetailsWeekProgRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DetailsWeekProgRecord object,
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
    value = object.progRef;
    if (value != null) {
      result
        ..add('progRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.semaineNumero;
    if (value != null) {
      result
        ..add('semaineNumero')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.recette1;
    if (value != null) {
      result
        ..add('recette1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.recette2;
    if (value != null) {
      result
        ..add('recette2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.recette3;
    if (value != null) {
      result
        ..add('recette3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.texte1;
    if (value != null) {
      result
        ..add('texte1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.texte2;
    if (value != null) {
      result
        ..add('texte2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.titreEtape1;
    if (value != null) {
      result
        ..add('titreEtape1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.titreEtape2;
    if (value != null) {
      result
        ..add('titreEtape2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.titreEtape3;
    if (value != null) {
      result
        ..add('titreEtape3')
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
  DetailsWeekProgRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DetailsWeekProgRecordBuilder();

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
        case 'progRef':
          result.progRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'semaineNumero':
          result.semaineNumero = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'recette1':
          result.recette1 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'recette2':
          result.recette2 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'recette3':
          result.recette3 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'texte1':
          result.texte1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'texte2':
          result.texte2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'titreEtape1':
          result.titreEtape1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'titreEtape2':
          result.titreEtape2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'titreEtape3':
          result.titreEtape3 = serializers.deserialize(value,
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

class _$DetailsWeekProgRecord extends DetailsWeekProgRecord {
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? progRef;
  @override
  final int? semaineNumero;
  @override
  final DocumentReference<Object?>? recette1;
  @override
  final DocumentReference<Object?>? recette2;
  @override
  final DocumentReference<Object?>? recette3;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? texte1;
  @override
  final String? texte2;
  @override
  final String? titreEtape1;
  @override
  final String? titreEtape2;
  @override
  final String? titreEtape3;
  @override
  final DocumentReference<Object?>? reference;

  factory _$DetailsWeekProgRecord(
          [void Function(DetailsWeekProgRecordBuilder)? updates]) =>
      (new DetailsWeekProgRecordBuilder()..update(updates))._build();

  _$DetailsWeekProgRecord._(
      {this.createTime,
      this.progRef,
      this.semaineNumero,
      this.recette1,
      this.recette2,
      this.recette3,
      this.userRef,
      this.texte1,
      this.texte2,
      this.titreEtape1,
      this.titreEtape2,
      this.titreEtape3,
      this.reference})
      : super._();

  @override
  DetailsWeekProgRecord rebuild(
          void Function(DetailsWeekProgRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailsWeekProgRecordBuilder toBuilder() =>
      new DetailsWeekProgRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailsWeekProgRecord &&
        createTime == other.createTime &&
        progRef == other.progRef &&
        semaineNumero == other.semaineNumero &&
        recette1 == other.recette1 &&
        recette2 == other.recette2 &&
        recette3 == other.recette3 &&
        userRef == other.userRef &&
        texte1 == other.texte1 &&
        texte2 == other.texte2 &&
        titreEtape1 == other.titreEtape1 &&
        titreEtape2 == other.titreEtape2 &&
        titreEtape3 == other.titreEtape3 &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, progRef.hashCode);
    _$hash = $jc(_$hash, semaineNumero.hashCode);
    _$hash = $jc(_$hash, recette1.hashCode);
    _$hash = $jc(_$hash, recette2.hashCode);
    _$hash = $jc(_$hash, recette3.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, texte1.hashCode);
    _$hash = $jc(_$hash, texte2.hashCode);
    _$hash = $jc(_$hash, titreEtape1.hashCode);
    _$hash = $jc(_$hash, titreEtape2.hashCode);
    _$hash = $jc(_$hash, titreEtape3.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DetailsWeekProgRecord')
          ..add('createTime', createTime)
          ..add('progRef', progRef)
          ..add('semaineNumero', semaineNumero)
          ..add('recette1', recette1)
          ..add('recette2', recette2)
          ..add('recette3', recette3)
          ..add('userRef', userRef)
          ..add('texte1', texte1)
          ..add('texte2', texte2)
          ..add('titreEtape1', titreEtape1)
          ..add('titreEtape2', titreEtape2)
          ..add('titreEtape3', titreEtape3)
          ..add('reference', reference))
        .toString();
  }
}

class DetailsWeekProgRecordBuilder
    implements Builder<DetailsWeekProgRecord, DetailsWeekProgRecordBuilder> {
  _$DetailsWeekProgRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _progRef;
  DocumentReference<Object?>? get progRef => _$this._progRef;
  set progRef(DocumentReference<Object?>? progRef) => _$this._progRef = progRef;

  int? _semaineNumero;
  int? get semaineNumero => _$this._semaineNumero;
  set semaineNumero(int? semaineNumero) =>
      _$this._semaineNumero = semaineNumero;

  DocumentReference<Object?>? _recette1;
  DocumentReference<Object?>? get recette1 => _$this._recette1;
  set recette1(DocumentReference<Object?>? recette1) =>
      _$this._recette1 = recette1;

  DocumentReference<Object?>? _recette2;
  DocumentReference<Object?>? get recette2 => _$this._recette2;
  set recette2(DocumentReference<Object?>? recette2) =>
      _$this._recette2 = recette2;

  DocumentReference<Object?>? _recette3;
  DocumentReference<Object?>? get recette3 => _$this._recette3;
  set recette3(DocumentReference<Object?>? recette3) =>
      _$this._recette3 = recette3;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _texte1;
  String? get texte1 => _$this._texte1;
  set texte1(String? texte1) => _$this._texte1 = texte1;

  String? _texte2;
  String? get texte2 => _$this._texte2;
  set texte2(String? texte2) => _$this._texte2 = texte2;

  String? _titreEtape1;
  String? get titreEtape1 => _$this._titreEtape1;
  set titreEtape1(String? titreEtape1) => _$this._titreEtape1 = titreEtape1;

  String? _titreEtape2;
  String? get titreEtape2 => _$this._titreEtape2;
  set titreEtape2(String? titreEtape2) => _$this._titreEtape2 = titreEtape2;

  String? _titreEtape3;
  String? get titreEtape3 => _$this._titreEtape3;
  set titreEtape3(String? titreEtape3) => _$this._titreEtape3 = titreEtape3;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  DetailsWeekProgRecordBuilder() {
    DetailsWeekProgRecord._initializeBuilder(this);
  }

  DetailsWeekProgRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _progRef = $v.progRef;
      _semaineNumero = $v.semaineNumero;
      _recette1 = $v.recette1;
      _recette2 = $v.recette2;
      _recette3 = $v.recette3;
      _userRef = $v.userRef;
      _texte1 = $v.texte1;
      _texte2 = $v.texte2;
      _titreEtape1 = $v.titreEtape1;
      _titreEtape2 = $v.titreEtape2;
      _titreEtape3 = $v.titreEtape3;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailsWeekProgRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailsWeekProgRecord;
  }

  @override
  void update(void Function(DetailsWeekProgRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DetailsWeekProgRecord build() => _build();

  _$DetailsWeekProgRecord _build() {
    final _$result = _$v ??
        new _$DetailsWeekProgRecord._(
            createTime: createTime,
            progRef: progRef,
            semaineNumero: semaineNumero,
            recette1: recette1,
            recette2: recette2,
            recette3: recette3,
            userRef: userRef,
            texte1: texte1,
            texte2: texte2,
            titreEtape1: titreEtape1,
            titreEtape2: titreEtape2,
            titreEtape3: titreEtape3,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
