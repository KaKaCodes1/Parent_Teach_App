import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    String fullName,
    String username,
    String location,
    String dateOfBirth,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      if (User != null) {
        // Store additional user information in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .set({
          'fullName': fullName,
          'username': username,
          'location': location,
          'dateOfBirth': dateOfBirth,
          'email': email,
        });
      }
      return credential.user;
    } catch (e) {
      print("Error Occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error Occured");
    }
    return null;
  }

  createUserWithEmailAndPassword(
      {required String email, required String password}) {}
}
