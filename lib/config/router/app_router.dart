import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/home_screen.dart';
import '../../feature/sign_in/presntation/screens/sign_in.dart';
import '../../feature/splash/splash.dart';
import 'app_routing_paths.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static final navigatorState = GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorState,
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.splash,
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Not Found')),
    ),
    routes: [
      ///? Splash
      GoRoute(
        name: AppRoutes.splash,
        path: AppRoutes.splash,
        builder: (context, state) => SplashScreen(),
      ),

    /// ? Sign In
      GoRoute(
        name: AppRoutes.signin,
        path: AppRoutes.signin,
        builder: (context, state) => const SignInScreen(),
      ),
      ///? Sign Up
      GoRoute(
        name: AppRoutes.signup,
        path: AppRoutes.signup,
        builder: (context, state) => const SignInScreen(),
      ),
      ///? HomePage
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      ///?profile
      GoRoute(
        name: AppRoutes.profile,
        path: AppRoutes.profile,
        builder: (context, state) => const SignInScreen(),
      ),

    ],
  );
}
