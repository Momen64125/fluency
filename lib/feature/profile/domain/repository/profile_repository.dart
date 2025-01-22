

import '../entites/profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfile> fetchUserProfile();
}
