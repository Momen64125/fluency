// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'config/router/app_router.dart';
// import 'feature/home/home_screen.dart';
// import 'feature/splash/splash.dart';
//
// void main() {
//
//   runApp(const ProviderScope(child: MyApp()));
//
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//      return ScreenUtilInit( // تأكد من إرجاع ScreenUtilInit هنا
//       designSize: const Size(375,812), // حجم التصميم الأساسي
//       minTextAdapt: true, // يتيح ضبط النص تلقائيًا
//       splitScreenMode: true, // يدعم الشاشات المنقسمة
//       builder: (context, child) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//           ),
//           routerConfig: AppRouter.router,
//
//         );
//
//       },
//     );
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     debugShowCheckedModeBanner: false,
//   //     home: HomePage(),
//   //   );
//   //
//
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
