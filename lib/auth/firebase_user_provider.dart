import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HiCanteen01FirebaseUser {
  HiCanteen01FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

HiCanteen01FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HiCanteen01FirebaseUser> hiCanteen01FirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HiCanteen01FirebaseUser>(
        (user) => currentUser = HiCanteen01FirebaseUser(user));
