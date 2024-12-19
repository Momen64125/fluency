
import '../entites/sign_in_entite.dart';

abstract class AuthRepository {
  Future<SignInEntite> login(String email, String password);
}