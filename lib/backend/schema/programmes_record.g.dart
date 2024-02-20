// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programmes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProgrammesRecord> _$programmesRecordSerializer =
    new _$ProgrammesRecordSerializer();

class _$ProgrammesRecordSerializer
    implements StructuredSerializer<ProgrammesRecord> {
  @override
  final Iterable<Type> types = const [ProgrammesRecord, _$ProgrammesRecord];
  @override
  final String wireName = 'ProgrammesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProgrammesRecord object,
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
    value = object.imagePrincipale;
    if (value != null) {
      result
        ..add('imagePrincipale')
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
    value = object.sousTitre;
    if (value != null) {
      result
        ..add('sousTitre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duree;
    if (value != null) {
      result
        ..add('duree')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.addDuration;
    if (value != null) {
      result
        ..add('addDuration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.listeAvantages;
    if (value != null) {
      result
        ..add('listeAvantages')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.intro;
    if (value != null) {
      result
        ..add('intro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentPasse;
    if (value != null) {
      result
        ..add('commentPasse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienRecette1;
    if (value != null) {
      result
        ..add('lienRecette1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienRecette2;
    if (value != null) {
      result
        ..add('lienRecette2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienRecette3;
    if (value != null) {
      result
        ..add('lienRecette3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienRecette4;
    if (value != null) {
      result
        ..add('lienRecette4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienRecette5;
    if (value != null) {
      result
        ..add('lienRecette5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoRecette1;
    if (value != null) {
      result
        ..add('photoRecette1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoRecette2;
    if (value != null) {
      result
        ..add('photoRecette2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoRecette3;
    if (value != null) {
      result
        ..add('photoRecette3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoRecette4;
    if (value != null) {
      result
        ..add('photoRecette4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoRecette5;
    if (value != null) {
      result
        ..add('photoRecette5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienPhoto1;
    if (value != null) {
      result
        ..add('lienPhoto1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienPhoto2;
    if (value != null) {
      result
        ..add('lienPhoto2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienPhoto3;
    if (value != null) {
      result
        ..add('lienPhoto3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienPhoto4;
    if (value != null) {
      result
        ..add('lienPhoto4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lienPhoto5;
    if (value != null) {
      result
        ..add('lienPhoto5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.free;
    if (value != null) {
      result
        ..add('free')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.semaineAdd;
    if (value != null) {
      result
        ..add('semaineAdd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ingredientProg;
    if (value != null) {
      result
        ..add('ingredientProg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  ProgrammesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProgrammesRecordBuilder();

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
        case 'imagePrincipale':
          result.imagePrincipale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'titre':
          result.titre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sousTitre':
          result.sousTitre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duree':
          result.duree = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'addDuration':
          result.addDuration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'listeAvantages':
          result.listeAvantages = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'intro':
          result.intro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commentPasse':
          result.commentPasse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienRecette1':
          result.lienRecette1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienRecette2':
          result.lienRecette2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienRecette3':
          result.lienRecette3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienRecette4':
          result.lienRecette4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienRecette5':
          result.lienRecette5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photoRecette1':
          result.photoRecette1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photoRecette2':
          result.photoRecette2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photoRecette3':
          result.photoRecette3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photoRecette4':
          result.photoRecette4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photoRecette5':
          result.photoRecette5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienPhoto1':
          result.lienPhoto1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienPhoto2':
          result.lienPhoto2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienPhoto3':
          result.lienPhoto3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienPhoto4':
          result.lienPhoto4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lienPhoto5':
          result.lienPhoto5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'free':
          result.free = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'semaineAdd':
          result.semaineAdd.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'ingredientProg':
          result.ingredientProg.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$ProgrammesRecord extends ProgrammesRecord {
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? imagePrincipale;
  @override
  final String? titre;
  @override
  final String? sousTitre;
  @override
  final int? duree;
  @override
  final int? addDuration;
  @override
  final String? description;
  @override
  final String? listeAvantages;
  @override
  final String? intro;
  @override
  final String? commentPasse;
  @override
  final String? lienRecette1;
  @override
  final String? lienRecette2;
  @override
  final String? lienRecette3;
  @override
  final String? lienRecette4;
  @override
  final String? lienRecette5;
  @override
  final String? photoRecette1;
  @override
  final String? photoRecette2;
  @override
  final String? photoRecette3;
  @override
  final String? photoRecette4;
  @override
  final String? photoRecette5;
  @override
  final String? lienPhoto1;
  @override
  final String? lienPhoto2;
  @override
  final String? lienPhoto3;
  @override
  final String? lienPhoto4;
  @override
  final String? lienPhoto5;
  @override
  final bool? free;
  @override
  final BuiltList<DocumentReference<Object?>>? semaineAdd;
  @override
  final BuiltList<DocumentReference<Object?>>? ingredientProg;
  @override
  final DocumentReference<Object?>? reference;

  factory _$ProgrammesRecord(
          [void Function(ProgrammesRecordBuilder)? updates]) =>
      (new ProgrammesRecordBuilder()..update(updates))._build();

  _$ProgrammesRecord._(
      {this.createTime,
      this.userRef,
      this.imagePrincipale,
      this.titre,
      this.sousTitre,
      this.duree,
      this.addDuration,
      this.description,
      this.listeAvantages,
      this.intro,
      this.commentPasse,
      this.lienRecette1,
      this.lienRecette2,
      this.lienRecette3,
      this.lienRecette4,
      this.lienRecette5,
      this.photoRecette1,
      this.photoRecette2,
      this.photoRecette3,
      this.photoRecette4,
      this.photoRecette5,
      this.lienPhoto1,
      this.lienPhoto2,
      this.lienPhoto3,
      this.lienPhoto4,
      this.lienPhoto5,
      this.free,
      this.semaineAdd,
      this.ingredientProg,
      this.reference})
      : super._();

  @override
  ProgrammesRecord rebuild(void Function(ProgrammesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProgrammesRecordBuilder toBuilder() =>
      new ProgrammesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProgrammesRecord &&
        createTime == other.createTime &&
        userRef == other.userRef &&
        imagePrincipale == other.imagePrincipale &&
        titre == other.titre &&
        sousTitre == other.sousTitre &&
        duree == other.duree &&
        addDuration == other.addDuration &&
        description == other.description &&
        listeAvantages == other.listeAvantages &&
        intro == other.intro &&
        commentPasse == other.commentPasse &&
        lienRecette1 == other.lienRecette1 &&
        lienRecette2 == other.lienRecette2 &&
        lienRecette3 == other.lienRecette3 &&
        lienRecette4 == other.lienRecette4 &&
        lienRecette5 == other.lienRecette5 &&
        photoRecette1 == other.photoRecette1 &&
        photoRecette2 == other.photoRecette2 &&
        photoRecette3 == other.photoRecette3 &&
        photoRecette4 == other.photoRecette4 &&
        photoRecette5 == other.photoRecette5 &&
        lienPhoto1 == other.lienPhoto1 &&
        lienPhoto2 == other.lienPhoto2 &&
        lienPhoto3 == other.lienPhoto3 &&
        lienPhoto4 == other.lienPhoto4 &&
        lienPhoto5 == other.lienPhoto5 &&
        free == other.free &&
        semaineAdd == other.semaineAdd &&
        ingredientProg == other.ingredientProg &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, imagePrincipale.hashCode);
    _$hash = $jc(_$hash, titre.hashCode);
    _$hash = $jc(_$hash, sousTitre.hashCode);
    _$hash = $jc(_$hash, duree.hashCode);
    _$hash = $jc(_$hash, addDuration.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, listeAvantages.hashCode);
    _$hash = $jc(_$hash, intro.hashCode);
    _$hash = $jc(_$hash, commentPasse.hashCode);
    _$hash = $jc(_$hash, lienRecette1.hashCode);
    _$hash = $jc(_$hash, lienRecette2.hashCode);
    _$hash = $jc(_$hash, lienRecette3.hashCode);
    _$hash = $jc(_$hash, lienRecette4.hashCode);
    _$hash = $jc(_$hash, lienRecette5.hashCode);
    _$hash = $jc(_$hash, photoRecette1.hashCode);
    _$hash = $jc(_$hash, photoRecette2.hashCode);
    _$hash = $jc(_$hash, photoRecette3.hashCode);
    _$hash = $jc(_$hash, photoRecette4.hashCode);
    _$hash = $jc(_$hash, photoRecette5.hashCode);
    _$hash = $jc(_$hash, lienPhoto1.hashCode);
    _$hash = $jc(_$hash, lienPhoto2.hashCode);
    _$hash = $jc(_$hash, lienPhoto3.hashCode);
    _$hash = $jc(_$hash, lienPhoto4.hashCode);
    _$hash = $jc(_$hash, lienPhoto5.hashCode);
    _$hash = $jc(_$hash, free.hashCode);
    _$hash = $jc(_$hash, semaineAdd.hashCode);
    _$hash = $jc(_$hash, ingredientProg.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProgrammesRecord')
          ..add('createTime', createTime)
          ..add('userRef', userRef)
          ..add('imagePrincipale', imagePrincipale)
          ..add('titre', titre)
          ..add('sousTitre', sousTitre)
          ..add('duree', duree)
          ..add('addDuration', addDuration)
          ..add('description', description)
          ..add('listeAvantages', listeAvantages)
          ..add('intro', intro)
          ..add('commentPasse', commentPasse)
          ..add('lienRecette1', lienRecette1)
          ..add('lienRecette2', lienRecette2)
          ..add('lienRecette3', lienRecette3)
          ..add('lienRecette4', lienRecette4)
          ..add('lienRecette5', lienRecette5)
          ..add('photoRecette1', photoRecette1)
          ..add('photoRecette2', photoRecette2)
          ..add('photoRecette3', photoRecette3)
          ..add('photoRecette4', photoRecette4)
          ..add('photoRecette5', photoRecette5)
          ..add('lienPhoto1', lienPhoto1)
          ..add('lienPhoto2', lienPhoto2)
          ..add('lienPhoto3', lienPhoto3)
          ..add('lienPhoto4', lienPhoto4)
          ..add('lienPhoto5', lienPhoto5)
          ..add('free', free)
          ..add('semaineAdd', semaineAdd)
          ..add('ingredientProg', ingredientProg)
          ..add('reference', reference))
        .toString();
  }
}

class ProgrammesRecordBuilder
    implements Builder<ProgrammesRecord, ProgrammesRecordBuilder> {
  _$ProgrammesRecord? _$v;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _imagePrincipale;
  String? get imagePrincipale => _$this._imagePrincipale;
  set imagePrincipale(String? imagePrincipale) =>
      _$this._imagePrincipale = imagePrincipale;

  String? _titre;
  String? get titre => _$this._titre;
  set titre(String? titre) => _$this._titre = titre;

  String? _sousTitre;
  String? get sousTitre => _$this._sousTitre;
  set sousTitre(String? sousTitre) => _$this._sousTitre = sousTitre;

  int? _duree;
  int? get duree => _$this._duree;
  set duree(int? duree) => _$this._duree = duree;

  int? _addDuration;
  int? get addDuration => _$this._addDuration;
  set addDuration(int? addDuration) => _$this._addDuration = addDuration;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _listeAvantages;
  String? get listeAvantages => _$this._listeAvantages;
  set listeAvantages(String? listeAvantages) =>
      _$this._listeAvantages = listeAvantages;

  String? _intro;
  String? get intro => _$this._intro;
  set intro(String? intro) => _$this._intro = intro;

  String? _commentPasse;
  String? get commentPasse => _$this._commentPasse;
  set commentPasse(String? commentPasse) => _$this._commentPasse = commentPasse;

  String? _lienRecette1;
  String? get lienRecette1 => _$this._lienRecette1;
  set lienRecette1(String? lienRecette1) => _$this._lienRecette1 = lienRecette1;

  String? _lienRecette2;
  String? get lienRecette2 => _$this._lienRecette2;
  set lienRecette2(String? lienRecette2) => _$this._lienRecette2 = lienRecette2;

  String? _lienRecette3;
  String? get lienRecette3 => _$this._lienRecette3;
  set lienRecette3(String? lienRecette3) => _$this._lienRecette3 = lienRecette3;

  String? _lienRecette4;
  String? get lienRecette4 => _$this._lienRecette4;
  set lienRecette4(String? lienRecette4) => _$this._lienRecette4 = lienRecette4;

  String? _lienRecette5;
  String? get lienRecette5 => _$this._lienRecette5;
  set lienRecette5(String? lienRecette5) => _$this._lienRecette5 = lienRecette5;

  String? _photoRecette1;
  String? get photoRecette1 => _$this._photoRecette1;
  set photoRecette1(String? photoRecette1) =>
      _$this._photoRecette1 = photoRecette1;

  String? _photoRecette2;
  String? get photoRecette2 => _$this._photoRecette2;
  set photoRecette2(String? photoRecette2) =>
      _$this._photoRecette2 = photoRecette2;

  String? _photoRecette3;
  String? get photoRecette3 => _$this._photoRecette3;
  set photoRecette3(String? photoRecette3) =>
      _$this._photoRecette3 = photoRecette3;

  String? _photoRecette4;
  String? get photoRecette4 => _$this._photoRecette4;
  set photoRecette4(String? photoRecette4) =>
      _$this._photoRecette4 = photoRecette4;

  String? _photoRecette5;
  String? get photoRecette5 => _$this._photoRecette5;
  set photoRecette5(String? photoRecette5) =>
      _$this._photoRecette5 = photoRecette5;

  String? _lienPhoto1;
  String? get lienPhoto1 => _$this._lienPhoto1;
  set lienPhoto1(String? lienPhoto1) => _$this._lienPhoto1 = lienPhoto1;

  String? _lienPhoto2;
  String? get lienPhoto2 => _$this._lienPhoto2;
  set lienPhoto2(String? lienPhoto2) => _$this._lienPhoto2 = lienPhoto2;

  String? _lienPhoto3;
  String? get lienPhoto3 => _$this._lienPhoto3;
  set lienPhoto3(String? lienPhoto3) => _$this._lienPhoto3 = lienPhoto3;

  String? _lienPhoto4;
  String? get lienPhoto4 => _$this._lienPhoto4;
  set lienPhoto4(String? lienPhoto4) => _$this._lienPhoto4 = lienPhoto4;

  String? _lienPhoto5;
  String? get lienPhoto5 => _$this._lienPhoto5;
  set lienPhoto5(String? lienPhoto5) => _$this._lienPhoto5 = lienPhoto5;

  bool? _free;
  bool? get free => _$this._free;
  set free(bool? free) => _$this._free = free;

  ListBuilder<DocumentReference<Object?>>? _semaineAdd;
  ListBuilder<DocumentReference<Object?>> get semaineAdd =>
      _$this._semaineAdd ??= new ListBuilder<DocumentReference<Object?>>();
  set semaineAdd(ListBuilder<DocumentReference<Object?>>? semaineAdd) =>
      _$this._semaineAdd = semaineAdd;

  ListBuilder<DocumentReference<Object?>>? _ingredientProg;
  ListBuilder<DocumentReference<Object?>> get ingredientProg =>
      _$this._ingredientProg ??= new ListBuilder<DocumentReference<Object?>>();
  set ingredientProg(ListBuilder<DocumentReference<Object?>>? ingredientProg) =>
      _$this._ingredientProg = ingredientProg;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  ProgrammesRecordBuilder() {
    ProgrammesRecord._initializeBuilder(this);
  }

  ProgrammesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createTime = $v.createTime;
      _userRef = $v.userRef;
      _imagePrincipale = $v.imagePrincipale;
      _titre = $v.titre;
      _sousTitre = $v.sousTitre;
      _duree = $v.duree;
      _addDuration = $v.addDuration;
      _description = $v.description;
      _listeAvantages = $v.listeAvantages;
      _intro = $v.intro;
      _commentPasse = $v.commentPasse;
      _lienRecette1 = $v.lienRecette1;
      _lienRecette2 = $v.lienRecette2;
      _lienRecette3 = $v.lienRecette3;
      _lienRecette4 = $v.lienRecette4;
      _lienRecette5 = $v.lienRecette5;
      _photoRecette1 = $v.photoRecette1;
      _photoRecette2 = $v.photoRecette2;
      _photoRecette3 = $v.photoRecette3;
      _photoRecette4 = $v.photoRecette4;
      _photoRecette5 = $v.photoRecette5;
      _lienPhoto1 = $v.lienPhoto1;
      _lienPhoto2 = $v.lienPhoto2;
      _lienPhoto3 = $v.lienPhoto3;
      _lienPhoto4 = $v.lienPhoto4;
      _lienPhoto5 = $v.lienPhoto5;
      _free = $v.free;
      _semaineAdd = $v.semaineAdd?.toBuilder();
      _ingredientProg = $v.ingredientProg?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProgrammesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProgrammesRecord;
  }

  @override
  void update(void Function(ProgrammesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProgrammesRecord build() => _build();

  _$ProgrammesRecord _build() {
    _$ProgrammesRecord _$result;
    try {
      _$result = _$v ??
          new _$ProgrammesRecord._(
              createTime: createTime,
              userRef: userRef,
              imagePrincipale: imagePrincipale,
              titre: titre,
              sousTitre: sousTitre,
              duree: duree,
              addDuration: addDuration,
              description: description,
              listeAvantages: listeAvantages,
              intro: intro,
              commentPasse: commentPasse,
              lienRecette1: lienRecette1,
              lienRecette2: lienRecette2,
              lienRecette3: lienRecette3,
              lienRecette4: lienRecette4,
              lienRecette5: lienRecette5,
              photoRecette1: photoRecette1,
              photoRecette2: photoRecette2,
              photoRecette3: photoRecette3,
              photoRecette4: photoRecette4,
              photoRecette5: photoRecette5,
              lienPhoto1: lienPhoto1,
              lienPhoto2: lienPhoto2,
              lienPhoto3: lienPhoto3,
              lienPhoto4: lienPhoto4,
              lienPhoto5: lienPhoto5,
              free: free,
              semaineAdd: _semaineAdd?.build(),
              ingredientProg: _ingredientProg?.build(),
              reference: reference);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'semaineAdd';
        _semaineAdd?.build();
        _$failedField = 'ingredientProg';
        _ingredientProg?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProgrammesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
