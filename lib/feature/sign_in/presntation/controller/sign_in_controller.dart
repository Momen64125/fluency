// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// //
// // // الحالة (State): تمثل حالة واجهة تسجيل الدخول
// // class AuthState {
// //   final bool isLoading;
// //   final String? errorMessage;
// //
// //   AuthState({this.isLoading = false, this.errorMessage});
// //
// //   AuthState copyWith({bool? isLoading, String? errorMessage}) {
// //     return AuthState(
// //       isLoading: isLoading ?? this.isLoading,
// //       errorMessage: errorMessage ?? this.errorMessage,
// //     );
// //   }
// // }
// //
// // // الـ StateNotifier: يتحكم في حالة تسجيل الدخول
// // class AuthController extends StateNotifier<AuthState> {
// //   AuthController() : super(AuthState());
// //
// //   // دالة لمحاكاة تسجيل الدخول
// //   Future<void> signIn(String identifier, String password) async {
// //     state = state.copyWith(isLoading: true, errorMessage: null);
// //     await Future.delayed(const Duration(seconds: 2)); // محاكاة API Call
// //
// //     if (identifier == "user@test.com" && password == "password123") {
// //       state = state.copyWith(isLoading: false);
// //     } else {
// //       state = state.copyWith(
// //         isLoading: false,
// //         errorMessage: "البريد الإلكتروني أو كلمة المرور غير صحيحة",
// //       );
// //     }
// //   }
// // }
// //
// // // Provider: لـ AuthController
// // final authControllerProvider =
// // StateNotifierProvider<AuthController, AuthState>((ref) {
// //   return AuthController();
// // });
// import 'package:fluency/feature/sign_in/domain/entites/sign_in_entite.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:dio/dio.dart';
// import '../../data/datasources/sign_in_datasources.dart';
// import '../../data/repository/sign_in_repository_imp.dart';
// import '../../domain/repository/sign_in_repository.dart';
// import '../../domain/usecase/sign_in_usecase.dart';
//
// // Dio Provider
// final dioProvider = Provider<Dio>((ref) => Dio());
//
// // Remote Data Source Provider
// final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
//   return AuthRemoteDataSourceImpl(ref.read(dioProvider));
// });
//
// // Repository Provider
// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
// });
//
// // Use Case Provider
// final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
//   return LoginUseCase(ref.read(authRepositoryProvider));
// });
//
// // State Notifier Provider for Login
// final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<SignInEntite?>>((ref) {
//   return LoginNotifier(ref.read(loginUseCaseProvider));
// });
//
// class LoginNotifier extends StateNotifier<AsyncValue<SignInEntite?>> {
//   final LoginUseCase loginUseCase;
//
//   LoginNotifier(this.loginUseCase) : super(const AsyncValue.data(null));
//
//   Future<void> login(String identifier, String password) async {
//     state = const AsyncValue.loading();
//     try {
//       final user = await loginUseCase.execute(identifier, password);
//       state = AsyncValue.data(user);
//       print(user);
//     } catch (e) {
//       state = AsyncValue.error(e, StackTrace.current);
//       print(e);
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/sign_in_datasources.dart';
import '../../data/repository/sign_in_repository_imp.dart';
import '../../domain/entites/sign_in_entite.dart';
import '../../domain/repository/sign_in_repository.dart';
import '../../domain/usecase/sign_in_usecase.dart';


// Dio Provider
final dioProvider = Provider<Dio>((ref) => Dio());

// Remote Data Source Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(dioProvider));
});

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

// Use Case Provider
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

// State Notifier Provider for Login
final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<SignInEntite?>>((ref) {
  return LoginNotifier(ref.read(loginUseCaseProvider));
});

class LoginNotifier extends StateNotifier<AsyncValue<SignInEntite?>> {
  final LoginUseCase loginUseCase;

  LoginNotifier(this.loginUseCase) : super(const AsyncValue.data(null));

  Future<void> login(String identifier, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await loginUseCase.execute(identifier, password);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
