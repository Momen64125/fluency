import '../entites/sign_up_entite.dart';
import '../repository/sign_up_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<SignUpEntite> execute(String email, String password, String phone, String name) {
    return repository.createAccount(email, password, phone, name);
  }
}
