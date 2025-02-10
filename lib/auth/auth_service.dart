import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //The instance of Auth //##########################
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Sing In //#######################################
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Sing Up //#######################################

  //Sing Out //######################################

}