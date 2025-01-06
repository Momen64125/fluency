import 'package:fluency/feature/sign_in/data/model/sign_in_model.dart';
import 'package:fluency/feature/sign_in/domain/entites/sign_in_entite.dart';

import '../../domain/repository/sign_in_repository.dart';
import '../datasources/sign_in_datasources.dart';
//
// class SignInRepositoryImp implements SignInRepository {
//   final BaseSignInDatasources baseSignInDatasources;
//   SignInRepositoryImp({required this.baseSignInDatasources});
//   @override
//   Future<void> signIn() async {
//     await Future.delayed(const Duration(seconds: 2));
//   }
// }
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<SignInEntite> login(String identifier, String password) async {
    try {
      final responseData = await remoteDataSource.login(identifier, password);
      return SignInModel.fromJson(responseData);
    } catch (e) {
      throw Exception('فشل تسجيل الدخول: $e');
    }
  }
// }
// import 'package:fluency/feature/sign_in/domain/entites/sign_in_entite.dart';
// import '../../data/datasources/sign_in_datasources.dart';
// import '../../domain/repository/sign_in_repository.dart';
// import '../model/sign_in_model.dart';
//
// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//
//   AuthRepositoryImpl(this.remoteDataSource);
//
//   @override
//   Future<SignInEntite> login(String identifier, String password) async {
//     try {
//       final responseData = await remoteDataSource.login(identifier, password);
//       return SignInModel.fromJson(responseData);
//     } catch (e) {
//       throw Exception('فشل تسجيل الدخول: $e');
//     }
//   }
// }
}