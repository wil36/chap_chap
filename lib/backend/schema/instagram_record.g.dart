// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instagram_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InstagramRecord> _$instagramRecordSerializer =
    new _$InstagramRecordSerializer();

class _$InstagramRecordSerializer
    implements StructuredSerializer<InstagramRecord> {
  @override
  final Iterable<Type> types = const [InstagramRecord, _$InstagramRecord];
  @override
  final String wireName = 'InstagramRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, InstagramRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.photo1;
    if (value != null) {
      result
        ..add('photo1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo2;
    if (value != null) {
      result
        ..add('photo2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo3;
    if (value != null) {
      result
        ..add('photo3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo4;
    if (value != null) {
      result
        ..add('photo4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo5;
    if (value != null) {
      result
        ..add('photo5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo6;
    if (value != null) {
      result
        ..add('photo6')
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
  InstagramRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InstagramRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'photo1':
          result.photo1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo2':
          result.photo2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo3':
          result.photo3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo4':
          result.photo4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo5':
          result.photo5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo6':
          result.photo6 = serializers.deserialize(value,
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

class _$InstagramRecord extends InstagramRecord {
  @override
  final String? photo1;
  @override
  final String? photo2;
  @override
  final String? photo3;
  @override
  final String? photo4;
  @override
  final String? photo5;
  @override
  final String? photo6;
  @override
  final DocumentReference<Object?>? reference;

  factory _$InstagramRecord([void Function(InstagramRecordBuilder)? updates]) =>
      (new InstagramRecordBuilder()..update(updates))._build();

  _$InstagramRecord._(
      {this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.photo5,
      this.photo6,
      this.reference})
      : super._();

  @override
  InstagramRecord rebuild(void Function(InstagramRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InstagramRecordBuilder toBuilder() =>
      new InstagramRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InstagramRecord &&
        photo1 == other.photo1 &&
        photo2 == other.photo2 &&
        photo3 == other.photo3 &&
        photo4 == other.photo4 &&
        photo5 == other.photo5 &&
        photo6 == other.photo6 &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, photo1.hashCode);
    _$hash = $jc(_$hash, photo2.hashCode);
    _$hash = $jc(_$hash, photo3.hashCode);
    _$hash = $jc(_$hash, photo4.hashCode);
    _$hash = $jc(_$hash, photo5.hashCode);
    _$hash = $jc(_$hash, photo6.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InstagramRecord')
          ..add('photo1', photo1)
          ..add('photo2', photo2)
          ..add('photo3', photo3)
          ..add('photo4', photo4)
          ..add('photo5', photo5)
          ..add('photo6', photo6)
          ..add('reference', reference))
        .toString();
  }
}

class InstagramRecordBuilder
    implements Builder<InstagramRecord, InstagramRecordBuilder> {
  _$InstagramRecord? _$v;

  String? _photo1;
  String? get photo1 => _$this._photo1;
  set photo1(String? photo1) => _$this._photo1 = photo1;

  String? _photo2;
  String? get photo2 => _$this._photo2;
  set photo2(String? photo2) => _$this._photo2 = photo2;

  String? _photo3;
  String? get photo3 => _$this._photo3;
  set photo3(String? photo3) => _$this._photo3 = photo3;

  String? _photo4;
  String? get photo4 => _$this._photo4;
  set photo4(String? photo4) => _$this._photo4 = photo4;

  String? _photo5;
  String? get photo5 => _$this._photo5;
  set photo5(String? photo5) => _$this._photo5 = photo5;

  String? _photo6;
  String? get photo6 => _$this._photo6;
  set photo6(String? photo6) => _$this._photo6 = photo6;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  InstagramRecordBuilder() {
    InstagramRecord._initializeBuilder(this);
  }

  InstagramRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _photo1 = $v.photo1;
      _photo2 = $v.photo2;
      _photo3 = $v.photo3;
      _photo4 = $v.photo4;
      _photo5 = $v.photo5;
      _photo6 = $v.photo6;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InstagramRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InstagramRecord;
  }

  @override
  void update(void Function(InstagramRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InstagramRecord build() => _build();

  _$InstagramRecord _build() {
    final _$result = _$v ??
        new _$InstagramRecord._(
            photo1: photo1,
            photo2: photo2,
            photo3: photo3,
            photo4: photo4,
            photo5: photo5,
            photo6: photo6,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
