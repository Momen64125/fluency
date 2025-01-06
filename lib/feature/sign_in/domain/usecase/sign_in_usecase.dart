import '../entites/sign_in_entite.dart';
import '../repository/sign_in_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<SignInEntite> execute(String identifier, String password) {
    return repository.login(identifier, password);
  }
}
