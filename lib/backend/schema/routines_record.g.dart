// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routines_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoutinesRecord> _$routinesRecordSerializer =
    new _$RoutinesRecordSerializer();

class _$RoutinesRecordSerializer
    implements StructuredSerializer<RoutinesRecord> {
  @override
  final Iterable<Type> types = const [RoutinesRecord, _$RoutinesRecord];
  @override
  final String wireName = 'RoutinesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RoutinesRecord object,
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
    value = object.soinNourissant;
    if (value != null) {
      result
        ..add('soinNourissant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shampoingClarifiant;
    if (value != null) {
      result
        ..add('ShampoingClarifiant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shampoingDoux;
    if (value != null) {
      result
        ..add('shampoingDoux')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.coWash;
    if (value != null) {
      result
        ..add('coWash')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.noPoo;
    if (value != null) {
      result
        ..add('noPoo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.apresShampoing;
    if (value != null) {
      result
        ..add('apresShampoing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.soinHydratant;
    if (value != null) {
      result
        ..add('soinHydratant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.soinProteine;
    if (value != null) {
      result
        ..add('soinProteine')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.autres;
    if (value != null) {
      result
        ..add('autres')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.autresDescription;
    if (value != null) {
      result
        ..add('autresDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recurrence;
    if (value != null) {
      result
        ..add('recurrence')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alerte;
    if (value != null) {
      result
        ..add('alerte')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.deBut;
    if (value != null) {
      result
        ..add('deBut')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  RoutinesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoutinesRecordBuilder();

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
        case 'soinNourissant':
          result.soinNourissant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ShampoingClarifiant':
          result.shampoingClarifiant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'shampoingDoux':
          result.shampoingDoux = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'coWash':
          result.coWash = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'noPoo':
          result.noPoo = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'apresShampoing':
          result.apresShampoing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'soinHydratant':
          result.soinHydratant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'soinProteine':
          result.soinProteine = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'autres':
          result.autres = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'autresDescription':
          result.autresDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recurrence':
          result.recurrence = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alerte':
          result.alerte = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
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
        case 'deBut':
          result.deBut = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$RoutinesRecord extends RoutinesRecord {
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final bool? soinNourissant;
  @override
  final bool? shampoingClarifiant;
  @override
  final bool? shampoingDoux;
  @override
  final bool? coWash;
  @override
  final bool? noPoo;
  @override
  final bool? apresShampoing;
  @override
  final bool? soinHydratant;
  @override
  final bool? soinProteine;
  @override
  final bool? autres;
  @override
  final String? autresDescription;
  @override
  final String? recurrence;
  @override
  final bool? alerte;
  @override
  final String? notes;
  @override
  final String? photo1;
  @override
  final String? photo2;
  @override
  final String? photo3;
  @override
  final String? photo4;
  @override
  final DateTime? deBut;
  @override
  final DocumentReference<Object?>? reference;

  factory _$RoutinesRecord([void Function(RoutinesRecordBuilder)? updates]) =>
      (new RoutinesRecordBuilder()..update(updates))._build();

  _$RoutinesRecord._(
      {this.createTime,
      this.userRef,
      this.soinNourissant,
      this.shampoingClarifiant,
      this.shampoingDoux,
      this.coWash,
      this.noPoo,
      this.apresShampoing,
      this.soinHydratant,
      this.soinProteine,
      this.autres,
      this.autresDescription,
      this.recurrence,
      this.alerte,
      this.notes,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.deBut,
      this.reference})
      : super._();

  @override
  RoutinesRecord rebuild(void Function(RoutinesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoutinesRecordBuilder toBuilder() =>
      new RoutinesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoutinesRecord &&
        createTime == other.createTime &&
        userRef == other.userRef &&
        soinNourissant == other.soinNourissant &&
        shampoingClarifiant == other.shampoingClarifiant &&
        shampoingDoux == other.shampoingDoux &&
        coWash == other.coWash &&
        noPoo == other.noPoo &&
        apresShampoing == other.apresShampoing &&
        soinHydratant == other.soinHydratant &&
        soinProteine == other.soinProteine &&
        autres == other.autres &&
        autresDescription == other.autresDescription &&
        recurrence == other.recurrence &&
        alerte == other.alerte &&
        notes == other.notes &&
        photo1 == other.photo1 &&
        photo2 == other.photo2 &&
        photo3 == other.photo3 &&
        photo4 == other.photo4 &&
        deBut == other.deBut &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, soinNourissant.hashCode);
    _$hash = $jc(_$hash, shampoingClarifiant.hashCode);
    _$hash = $jc(_$hash, shampoingDoux.hashCode);
    _$hash = $jc(_$hash, coWash.hashCode);
    _$hash = $jc(_$hash, noPoo.hashCode);
    _$hash = $jc(_$hash, apresShampoing.hashCode);
    _$hash = $jc(_$hash, soinHydratant.hashCode);
    _$hash = $jc(_$hash, soinProteine.hashCode);
    _$hash = $jc(_$hash, autres.hashCode);
    _$hash = $jc(_$hash, autresDescription.hashCode);
    _$hash = $jc(_$hash, recurrence.hashCode);
    _$hash = $jc(_$hash, alerte.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, photo1.hashCode);
    _$hash = $jc(_$hash, photo2.hashCode);
    _$hash = $jc(_$hash, photo3.hashCode);
    _$hash = $jc(_$hash, photo4.hashCode);
    _$hash = $jc(_$hash, deBut.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoutinesRecord')
          ..add('createTime', createTime)
          ..add('userRef', userRef)
          ..add('soinNourissant', soinNourissant)
          ..add('shampoingClarifiant', shampoingClarifiant)
          ..add('shampoingDoux', shampoingDoux)
          ..add('coWash', coWash)
          ..add('noPoo', noPoo)
          ..add('apresShampoing', apresShampoing)
          ..add('soinHydratant', soinHydratant)
          ..add('soinProteine', soinProteine)
          ..add('autres', autres)
          ..add('autresDescription', autresDescription)
          ..add('recurrence', recurrence)
          ..add('alerte', alerte)
          ..add('notes', notes)
          ..add('photo1', photo1)
          ..add('photo2', photo2)
          ..add('photo3', photo3)
          ..add('photo4', photo4)
          ..add('deBut', deBut)
          ..add('reference', reference))
        .toString();
  }
}

class RoutinesRecordBuilder
    implements Builder<RoutinesRecord, RoutinesRecordBuilder> {
  _$RoutinesRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  bool? _soinNourissant;
  bool? get soinNourissant => _$this._soinNourissant;
  set soinNourissant(bool? soinNourissant) =>
      _$this._soinNourissant = soinNourissant;

  bool? _shampoingClarifiant;
  bool? get shampoingClarifiant => _$this._shampoingClarifiant;
  set shampoingClarifiant(bool? shampoingClarifiant) =>
      _$this._shampoingClarifiant = shampoingClarifiant;

  bool? _shampoingDoux;
  bool? get shampoingDoux => _$this._shampoingDoux;
  set shampoingDoux(bool? shampoingDoux) =>
      _$this._shampoingDoux = shampoingDoux;

  bool? _coWash;
  bool? get coWash => _$this._coWash;
  set coWash(bool? coWash) => _$this._coWash = coWash;

  bool? _noPoo;
  bool? get noPoo => _$this._noPoo;
  set noPoo(bool? noPoo) => _$this._noPoo = noPoo;

  bool? _apresShampoing;
  bool? get apresShampoing => _$this._apresShampoing;
  set apresShampoing(bool? apresShampoing) =>
      _$this._apresShampoing = apresShampoing;

  bool? _soinHydratant;
  bool? get soinHydratant => _$this._soinHydratant;
  set soinHydratant(bool? soinHydratant) =>
      _$this._soinHydratant = soinHydratant;

  bool? _soinProteine;
  bool? get soinProteine => _$this._soinProteine;
  set soinProteine(bool? soinProteine) => _$this._soinProteine = soinProteine;

  bool? _autres;
  bool? get autres => _$this._autres;
  set autres(bool? autres) => _$this._autres = autres;

  String? _autresDescription;
  String? get autresDescription => _$this._autresDescription;
  set autresDescription(String? autresDescription) =>
      _$this._autresDescription = autresDescription;

  String? _recurrence;
  String? get recurrence => _$this._recurrence;
  set recurrence(String? recurrence) => _$this._recurrence = recurrence;

  bool? _alerte;
  bool? get alerte => _$this._alerte;
  set alerte(bool? alerte) => _$this._alerte = alerte;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

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

  DateTime? _deBut;
  DateTime? get deBut => _$this._deBut;
  set deBut(DateTime? deBut) => _$this._deBut = deBut;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  RoutinesRecordBuilder() {
    RoutinesRecord._initializeBuilder(this);
  }

  RoutinesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _userRef = $v.userRef;
      _soinNourissant = $v.soinNourissant;
      _shampoingClarifiant = $v.shampoingClarifiant;
      _shampoingDoux = $v.shampoingDoux;
      _coWash = $v.coWash;
      _noPoo = $v.noPoo;
      _apresShampoing = $v.apresShampoing;
      _soinHydratant = $v.soinHydratant;
      _soinProteine = $v.soinProteine;
      _autres = $v.autres;
      _autresDescription = $v.autresDescription;
      _recurrence = $v.recurrence;
      _alerte = $v.alerte;
      _notes = $v.notes;
      _photo1 = $v.photo1;
      _photo2 = $v.photo2;
      _photo3 = $v.photo3;
      _photo4 = $v.photo4;
      _deBut = $v.deBut;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoutinesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoutinesRecord;
  }

  @override
  void update(void Function(RoutinesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoutinesRecord build() => _build();

  _$RoutinesRecord _build() {
    final _$result = _$v ??
        new _$RoutinesRecord._(
            createTime: createTime,
            userRef: userRef,
            soinNourissant: soinNourissant,
            shampoingClarifiant: shampoingClarifiant,
            shampoingDoux: shampoingDoux,
            coWash: coWash,
            noPoo: noPoo,
            apresShampoing: apresShampoing,
            soinHydratant: soinHydratant,
            soinProteine: soinProteine,
            autres: autres,
            autresDescription: autresDescription,
            recurrence: recurrence,
            alerte: alerte,
            notes: notes,
            photo1: photo1,
            photo2: photo2,
            photo3: photo3,
            photo4: photo4,
            deBut: deBut,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
