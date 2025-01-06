
import '../entites/sign_up_entite.dart';

abstract class AuthRepository {
  Future<SignUpEntite> createAccount(String identifier, String password, String name, String phone);
}
