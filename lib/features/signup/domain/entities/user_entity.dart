class UserEntity {
  final String userId;
  final String fullName;
  final String email;
  final String mobileNumber;
  final DateTime dateOfBirth;

  UserEntity({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
  });
}
