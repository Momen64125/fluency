import '../../domain/entites/session_entity.dart';
import '../../domain/repository/session_repository.dart';
import '../datasources/session_api_service.dart';
import '../models/session_model.dart';


class SessionRepositoryImpl extends SessionRepository {
  final SessionApiService apiService;

  SessionRepositoryImpl(this.apiService);

  @override
  Future<List<SessionEntity>> getSessions() async {
    final data = await apiService.fetchSessions();
    return data.map((json) => SessionModel.fromJson(json)).toList();
  }
}
