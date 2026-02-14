abstract class SignUpRepository {
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required password,
    Map<String, dynamic>? payloads,
  });
}
