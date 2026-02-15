import '../repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;
  LoginUseCase({required LoginRepository repo}) : _repository = repo;

  Future<void> execute(String email, String password) async {
    return await _repository.login(email: email, password: password);
  }
}
