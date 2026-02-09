import 'package:firebase_auth/firebase_auth.dart';

const List<String> adminUIDs = [
  'KHKAmMJCAEZv44UWkITecMGfUEh2',
  'C8jLlHAH7wTNCk3I0xd2RcfUM372',
];

class AuthService {
  static User? get currentUser => FirebaseAuth.instance.currentUser;

  static bool isAdmin() {
    final user = currentUser;
    if (user == null) return false;
    return adminUIDs.contains(user.uid);
  }

  static Future<String> createAccountWithEmail(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Account Created';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> loginWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Login Successful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  // static Future<bool> isUserLoggedIn() async {
  //   var currentUser = FirebaseAuth.instance.currentUser;
  //   return currentUser != null ? true : false;
  // }

    static bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
