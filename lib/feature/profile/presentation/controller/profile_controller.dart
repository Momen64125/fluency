import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/profile_datasources.dart';
import '../../data/repository/profile_repository_impl.dart';
import '../../domain/entites/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../../domain/usecase/profile_use_case.dart';


// Datasource Provider
final profileDatasourceProvider = Provider<ProfileDatasource>((ref) {
  return ProfileDatasourceImpl();
});

// Repository Provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(ref.read(profileDatasourceProvider));
});

// UseCase Provider
final getUserProfileUseCaseProvider = Provider<GetUserProfileUseCase>((ref) {
  return GetUserProfileUseCase(ref.read(profileRepositoryProvider));
});

// User Profile State Provider
final userProfileProvider = FutureProvider<UserProfile>((ref) async {
  final useCase = ref.read(getUserProfileUseCaseProvider);
  return useCase();
});
