
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> createAccount(String identifier, String password, String name, String phone);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> createAccount(String identifier, String password, String name, String phone) async {
    try {
      final response = await dio.post(
        'https://api.example.com/login',
        data: {
          'identifier': identifier,
          'password': password,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('فشل تسجيل الدخول: ${e.toString()}');
    }
  }
}
