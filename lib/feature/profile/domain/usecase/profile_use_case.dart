
import '../entites/profile_entity.dart';
import '../repository/profile_repository.dart';

class GetUserProfileUseCase {
  final ProfileRepository repository;

  GetUserProfileUseCase(this.repository);

  Future<UserProfile> call() {
    return repository.fetchUserProfile();
  }
}
