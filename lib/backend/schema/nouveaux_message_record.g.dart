// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nouveaux_message_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NouveauxMessageRecord> _$nouveauxMessageRecordSerializer =
    new _$NouveauxMessageRecordSerializer();

class _$NouveauxMessageRecordSerializer
    implements StructuredSerializer<NouveauxMessageRecord> {
  @override
  final Iterable<Type> types = const [
    NouveauxMessageRecord,
    _$NouveauxMessageRecord
  ];
  @override
  final String wireName = 'NouveauxMessageRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NouveauxMessageRecord object,
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
    value = object.nomPrenom;
    if (value != null) {
      result
        ..add('nomPrenom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
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
  NouveauxMessageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NouveauxMessageRecordBuilder();

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
        case 'nomPrenom':
          result.nomPrenom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
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

class _$NouveauxMessageRecord extends NouveauxMessageRecord {
  @override
  final DateTime? createTime;
  @override
  final String? nomPrenom;
  @override
  final String? email;
  @override
  final String? message;
  @override
  final DocumentReference<Object?>? reference;

  factory _$NouveauxMessageRecord(
          [void Function(NouveauxMessageRecordBuilder)? updates]) =>
      (new NouveauxMessageRecordBuilder()..update(updates))._build();

  _$NouveauxMessageRecord._(
      {this.createTime,
      this.nomPrenom,
      this.email,
      this.message,
      this.reference})
      : super._();

  @override
  NouveauxMessageRecord rebuild(
          void Function(NouveauxMessageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NouveauxMessageRecordBuilder toBuilder() =>
      new NouveauxMessageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NouveauxMessageRecord &&
        createTime == other.createTime &&
        nomPrenom == other.nomPrenom &&
        email == other.email &&
        message == other.message &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, nomPrenom.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NouveauxMessageRecord')
          ..add('createTime', createTime)
          ..add('nomPrenom', nomPrenom)
          ..add('email', email)
          ..add('message', message)
          ..add('reference', reference))
        .toString();
  }
}

class NouveauxMessageRecordBuilder
    implements Builder<NouveauxMessageRecord, NouveauxMessageRecordBuilder> {
  _$NouveauxMessageRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  String? _nomPrenom;
  String? get nomPrenom => _$this._nomPrenom;
  set nomPrenom(String? nomPrenom) => _$this._nomPrenom = nomPrenom;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  NouveauxMessageRecordBuilder() {
    NouveauxMessageRecord._initializeBuilder(this);
  }

  NouveauxMessageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _nomPrenom = $v.nomPrenom;
      _email = $v.email;
      _message = $v.message;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NouveauxMessageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NouveauxMessageRecord;
  }

  @override
  void update(void Function(NouveauxMessageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NouveauxMessageRecord build() => _build();

  _$NouveauxMessageRecord _build() {
    final _$result = _$v ??
        new _$NouveauxMessageRecord._(
            createTime: createTime,
            nomPrenom: nomPrenom,
            email: email,
            message: message,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
