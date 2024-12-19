// import 'package:dio/dio.dart';
// import 'package:fluency/core/errore/exception.dart';
// import 'package:fluency/core/network/errore_message_model.dart';
// abstract class  BaseSignInDatasources {
//   Future<void> signIn(String email, String password);
// }
//
// class SignInDatasources extends BaseSignInDatasources {
//   @override
//   Future<void> signIn(String email, String password) async {
//
//     final response = await Dio().post('https://reqres.in/api/login', data: {'email': email, 'password': password});
//     if (response.statusCode == 200) {
//
//     }else{
//       throw ServerException(erroreMessageModel: ErroreMessageModel.fromJson(response.data));
//     }
//   }
// }
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://api.example.com/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('فشل تسجيل الدخول: ${e.toString()}');
    }
  }
}
