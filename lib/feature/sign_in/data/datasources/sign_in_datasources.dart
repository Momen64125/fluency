// // import 'package:dio/dio.dart';
// // import 'package:fluency/core/errore/exception.dart';
// // import 'package:fluency/core/network/errore_message_model.dart';
// // abstract class  BaseSignInDatasources {
// //   Future<void> signIn(String identifier, String password);
// // }
// //
// // class SignInDatasources extends BaseSignInDatasources {
// //   @override
// //   Future<void> signIn(String identifier, String password) async {
// //
// //     final response = await Dio().post('https://reqres.in/api/login', data: {'identifier': identifier, 'password': password});
// //     if (response.statusCode == 200) {
// //
// //     }else{
// //       throw ServerException(erroreMessageModel: ErroreMessageModel.fromJson(response.data));
// //     }
// //   }
// // }
// import 'package:dio/dio.dart';
//
// abstract class AuthRemoteDataSource {
//   Future<Map<String, dynamic>> login(String identifier, String password);
// }
//
//
// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final Dio dio;
//
//   AuthRemoteDataSourceImpl(this.dio);
//
//   @override
//   Future<Map<String, dynamic>> login(String identifier, String password) async {
//     try {
//       final response = await dio.post(
//         'https://api.fluency.live/api/v1/auth/login',
//         data: {
//           'identifier': identifier,
//           'password': password,
//         },
//       );
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Server error: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to login: ${e.toString()}');
//     }
//   }}
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String identifier, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> login(String identifier, String password) async {
    try {
      final response = await dio.post(
        'https://api.fluency.live/api/v1/auth/login',
        data: {
          'identifier': identifier,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('فشل تسجيل الدخول: $e');
    }
  }
}
