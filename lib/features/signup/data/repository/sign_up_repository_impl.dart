import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/sign_up_repository.dart';
import '../model/user_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  SignUpRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  }) : _firebaseAuth = firebaseAuth,
       _firestore = firestore;

  @override
  Future<UserEntity> signUpWithEmailAndPassword({
    required String password,
    required UserEntity user,
  }) async {
    try {
      // 1. Create a new user in Firebase Auth
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      final String uid = credential.user!.uid;

      // 2. Create the UserModel using the newly generated UID
      // We map the Entity data into a Model that has toMap() capabilities
      final userModel = UserModel(
        userId: uid,
        fullName: user.fullName,
        email: user.email,
        mobileNumber: user.mobileNumber,
        dateOfBirth: user.dateOfBirth,
        avatar: user.avatar,
      );

      // 3. Save user data to Firestore
      // We use .doc(uid).set() instead of .add() to ensure the Firestore
      // Document ID matches the Firebase Auth UID for easy lookups.
      await _firestore.collection("users").doc(uid).set(userModel.toMap());
      final authBox = await Hive.openBox("auth_box");
      authBox.put("userId", uid);
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}
