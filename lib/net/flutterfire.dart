import 'package:firebase_auth/firebase_auth.dart';

Future<void> login(String email, String password) async {}

//Provider package
Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak');
    } else if (e.code == 'email-already-in-use') {
      print('An Account already exists for the given email');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
