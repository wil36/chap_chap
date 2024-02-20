// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recettes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecettesRecord> _$recettesRecordSerializer =
    new _$RecettesRecordSerializer();

class _$RecettesRecordSerializer
    implements StructuredSerializer<RecettesRecord> {
  @override
  final Iterable<Type> types = const [RecettesRecord, _$RecettesRecord];
  @override
  final String wireName = 'RecettesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecettesRecord object,
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
    value = object.photoPrincipale;
    if (value != null) {
      result
        ..add('photoPrincipale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.niveauDifficulte;
    if (value != null) {
      result
        ..add('niveauDifficulte')
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
    value = object.lien;
    if (value != null) {
      result
        ..add('lien')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.listeIngredients;
    if (value != null) {
      result
        ..add('listeIngredients')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shampoing;
    if (value != null) {
      result
        ..add('shampoing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.masqueHydratant;
    if (value != null) {
      result
        ..add('masqueHydratant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.masqueProteine;
    if (value != null) {
      result
        ..add('masqueProteine')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.masqueNourissant;
    if (value != null) {
      result
        ..add('masqueNourissant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.gel;
    if (value != null) {
      result
        ..add('gel')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.leaveIn;
    if (value != null) {
      result
        ..add('leaveIn')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.free;
    if (value != null) {
      result
        ..add('free')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sprayLotion;
    if (value != null) {
      result
        ..add('sprayLotion')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.eauRincage;
    if (value != null) {
      result
        ..add('eauRincage')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.gommage;
    if (value != null) {
      result
        ..add('Gommage')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.etapes;
    if (value != null) {
      result
        ..add('etapes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nbIngredients;
    if (value != null) {
      result
        ..add('nbIngredients')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dureePrepa;
    if (value != null) {
      result
        ..add('dureePrepa')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.hided;
    if (value != null) {
      result
        ..add('hided')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  RecettesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecettesRecordBuilder();

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
        case 'photoPrincipale':
          result.photoPrincipale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'niveauDifficulte':
          result.niveauDifficulte = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'titre':
          result.titre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lien':
          result.lien = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'listeIngredients':
          result.listeIngredients = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shampoing':
          result.shampoing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'masqueHydratant':
          result.masqueHydratant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'masqueProteine':
          result.masqueProteine = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'masqueNourissant':
          result.masqueNourissant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'gel':
          result.gel = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'leaveIn':
          result.leaveIn = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'free':
          result.free = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sprayLotion':
          result.sprayLotion = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'eauRincage':
          result.eauRincage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Gommage':
          result.gommage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'etapes':
          result.etapes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nbIngredients':
          result.nbIngredients = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'dureePrepa':
          result.dureePrepa = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isUp':
          result.isUp = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hided':
          result.hided = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$RecettesRecord extends RecettesRecord {
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? userCreate;
  @override
  final String? photoPrincipale;
  @override
  final String? niveauDifficulte;
  @override
  final String? titre;
  @override
  final String? lien;
  @override
  final String? listeIngredients;
  @override
  final bool? shampoing;
  @override
  final bool? masqueHydratant;
  @override
  final bool? masqueProteine;
  @override
  final bool? masqueNourissant;
  @override
  final bool? gel;
  @override
  final bool? leaveIn;
  @override
  final bool? free;
  @override
  final bool? sprayLotion;
  @override
  final bool? eauRincage;
  @override
  final bool? gommage;
  @override
  final String? etapes;
  @override
  final int? nbIngredients;
  @override
  final int? dureePrepa;
  @override
  final String? description;
  @override
  final bool? isUp;
  @override
  final bool? hided;
  @override
  final DocumentReference<Object?>? reference;

  factory _$RecettesRecord([void Function(RecettesRecordBuilder)? updates]) =>
      (new RecettesRecordBuilder()..update(updates))._build();

  _$RecettesRecord._(
      {this.createTime,
      this.userCreate,
      this.photoPrincipale,
      this.niveauDifficulte,
      this.titre,
      this.lien,
      this.listeIngredients,
      this.shampoing,
      this.masqueHydratant,
      this.masqueProteine,
      this.masqueNourissant,
      this.gel,
      this.leaveIn,
      this.free,
      this.sprayLotion,
      this.eauRincage,
      this.gommage,
      this.etapes,
      this.nbIngredients,
      this.dureePrepa,
      this.description,
      this.isUp,
      this.hided,
      this.reference})
      : super._();

  @override
  RecettesRecord rebuild(void Function(RecettesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecettesRecordBuilder toBuilder() =>
      new RecettesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecettesRecord &&
        createTime == other.createTime &&
        userCreate == other.userCreate &&
        photoPrincipale == other.photoPrincipale &&
        niveauDifficulte == other.niveauDifficulte &&
        titre == other.titre &&
        lien == other.lien &&
        listeIngredients == other.listeIngredients &&
        shampoing == other.shampoing &&
        masqueHydratant == other.masqueHydratant &&
        masqueProteine == other.masqueProteine &&
        masqueNourissant == other.masqueNourissant &&
        gel == other.gel &&
        leaveIn == other.leaveIn &&
        free == other.free &&
        sprayLotion == other.sprayLotion &&
        eauRincage == other.eauRincage &&
        gommage == other.gommage &&
        etapes == other.etapes &&
        nbIngredients == other.nbIngredients &&
        dureePrepa == other.dureePrepa &&
        description == other.description &&
        isUp == other.isUp &&
        hided == other.hided &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, userCreate.hashCode);
    _$hash = $jc(_$hash, photoPrincipale.hashCode);
    _$hash = $jc(_$hash, niveauDifficulte.hashCode);
    _$hash = $jc(_$hash, titre.hashCode);
    _$hash = $jc(_$hash, lien.hashCode);
    _$hash = $jc(_$hash, listeIngredients.hashCode);
    _$hash = $jc(_$hash, shampoing.hashCode);
    _$hash = $jc(_$hash, masqueHydratant.hashCode);
    _$hash = $jc(_$hash, masqueProteine.hashCode);
    _$hash = $jc(_$hash, masqueNourissant.hashCode);
    _$hash = $jc(_$hash, gel.hashCode);
    _$hash = $jc(_$hash, leaveIn.hashCode);
    _$hash = $jc(_$hash, free.hashCode);
    _$hash = $jc(_$hash, sprayLotion.hashCode);
    _$hash = $jc(_$hash, eauRincage.hashCode);
    _$hash = $jc(_$hash, gommage.hashCode);
    _$hash = $jc(_$hash, etapes.hashCode);
    _$hash = $jc(_$hash, nbIngredients.hashCode);
    _$hash = $jc(_$hash, dureePrepa.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isUp.hashCode);
    _$hash = $jc(_$hash, hided.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecettesRecord')
          ..add('createTime', createTime)
          ..add('userCreate', userCreate)
          ..add('photoPrincipale', photoPrincipale)
          ..add('niveauDifficulte', niveauDifficulte)
          ..add('titre', titre)
          ..add('lien', lien)
          ..add('listeIngredients', listeIngredients)
          ..add('shampoing', shampoing)
          ..add('masqueHydratant', masqueHydratant)
          ..add('masqueProteine', masqueProteine)
          ..add('masqueNourissant', masqueNourissant)
          ..add('gel', gel)
          ..add('leaveIn', leaveIn)
          ..add('free', free)
          ..add('sprayLotion', sprayLotion)
          ..add('eauRincage', eauRincage)
          ..add('gommage', gommage)
          ..add('etapes', etapes)
          ..add('nbIngredients', nbIngredients)
          ..add('dureePrepa', dureePrepa)
          ..add('description', description)
          ..add('isUp', isUp)
          ..add('hided', hided)
          ..add('reference', reference))
        .toString();
  }
}

class RecettesRecordBuilder
    implements Builder<RecettesRecord, RecettesRecordBuilder> {
  _$RecettesRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _userCreate;
  DocumentReference<Object?>? get userCreate => _$this._userCreate;
  set userCreate(DocumentReference<Object?>? userCreate) =>
      _$this._userCreate = userCreate;

  String? _photoPrincipale;
  String? get photoPrincipale => _$this._photoPrincipale;
  set photoPrincipale(String? photoPrincipale) =>
      _$this._photoPrincipale = photoPrincipale;

  String? _niveauDifficulte;
  String? get niveauDifficulte => _$this._niveauDifficulte;
  set niveauDifficulte(String? niveauDifficulte) =>
      _$this._niveauDifficulte = niveauDifficulte;

  String? _titre;
  String? get titre => _$this._titre;
  set titre(String? titre) => _$this._titre = titre;

  String? _lien;
  String? get lien => _$this._lien;
  set lien(String? lien) => _$this._lien = lien;

  String? _listeIngredients;
  String? get listeIngredients => _$this._listeIngredients;
  set listeIngredients(String? listeIngredients) =>
      _$this._listeIngredients = listeIngredients;

  bool? _shampoing;
  bool? get shampoing => _$this._shampoing;
  set shampoing(bool? shampoing) => _$this._shampoing = shampoing;

  bool? _masqueHydratant;
  bool? get masqueHydratant => _$this._masqueHydratant;
  set masqueHydratant(bool? masqueHydratant) =>
      _$this._masqueHydratant = masqueHydratant;

  bool? _masqueProteine;
  bool? get masqueProteine => _$this._masqueProteine;
  set masqueProteine(bool? masqueProteine) =>
      _$this._masqueProteine = masqueProteine;

  bool? _masqueNourissant;
  bool? get masqueNourissant => _$this._masqueNourissant;
  set masqueNourissant(bool? masqueNourissant) =>
      _$this._masqueNourissant = masqueNourissant;

  bool? _gel;
  bool? get gel => _$this._gel;
  set gel(bool? gel) => _$this._gel = gel;

  bool? _leaveIn;
  bool? get leaveIn => _$this._leaveIn;
  set leaveIn(bool? leaveIn) => _$this._leaveIn = leaveIn;

  bool? _free;
  bool? get free => _$this._free;
  set free(bool? free) => _$this._free = free;

  bool? _sprayLotion;
  bool? get sprayLotion => _$this._sprayLotion;
  set sprayLotion(bool? sprayLotion) => _$this._sprayLotion = sprayLotion;

  bool? _eauRincage;
  bool? get eauRincage => _$this._eauRincage;
  set eauRincage(bool? eauRincage) => _$this._eauRincage = eauRincage;

  bool? _gommage;
  bool? get gommage => _$this._gommage;
  set gommage(bool? gommage) => _$this._gommage = gommage;

  String? _etapes;
  String? get etapes => _$this._etapes;
  set etapes(String? etapes) => _$this._etapes = etapes;

  int? _nbIngredients;
  int? get nbIngredients => _$this._nbIngredients;
  set nbIngredients(int? nbIngredients) =>
      _$this._nbIngredients = nbIngredients;

  int? _dureePrepa;
  int? get dureePrepa => _$this._dureePrepa;
  set dureePrepa(int? dureePrepa) => _$this._dureePrepa = dureePrepa;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isUp;
  bool? get isUp => _$this._isUp;
  set isUp(bool? isUp) => _$this._isUp = isUp;

  bool? _hided;
  bool? get hided => _$this._hided;
  set hided(bool? hided) => _$this._hided = hided;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  RecettesRecordBuilder() {
    RecettesRecord._initializeBuilder(this);
  }

  RecettesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _userCreate = $v.userCreate;
      _photoPrincipale = $v.photoPrincipale;
      _niveauDifficulte = $v.niveauDifficulte;
      _titre = $v.titre;
      _lien = $v.lien;
      _listeIngredients = $v.listeIngredients;
      _shampoing = $v.shampoing;
      _masqueHydratant = $v.masqueHydratant;
      _masqueProteine = $v.masqueProteine;
      _masqueNourissant = $v.masqueNourissant;
      _gel = $v.gel;
      _leaveIn = $v.leaveIn;
      _free = $v.free;
      _sprayLotion = $v.sprayLotion;
      _eauRincage = $v.eauRincage;
      _gommage = $v.gommage;
      _etapes = $v.etapes;
      _nbIngredients = $v.nbIngredients;
      _dureePrepa = $v.dureePrepa;
      _description = $v.description;
      _isUp = $v.isUp;
      _hided = $v.hided;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecettesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecettesRecord;
  }

  @override
  void update(void Function(RecettesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecettesRecord build() => _build();

  _$RecettesRecord _build() {
    final _$result = _$v ??
        new _$RecettesRecord._(
            createTime: createTime,
            userCreate: userCreate,
            photoPrincipale: photoPrincipale,
            niveauDifficulte: niveauDifficulte,
            titre: titre,
            lien: lien,
            listeIngredients: listeIngredients,
            shampoing: shampoing,
            masqueHydratant: masqueHydratant,
            masqueProteine: masqueProteine,
            masqueNourissant: masqueNourissant,
            gel: gel,
            leaveIn: leaveIn,
            free: free,
            sprayLotion: sprayLotion,
            eauRincage: eauRincage,
            gommage: gommage,
            etapes: etapes,
            nbIngredients: nbIngredients,
            dureePrepa: dureePrepa,
            description: description,
            isUp: isUp,
            hided: hided,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
