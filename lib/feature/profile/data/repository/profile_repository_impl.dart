import '../../domain/entites/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasources/profile_datasources.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImpl(this.datasource);

  @override
  Future<UserProfile> fetchUserProfile() async {
    try {
    //  return await datasource.getUserProfile();
      return UserProfile(name: 'John Doe', imageUrl: 'https://example.com/profile.jpg');
    } catch (e) {
      throw Exception('Error fetching user profile: $e');
    }
  }
}
