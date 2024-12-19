
import 'dart:async';
import 'package:fluency/feature/sign_in/presntation/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/app_routing_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>  const SignInScreen(),
      //   ),
      // );
      context.go('/signup');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SvgPicture.asset(
          'assets/images/splash.svg',
          width: 1.sw,
          height: 1.sh,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text(
          'Welcome to Login Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
