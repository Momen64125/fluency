import '../entites/session_entity.dart';
import '../repository/session_repository.dart';

class FetchSessionsUseCase {
  final SessionRepository repository;

  FetchSessionsUseCase(this.repository);

  Future<List<SessionEntity>> execute() {
    return repository.getSessions();
  }
}
