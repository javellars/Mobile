import 'package:firebase_auth/firebase_auth.dart';

//import '../model/user_model.dart';

class FirebaseAuthenticationService {
//aqui temos um singletton
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String?> get user {
//o map pega uma stream e dá outra stream
    return _firebaseAuth.authStateChanges().map(
          (event) => _userFromFirebaseUser(event),
        );
  }

  String? _userFromFirebaseUser(User? user) {
    return user?.uid;
  }

  Future<String?> signInAnonimo() async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
