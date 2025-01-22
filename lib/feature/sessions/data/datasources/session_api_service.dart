import 'package:dio/dio.dart';

class SessionApiService {
  final Dio _dio;

  SessionApiService(this._dio);

  Future<List<Map<String, dynamic>>> fetchSessions() async {
    try {
      final response = await _dio.get('');
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw Exception('Failed to fetch sessions: $e');
    }
  }
}
