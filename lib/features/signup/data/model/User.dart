import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userId,
    required super.fullName,
    required super.email,
    super.avatar,
    required super.mobileNumber,
    required super.dateOfBirth,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'],
      mobileNumber: map['mobileNumber'] ?? '',
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'avatar': avatar,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth != null
          ? Timestamp.fromDate(dateOfBirth!)
          : null,
    };
  }

  UserModel copyWith({String? fullName, String? avatar, String? mobileNumber}) {
    return UserModel(
      userId: userId,
      fullName: fullName ?? this.fullName,
      email: email,
      avatar: avatar ?? this.avatar,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth,
    );
  }
}
