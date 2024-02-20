import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ChapChapFirebaseUser {
  ChapChapFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;

  void updateUserPassword(text) {}
}

ChapChapFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ChapChapFirebaseUser> chapChapFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ChapChapFirebaseUser>(
            (user) => currentUser = ChapChapFirebaseUser(user));
