import 'package:dio/dio.dart';

class SessionApiService {
  final Dio _dio;

  SessionApiService(this._dio);

  Future<List<Map<String, dynamic>>> fetchSessions() async {
    try {
      final response = await _dio.get('http://192.168.1.3:3000/data');
      print(response.data);
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch sessions: $e');

    }
  }
}
