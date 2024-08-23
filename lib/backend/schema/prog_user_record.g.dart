// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prog_user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProgUserRecord> _$progUserRecordSerializer =
    new _$ProgUserRecordSerializer();

class _$ProgUserRecordSerializer
    implements StructuredSerializer<ProgUserRecord> {
  @override
  final Iterable<Type> types = const [ProgUserRecord, _$ProgUserRecord];
  @override
  final String wireName = 'ProgUserRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProgUserRecord object,
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
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.semaineShow;
    if (value != null) {
      result
        ..add('semaineShow')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.numberDay;
    if (value != null) {
      result
        ..add('numberDay')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ProgUserRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProgUserRecordBuilder();

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
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'semaineShow':
          result.semaineShow = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'numberDay':
          result.numberDay = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ProgUserRecord extends ProgUserRecord {
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? progRef;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? semaineShow;
  @override
  final int? numberDay;
  @override
  final DocumentReference<Object?>? reference;

  factory _$ProgUserRecord([void Function(ProgUserRecordBuilder)? updates]) =>
      (new ProgUserRecordBuilder()..update(updates))._build();

  _$ProgUserRecord._(
      {this.createTime,
      this.progRef,
      this.userRef,
      this.semaineShow,
      this.numberDay,
      this.reference})
      : super._();

  @override
  ProgUserRecord rebuild(void Function(ProgUserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProgUserRecordBuilder toBuilder() =>
      new ProgUserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProgUserRecord &&
        createTime == other.createTime &&
        progRef == other.progRef &&
        userRef == other.userRef &&
        semaineShow == other.semaineShow &&
        numberDay == other.numberDay &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, progRef.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, semaineShow.hashCode);
    _$hash = $jc(_$hash, numberDay.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProgUserRecord')
          ..add('createTime', createTime)
          ..add('progRef', progRef)
          ..add('userRef', userRef)
          ..add('semaineShow', semaineShow)
          ..add('numberDay', numberDay)
          ..add('reference', reference))
        .toString();
  }
}

class ProgUserRecordBuilder
    implements Builder<ProgUserRecord, ProgUserRecordBuilder> {
  _$ProgUserRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _progRef;
  DocumentReference<Object?>? get progRef => _$this._progRef;
  set progRef(DocumentReference<Object?>? progRef) => _$this._progRef = progRef;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _semaineShow;
  DocumentReference<Object?>? get semaineShow => _$this._semaineShow;
  set semaineShow(DocumentReference<Object?>? semaineShow) =>
      _$this._semaineShow = semaineShow;

  int? _numberDay;
  int? get numberDay => _$this._numberDay;
  set numberDay(int? numberDay) => _$this._numberDay = numberDay;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  ProgUserRecordBuilder() {
    ProgUserRecord._initializeBuilder(this);
  }

  ProgUserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _progRef = $v.progRef;
      _userRef = $v.userRef;
      _semaineShow = $v.semaineShow;
      _numberDay = $v.numberDay;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProgUserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProgUserRecord;
  }

  @override
  void update(void Function(ProgUserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProgUserRecord build() => _build();

  _$ProgUserRecord _build() {
    final _$result = _$v ??
        new _$ProgUserRecord._(
            createTime: createTime,
            progRef: progRef,
            userRef: userRef,
            semaineShow: semaineShow,
            numberDay: numberDay,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
