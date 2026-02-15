import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  LoginRemoteDataSource({
    required FirebaseAuth auth,
    required FirebaseFirestore store,
  }) : _auth = auth,
       _firestore = store;

  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Map<String, dynamic>?> fetchUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.data();
  }
}
