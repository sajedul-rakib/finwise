import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../signup/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<User?> getCurrentFirebaseUser();
  Future<UserModel?> getUserProfile(String uid);
  Future<void> signOut();
}

class FirebaseAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseAuthRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _auth = auth,
       _firestore = firestore;

  @override
  Future<User?> getCurrentFirebaseUser() async => _auth.currentUser;

  @override
  Future<UserModel?> getUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }

  @override
  Future<void> signOut() => _auth.signOut();
}
