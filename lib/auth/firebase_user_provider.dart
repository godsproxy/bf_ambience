import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ButterflyFirebaseUser {
  ButterflyFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ButterflyFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ButterflyFirebaseUser> butterflyFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ButterflyFirebaseUser>(
      (user) {
        currentUser = ButterflyFirebaseUser(user);
        return currentUser!;
      },
    );
