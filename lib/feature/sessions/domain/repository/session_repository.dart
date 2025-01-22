import '../entites/session_entity.dart';

abstract class SessionRepository {
  Future<List<SessionEntity>> getSessions();
}
