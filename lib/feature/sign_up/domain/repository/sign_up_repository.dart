
import '../entites/sign_up_entite.dart';

abstract class AuthRepository {
  Future<SignUpEntite> createAccount(String email, String password, String name, String phone);
}
