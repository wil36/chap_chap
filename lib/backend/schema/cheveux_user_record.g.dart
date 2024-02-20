// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheveux_user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CheveuxUserRecord> _$cheveuxUserRecordSerializer =
    new _$CheveuxUserRecordSerializer();

class _$CheveuxUserRecordSerializer
    implements StructuredSerializer<CheveuxUserRecord> {
  @override
  final Iterable<Type> types = const [CheveuxUserRecord, _$CheveuxUserRecord];
  @override
  final String wireName = 'CheveuxUserRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CheveuxUserRecord object,
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
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.styleCheveux;
    if (value != null) {
      result
        ..add('styleCheveux')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cuirCheveulu;
    if (value != null) {
      result
        ..add('cuirCheveulu')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.perteCheveux;
    if (value != null) {
      result
        ..add('perteCheveux')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pellicules;
    if (value != null) {
      result
        ..add('pellicules')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.routineCapillaire;
    if (value != null) {
      result
        ..add('routineCapillaire')
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
  CheveuxUserRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheveuxUserRecordBuilder();

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
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'styleCheveux':
          result.styleCheveux = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cuirCheveulu':
          result.cuirCheveulu = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'perteCheveux':
          result.perteCheveux = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pellicules':
          result.pellicules = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'routineCapillaire':
          result.routineCapillaire = serializers.deserialize(value,
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

class _$CheveuxUserRecord extends CheveuxUserRecord {
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final int? styleCheveux;
  @override
  final int? cuirCheveulu;
  @override
  final int? perteCheveux;
  @override
  final int? pellicules;
  @override
  final int? routineCapillaire;
  @override
  final DocumentReference<Object?>? reference;

  factory _$CheveuxUserRecord(
          [void Function(CheveuxUserRecordBuilder)? updates]) =>
      (new CheveuxUserRecordBuilder()..update(updates))._build();

  _$CheveuxUserRecord._(
      {this.createTime,
      this.userRef,
      this.styleCheveux,
      this.cuirCheveulu,
      this.perteCheveux,
      this.pellicules,
      this.routineCapillaire,
      this.reference})
      : super._();

  @override
  CheveuxUserRecord rebuild(void Function(CheveuxUserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheveuxUserRecordBuilder toBuilder() =>
      new CheveuxUserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheveuxUserRecord &&
        createTime == other.createTime &&
        userRef == other.userRef &&
        styleCheveux == other.styleCheveux &&
        cuirCheveulu == other.cuirCheveulu &&
        perteCheveux == other.perteCheveux &&
        pellicules == other.pellicules &&
        routineCapillaire == other.routineCapillaire &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, styleCheveux.hashCode);
    _$hash = $jc(_$hash, cuirCheveulu.hashCode);
    _$hash = $jc(_$hash, perteCheveux.hashCode);
    _$hash = $jc(_$hash, pellicules.hashCode);
    _$hash = $jc(_$hash, routineCapillaire.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheveuxUserRecord')
          ..add('createTime', createTime)
          ..add('userRef', userRef)
          ..add('styleCheveux', styleCheveux)
          ..add('cuirCheveulu', cuirCheveulu)
          ..add('perteCheveux', perteCheveux)
          ..add('pellicules', pellicules)
          ..add('routineCapillaire', routineCapillaire)
          ..add('reference', reference))
        .toString();
  }
}

class CheveuxUserRecordBuilder
    implements Builder<CheveuxUserRecord, CheveuxUserRecordBuilder> {
  _$CheveuxUserRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  int? _styleCheveux;
  int? get styleCheveux => _$this._styleCheveux;
  set styleCheveux(int? styleCheveux) => _$this._styleCheveux = styleCheveux;

  int? _cuirCheveulu;
  int? get cuirCheveulu => _$this._cuirCheveulu;
  set cuirCheveulu(int? cuirCheveulu) => _$this._cuirCheveulu = cuirCheveulu;

  int? _perteCheveux;
  int? get perteCheveux => _$this._perteCheveux;
  set perteCheveux(int? perteCheveux) => _$this._perteCheveux = perteCheveux;

  int? _pellicules;
  int? get pellicules => _$this._pellicules;
  set pellicules(int? pellicules) => _$this._pellicules = pellicules;

  int? _routineCapillaire;
  int? get routineCapillaire => _$this._routineCapillaire;
  set routineCapillaire(int? routineCapillaire) =>
      _$this._routineCapillaire = routineCapillaire;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  CheveuxUserRecordBuilder() {
    CheveuxUserRecord._initializeBuilder(this);
  }

  CheveuxUserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _userRef = $v.userRef;
      _styleCheveux = $v.styleCheveux;
      _cuirCheveulu = $v.cuirCheveulu;
      _perteCheveux = $v.perteCheveux;
      _pellicules = $v.pellicules;
      _routineCapillaire = $v.routineCapillaire;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheveuxUserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheveuxUserRecord;
  }

  @override
  void update(void Function(CheveuxUserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheveuxUserRecord build() => _build();

  _$CheveuxUserRecord _build() {
    final _$result = _$v ??
        new _$CheveuxUserRecord._(
            createTime: createTime,
            userRef: userRef,
            styleCheveux: styleCheveux,
            cuirCheveulu: cuirCheveulu,
            perteCheveux: perteCheveux,
            pellicules: pellicules,
            routineCapillaire: routineCapillaire,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
