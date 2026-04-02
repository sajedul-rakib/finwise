import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/user_entity.dart';
import '../../model/user_model.dart';

abstract class SignUpRemoteDatasource {
  Future<UserCredential> signUpWithEmailAndPassword({
    required String password,
    required UserEntity user,
  });
}

class SignUpRemoteDataSourceImpl extends SignUpRemoteDatasource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  SignUpRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore fireStore,
  }) : _auth = auth,
       _firestore = fireStore;
  @override
  Future<UserCredential> signUpWithEmailAndPassword({
    required String password,
    required UserEntity user,
  }) async {
    // 1. Create a new user in Firebase Auth
    final credential = await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );

    if (credential.user != null) {
      final userModel = UserModel(
        userId: credential.user!.uid,
        fullName: user.fullName,
        email: user.email,
        countryName: user.countryName,
        currency: user.currency,
        mobileNumber: user.mobileNumber,
        dateOfBirth: user.dateOfBirth,
      );
      await _firestore
          .collection("users")
          .doc(credential.user!.uid)
          .set(userModel.toMap());
    }

    return credential;
  }
}
