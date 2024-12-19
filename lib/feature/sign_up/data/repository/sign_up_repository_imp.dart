import '../../domain/entites/sign_up_entite.dart';
import '../../domain/repository/sign_up_repository.dart';
import '../datasources/sign_up_datasources.dart';
import '../model/sign_in_model.dart';
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<SignUpEntite> createAccount(String email, String password, String name, String phone) async {
    try {
      final responseData = await remoteDataSource.createAccount(email, password,name,phone);
      return SignUpModel.fromJson(responseData);
    } catch (e) {

      throw Exception('فشل انشاء حساب: $e');
    }
  }
}
