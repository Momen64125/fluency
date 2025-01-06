
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/sign_up_datasources.dart';
import '../../data/repository/sign_up_repository_imp.dart';
import '../../domain/entites/sign_up_entite.dart';
import '../../domain/repository/sign_up_repository.dart';
import '../../domain/usecase/sign_up_usecase.dart';

// Dio Provider
final dioProvider = Provider<Dio>((ref) => Dio());

// Remote Data Source Provider for SignUp
final signUpRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(dioProvider));
});

// Repository Provider
final signUpRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(signUpRemoteDataSourceProvider));
});

// Use Case Provider
final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.read(signUpRepositoryProvider));
});

// State Notifier Provider for SignUp
final signUpProvider = StateNotifierProvider<SignUpNotifier, AsyncValue<SignUpEntite?>>((ref) {
  return SignUpNotifier(ref.read(signUpUseCaseProvider));
});

class SignUpNotifier extends StateNotifier<AsyncValue<SignUpEntite?>> {
  final SignUpUseCase signUpUseCase;

  SignUpNotifier(this.signUpUseCase) : super(const AsyncValue.data(null));

  Future<void> signUp(String name, String identifier, String password, String phone) async {
    state = const AsyncValue.loading();
    try {
      final user = await signUpUseCase.execute(name, identifier, password, phone);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error("Failed to sign up. Please try again later." , StackTrace.current);
    }
  }
}
