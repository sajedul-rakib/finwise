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
      dateOfBirth: map['dateOfBirth'] == null
          ? null
          : (map['dateOfBirth'] is Timestamp
                ? (map['dateOfBirth'] as Timestamp).toDate()
                : DateTime.tryParse(map['dateOfBirth'].toString())),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'avatar': avatar,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? fullName,
    String? avatar,
    String? mobileNumber,
    DateTime? dateOfBirth,
  }) {
    return UserModel(
      userId: userId,
      fullName: fullName ?? this.fullName,
      email: email,
      avatar: avatar ?? this.avatar,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
