// ignore_for_file: avoid_print

import 'dart:async';

import 'package:chap_chap/auth/auth_util.dart';
import 'package:chap_chap/notification/notification_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import 'schema/users_record.dart';
import 'schema/cheveux_user_record.dart';
import 'schema/nouveaux_message_record.dart';
import 'schema/recettes_record.dart';
import 'schema/articles_record.dart';
import 'schema/routines_record.dart';
import 'schema/programmes_record.dart';
import 'schema/prog_user_record.dart';
import 'schema/details_week_prog_record.dart';
import 'schema/notifications_record.dart';
import 'schema/list_ingredients_record.dart';
import 'schema/serializers.dart';
import 'schema/instagram_record.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';
export 'schema/users_record.dart';
export 'schema/cheveux_user_record.dart';
export 'schema/nouveaux_message_record.dart';
export 'schema/recettes_record.dart';
export 'schema/articles_record.dart';
export 'schema/routines_record.dart';
export 'schema/programmes_record.dart';
export 'schema/prog_user_record.dart';
export 'schema/details_week_prog_record.dart';
export 'schema/notifications_record.dart';
export 'schema/list_ingredients_record.dart';
export 'schema/instagram_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord?>> queryUsersRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UsersRecord?>> queryUsersRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query CheveuxUserRecords (as a Stream and as a Future).
Stream<List<CheveuxUserRecord?>> queryCheveuxUserRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(CheveuxUserRecord.collection, CheveuxUserRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CheveuxUserRecord?>> queryCheveuxUserRecords(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionList(
        CheveuxUserRecord.collection, CheveuxUserRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CheveuxUserRecord?>> queryCheveuxUserRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        CheveuxUserRecord.collection, CheveuxUserRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query NouveauxMessageRecords (as a Stream and as a Future).
Stream<List<NouveauxMessageRecord?>> queryNouveauxMessageRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        NouveauxMessageRecord.collection, NouveauxMessageRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<NouveauxMessageRecord?>> queryNouveauxMessageRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        NouveauxMessageRecord.collection, NouveauxMessageRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query RecettesRecords (as a Stream and as a Future).
Stream<List<RecettesRecord?>> queryRecettesRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(RecettesRecord.collection, RecettesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<RecettesRecord?>> queryRecettesRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(RecettesRecord.collection, RecettesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query ArticlesRecords (as a Stream and as a Future).
Stream<List<ArticlesRecord?>> queryArticlesRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ArticlesRecord.collection, ArticlesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ArticlesRecord?>> queryArticlesRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(ArticlesRecord.collection, ArticlesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query RoutinesRecords (as a Stream and as a Future).
Stream<List<RoutinesRecord?>> queryRoutinesRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(RoutinesRecord.collection, RoutinesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<RoutinesRecord?>> queryRoutinesRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(RoutinesRecord.collection, RoutinesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query ProgrammesRecords (as a Stream and as a Future).
Stream<List<ProgrammesRecord?>> queryProgrammesRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ProgrammesRecord.collection, ProgrammesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ProgrammesRecord?>> queryProgrammesRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        ProgrammesRecord.collection, ProgrammesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query ProgUserRecords (as a Stream and as a Future).
Stream<List<ProgUserRecord?>> queryProgUserRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ProgUserRecord.collection, ProgUserRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ProgUserRecord?>> queryProgUserRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(ProgUserRecord.collection, ProgUserRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query DetailsWeekProgRecords (as a Stream and as a Future).
Stream<List<DetailsWeekProgRecord?>> queryDetailsWeekProgRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        DetailsWeekProgRecord.collection, DetailsWeekProgRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<DetailsWeekProgRecord?>> queryDetailsWeekProgRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        DetailsWeekProgRecord.collection, DetailsWeekProgRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query NotificationsRecords (as a Stream and as a Future).
Stream<List<NotificationsRecord?>> queryNotificationsRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        NotificationUserModel.collection, NotificationsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<NotificationsRecord?>> queryNotificationsRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        NotificationsRecord.collection, NotificationsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query InstagramRecords (as a Stream and as a Future).
Stream<List<InstagramRecord?>> queryInstagramRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(InstagramRecord.collection, InstagramRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<InstagramRecord?>> queryInstagramRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(InstagramRecord.collection, InstagramRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<ListIngredientsRecord?>> queryListIngredientsRecord(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        ListIngredientsRecord.collection, ListIngredientsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ListIngredientsRecord?>> queryListIngredientsRecordOnce(
        {Query Function(Query)? queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        ListIngredientsRecord.collection, ListIngredientsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<T?>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query)? queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T?>> queryCollectionList<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query)? queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  query = query.where("userRef", isEqualTo: currentUserReference);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T?>> queryCollectionOnce<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query)? queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

// Creates a Firestore record representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
