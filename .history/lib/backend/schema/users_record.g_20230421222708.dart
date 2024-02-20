// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value, specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.dateNaissance;
    if (value != null) {
      result
        ..add('dateNaissance')
        ..add(serializers.serialize(value, specifiedType: const FullType(DateTime)));
    }
    value = object.nom;
    if (value != null) {
      result
        ..add('Nom')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.prenom;
    if (value != null) {
      result
        ..add('Prenom')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.progRef;
    if (value != null) {
      result
        ..add('progRef')
        ..add(serializers.serialize(value, specifiedType: const FullType(DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.recevoirNotif;
    if (value != null) {
      result
        ..add('recevoirNotif')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userNotifications;
    if (value != null) {
      result
        ..add('userNotifications')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.recevoirNewsletter;
    if (value != null) {
      result
        ..add('recevoirNewsletter')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.recevoirMail;
    if (value != null) {
      result
        ..add('recevoirMail')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.favorisRecettes;
    if (value != null) {
      result
        ..add('favorisRecettes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.admin;
    if (value != null) {
      result
        ..add('admin')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.threeMonth;
    if (value != null) {
      result
        ..add('threeMonth')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sixMonth;
    if (value != null) {
      result
        ..add('sixMonth')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.twelveMonth;
    if (value != null) {
      result
        ..add('twelveMonth')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.member;
    if (value != null) {
      result
        ..add('member')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dateFinAbo;
    if (value != null) {
      result
        ..add('dateFinAbo')
        ..add(serializers.serialize(value, specifiedType: const FullType(DateTime)));
    }
    value = object.favorisArticles;
    if (value != null) {
      result
        ..add('favorisArticles')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value, specifiedType: const FullType(DocumentReference, const [const FullType.nullable(Object)])));
    }
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized, {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value, specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'dateNaissance':
          result.dateNaissance = serializers.deserialize(value, specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Nom':
          result.nom = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'Prenom':
          result.prenom = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'progRef':
          result.progRef = serializers.deserialize(value, specifiedType: const FullType(DocumentReference, const [const FullType.nullable(Object)])) as DocumentReference<Object?>?;
          break;
        case 'recevoirNotif':
          result.recevoirNotif = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userNotifications':
          result.userNotifications = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'recevoirNewsletter':
          result.recevoirNewsletter = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'recevoirMail':
          result.recevoirMail = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'favorisRecettes':
          result.favorisRecettes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'admin':
          result.admin = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'threeMonth':
          result.threeMonth = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sixMonth':
          result.sixMonth = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'twelveMonth':
          result.twelveMonth = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'member':
          result.member = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dateFinAbo':
          result.dateFinAbo = serializers.deserialize(value, specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'favorisArticles':
          result.favorisArticles.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value, specifiedType: const FullType(DocumentReference, const [const FullType.nullable(Object)])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final DateTime? dateNaissance;
  @override
  final String? nom;
  @override
  final String? prenom;
  @override
  final DocumentReference<Object?>? progRef;
  @override
  final bool? recevoirNotif;
  @override
  final int? userNotifications;
  @override
  final bool? recevoirNewsletter;
  @override
  final bool? recevoirMail;
  @override
  final BuiltList<DocumentReference<Object?>>? favorisRecettes;
  @override
  final bool? admin;
  @override
  final bool? threeMonth;
  @override
  final bool? sixMonth;
  @override
  final bool? twelveMonth;
  @override
  final bool? member;
  @override
  final DateTime? dateFinAbo;
  @override
  final String? bio;
  @override
  final BuiltList<DocumentReference<Object?>>? favorisArticles;
  @override
  final DocumentReference<Object?>? reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) => (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._({
    this.email,
    this.displayName,
    this.photoUrl,
    this.uid,
    this.createdTime,
    this.phoneNumber,
    this.dateNaissance,
    this.nom,
    this.prenom,
    this.progRef,
    this.recevoirNotif,
    this.userNotifications,
    this.recevoirNewsletter,
    this.recevoirMail,
    this.favorisRecettes,
    this.admin,
    this.threeMonth,
    this.sixMonth,
    this.twelveMonth,
    this.member,
    this.dateFinAbo,
    this.bio,
    this.favorisArticles,
    this.reference,
  }) : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        dateNaissance == other.dateNaissance &&
        nom == other.nom &&
        prenom == other.prenom &&
        progRef == other.progRef &&
        recevoirNotif == other.recevoirNotif &&
        userNotifications == other.userNotifications &&
        recevoirNewsletter == other.recevoirNewsletter &&
        recevoirMail == other.recevoirMail &&
        favorisRecettes == other.favorisRecettes &&
        admin == other.admin &&
        threeMonth == other.threeMonth &&
        sixMonth == other.sixMonth &&
        twelveMonth == other.twelveMonth &&
        member == other.member &&
        dateFinAbo == other.dateFinAbo &&
        favorisArticles == other.favorisArticles &&
        reference == other.reference &&
        bio == other.bio;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, dateNaissance.hashCode);
    _$hash = $jc(_$hash, nom.hashCode);
    _$hash = $jc(_$hash, prenom.hashCode);
    _$hash = $jc(_$hash, progRef.hashCode);
    _$hash = $jc(_$hash, recevoirNotif.hashCode);
    _$hash = $jc(_$hash, userNotifications.hashCode);
    _$hash = $jc(_$hash, recevoirNewsletter.hashCode);
    _$hash = $jc(_$hash, recevoirMail.hashCode);
    _$hash = $jc(_$hash, favorisRecettes.hashCode);
    _$hash = $jc(_$hash, admin.hashCode);
    _$hash = $jc(_$hash, threeMonth.hashCode);
    _$hash = $jc(_$hash, sixMonth.hashCode);
    _$hash = $jc(_$hash, twelveMonth.hashCode);
    _$hash = $jc(_$hash, member.hashCode);
    _$hash = $jc(_$hash, dateFinAbo.hashCode);
    _$hash = $jc(_$hash, favorisArticles.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('dateNaissance', dateNaissance)
          ..add('nom', nom)
          ..add('prenom', prenom)
          ..add('progRef', progRef)
          ..add('recevoirNotif', recevoirNotif)
          ..add('userNotifications', userNotifications)
          ..add('recevoirNewsletter', recevoirNewsletter)
          ..add('recevoirMail', recevoirMail)
          ..add('favorisRecettes', favorisRecettes)
          ..add('admin', admin)
          ..add('threeMonth', threeMonth)
          ..add('sixMonth', sixMonth)
          ..add('twelveMonth', twelveMonth)
          ..add('member', member)
          ..add('dateFinAbo', dateFinAbo)
          ..add('favorisArticles', favorisArticles)
          ..add('reference', reference)
          ..add('bio', bio))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime? _dateNaissance;
  DateTime? get dateNaissance => _$this._dateNaissance;
  set dateNaissance(DateTime? dateNaissance) => _$this._dateNaissance = dateNaissance;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = _bio;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _prenom;
  String? get prenom => _$this._prenom;
  set prenom(String? prenom) => _$this._prenom = prenom;

  DocumentReference<Object?>? _progRef;
  DocumentReference<Object?>? get progRef => _$this._progRef;
  set progRef(DocumentReference<Object?>? progRef) => _$this._progRef = progRef;

  bool? _recevoirNotif;
  bool? get recevoirNotif => _$this._recevoirNotif;
  set recevoirNotif(bool? recevoirNotif) => _$this._recevoirNotif = recevoirNotif;

  int? _userNotifications;
  int? get userNotifications => _$this._userNotifications;
  set userNotifications(int? userNotifications) => _$this._userNotifications = userNotifications;

  bool? _recevoirNewsletter;
  bool? get recevoirNewsletter => _$this._recevoirNewsletter;
  set recevoirNewsletter(bool? recevoirNewsletter) => _$this._recevoirNewsletter = recevoirNewsletter;

  bool? _recevoirMail;
  bool? get recevoirMail => _$this._recevoirMail;
  set recevoirMail(bool? recevoirMail) => _$this._recevoirMail = recevoirMail;

  ListBuilder<DocumentReference<Object?>>? _favorisRecettes;
  ListBuilder<DocumentReference<Object?>> get favorisRecettes => _$this._favorisRecettes ??= new ListBuilder<DocumentReference<Object?>>();
  set favorisRecettes(ListBuilder<DocumentReference<Object?>>? favorisRecettes) => _$this._favorisRecettes = favorisRecettes;

  bool? _admin;
  bool? get admin => _$this._admin;
  set admin(bool? admin) => _$this._admin = admin;

  bool? _threeMonth;
  bool? get threeMonth => _$this._threeMonth;
  set threeMonth(bool? threeMonth) => _$this._threeMonth = threeMonth;

  bool? _sixMonth;
  bool? get sixMonth => _$this._sixMonth;
  set sixMonth(bool? sixMonth) => _$this._sixMonth = sixMonth;

  bool? _twelveMonth;
  bool? get twelveMonth => _$this._twelveMonth;
  set twelveMonth(bool? twelveMonth) => _$this._twelveMonth = twelveMonth;

  bool? _member;
  bool? get member => _$this._member;
  set member(bool? member) => _$this._member = member;

  DateTime? _dateFinAbo;
  DateTime? get dateFinAbo => _$this._dateFinAbo;
  set dateFinAbo(DateTime? dateFinAbo) => _$this._dateFinAbo = dateFinAbo;

  ListBuilder<DocumentReference<Object?>>? _favorisArticles;
  ListBuilder<DocumentReference<Object?>> get favorisArticles => _$this._favorisArticles ??= new ListBuilder<DocumentReference<Object?>>();
  set favorisArticles(ListBuilder<DocumentReference<Object?>>? favorisArticles) => _$this._favorisArticles = favorisArticles;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) => _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _dateNaissance = $v.dateNaissance;
      _nom = $v.nom;
      _prenom = $v.prenom;
      _progRef = $v.progRef;
      _recevoirNotif = $v.recevoirNotif;
      _userNotifications = $v.userNotifications;
      _recevoirNewsletter = $v.recevoirNewsletter;
      _recevoirMail = $v.recevoirMail;
      _favorisRecettes = $v.favorisRecettes?.toBuilder();
      _admin = $v.admin;
      _threeMonth = $v.threeMonth;
      _sixMonth = $v.sixMonth;
      _twelveMonth = $v.twelveMonth;
      _member = $v.member;
      _dateFinAbo = $v.dateFinAbo;
      _favorisArticles = $v.favorisArticles?.toBuilder();
      _reference = $v.reference;
      _bio = $v.bio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              dateNaissance: dateNaissance,
              nom: nom,
              prenom: prenom,
              progRef: progRef,
              recevoirNotif: recevoirNotif,
              userNotifications: userNotifications,
              recevoirNewsletter: recevoirNewsletter,
              recevoirMail: recevoirMail,
              favorisRecettes: _favorisRecettes?.build(),
              admin: admin,
              threeMonth: threeMonth,
              sixMonth: sixMonth,
              twelveMonth: twelveMonth,
              member: member,
              dateFinAbo: dateFinAbo,
              favorisArticles: _favorisArticles?.build(),
              reference: reference,
              bio: bio);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favorisRecettes';
        _favorisRecettes?.build();

        _$failedField = 'favorisArticles';
        _favorisArticles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
