class UserEntity {
  final String userId;
  final String? fullName;
  final String email;
  final String? avatar;
  final String? mobileNumber;
  final DateTime? dateOfBirth;

  UserEntity({
    required this.userId,
    required this.email,
    this.fullName,
    this.avatar,
    this.mobileNumber,
    this.dateOfBirth,
  });
}
