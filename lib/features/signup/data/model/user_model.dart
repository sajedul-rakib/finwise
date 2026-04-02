import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userId,
    required super.fullName,
    required super.email,
    super.avatar,
    super.countryName,
    super.currency,
    required super.mobileNumber,
    required super.dateOfBirth,
    super.createAt,
    super.updateAt,
  });

  // 1. Factory to create Model from a Map (Works for both Hive and Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    DateTime? parseDate(dynamic value) {
      if (value is Timestamp) return value.toDate(); // From Firestore
      if (value is String) return DateTime.tryParse(value); // From JSON Strings
      if (value is DateTime) return value; // From Hive (Hive supports DateTime)
      return null;
    }

    return UserModel(
      userId: map['userId'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'],
      currency: map['currency'],
      countryName: map['countryName'],
      mobileNumber: map['mobileNumber'] ?? '',
      dateOfBirth: parseDate(map['dateOfBirth']),
      createAt: parseDate(map['createAt']),
      updateAt: parseDate(map['updateAt']),
    );
  }

  // 2. Factory to create Model directly from Firestore DocumentSnapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) throw Exception("Document data was null");

    // Merge the document ID into the map if userId is missing
    final map = Map<String, dynamic>.from(data);
    if (map['userId'] == null || map['userId'] == '') {
      map['userId'] = snapshot.id;
    }

    return UserModel.fromMap(map);
  }

  // 3. Method to convert Model to Map (Hive & Firestore Compatible)
  // We remove 'Timestamp.fromDate' because Hive crashes on it.
  // Firestore will convert DateTime to Timestamp automatically.
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'avatar': avatar,
      'currency': currency,
      'countryName': countryName,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth, // Store as DateTime for Hive
      'createAt': createAt, // Store as DateTime for Hive
      'updateAt': DateTime.now(), // Standard DateTime
    };
  }

  // 4. Convert Model to Entity (Domain Layer boundary)
  UserEntity toEntity() => UserEntity(
    userId: userId,
    fullName: fullName,
    email: email,
    avatar: avatar,
    countryName: countryName,
    currency: currency,
    mobileNumber: mobileNumber,
    dateOfBirth: dateOfBirth,
    createAt: createAt,
    updateAt: updateAt,
  );

  // 5. Create a copy of the model with updated fields
  UserModel copyWith({
    String? userId,
    String? fullName,
    String? avatar,
    String? currency,
    String? countryName,
    String? mobileNumber,
    DateTime? dateOfBirth,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email, // Email usually stays immutable
      avatar: avatar ?? this.avatar,
      currency: currency ?? this.currency,
      countryName: countryName ?? countryName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
