// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../core/widgets/text_field.dart';
// import '../../../sign_up/presntation/screens/sign_up.dart';
// import '../controller/sign_in_controller.dart';
//
// class SignInScreen extends ConsumerWidget {
//   const SignInScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final identifierController = TextEditingController();
//     final passwordController = TextEditingController();
//     final loginState = ref.watch(loginProvider);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // الجزء العلوي الملون بالخلفية
//           Container(
//             height: MediaQuery.of(context).size.height * 0.4,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF662D91), Color(0xFF905EB6)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(40.0),
//                 bottomRight: Radius.circular(40.0),
//               ),
//             ),
//           ),
//           // مستطيل الإدخال
//           Align(
//             alignment: Alignment.center,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20.0),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 10,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Welcome back!',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF362E3C),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text('Mobile or identifier',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF362E3C),
//                               ),),
//                           ],
//                         ),
//                         CustomTextFormField(
//                           labelText: 'Enter your mobile or identifier',
//                           validator: (value) =>
//                           value == null || value.isEmpty ? 'identifier is required' : null,
//                           onSaved: (value) => identifierController.text = value ?? '',
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text('Password',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF362E3C),
//                               ),),
//                           ],
//                         ),
//                         CustomTextFormField(
//                           labelText: '********',
//                           validator: (value) =>
//                           value == null || value.isEmpty ? 'Password is required' : null,
//                           onSaved: (value) => passwordController.text = value ?? '',
//                           keyboardType: TextInputType.visiblePassword,
//                           icon: const Icon(Icons.visibility_outlined, color: Color(0xFF662D91),),
//                         ),
//                         const SizedBox(height: 10),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               // Add forget password logic here
//                             },
//                             child: const Text(
//                               'Forget Password?',
//                               style: TextStyle(color: Color(0xFF4F1993)),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         SizedBox(
//                           width: double.infinity,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(
//                                 colors: [
//                                   Color(0xFF662D91),
//                                   Color(0xFF905EB6),
//                                 ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                               ),
//                               borderRadius: BorderRadius.circular(50.0), // نفس حواف الزر
//                             ),
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 final notifier = ref.read(loginProvider.notifier);
//                                 notifier.login(
//                                   identifierController.text,
//                                   passwordController.text,
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 0, // إزالة الظل لأن الخلفية مخصصة
//                                 backgroundColor: Colors.transparent, // اجعل لون الزر شفافًا
//                                 padding: const EdgeInsets.symmetric(vertical: 15),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50.0),
//                                 ),
//                               ),
//                               child: const Text(
//                                 'Login',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 20),
//                         loginState.when(
//                           data: (user) => user == null
//                               ? const SizedBox()
//                               : Text('Welcome, ${user.identifier}!'),
//                           loading: () =>
//                           const CircularProgressIndicator(),
//                           error: (error, _) =>
//                               Text('Error: $error'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don't have an account?",style:TextStyle(fontSize: 12) ,),
//                       TextButton(
//                         onPressed: () {
//                           //Navigator.pushNamed(context);
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
//                          //context.push('/signup');
//                           },
//                           child: const Text(
//                           'Sign up',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color(0xFF8A2BE2),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/text_field.dart'; // مكون TextField مخصص
 // الشاشة الخاصة بالتسجيل
import '../../../sign_up/presntation/screens/sign_up.dart';
import '../controller/sign_in_controller.dart'; // التحكم في تسجيل الدخول
class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      body: Stack(
        children: [
          // الجزء العلوي الملون بالخلفية
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF662D91), Color(0xFF905EB6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
          ),
          // مستطيل الإدخال
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF362E3C),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Mobile or identifier',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF362E3C),
                              ),),
                          ],
                        ),
                        CustomTextFormField(
                          controller: identifierController,
                          labelText: 'Enter your mobile or identifier',
                          validator: (value) =>
                          value == null || value.isEmpty ? 'identifier is required' : null,
                          onSaved: (value) => identifierController.text = value ?? '',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF362E3C),
                              ),),
                          ],
                        ),
                        CustomTextFormField(
                          labelText: '********',
                          controller: passwordController,
                          validator: (value) =>
                          value == null || value.isEmpty ? 'Password is required' : null,
                          onSaved: (value) => passwordController.text = value ?? '',
                          keyboardType: TextInputType.visiblePassword,
                          icon: const Icon(Icons.visibility_outlined, color: Color(0xFF662D91)),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Add forget password logic here
                            },
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(color: Color(0xFF4F1993)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF662D91), Color(0xFF905EB6)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                final notifier = ref.read(loginProvider.notifier);
                                notifier.login(
                                  identifierController.text,
                                  passwordController.text,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        loginState.when(
                          data: (user) => user == null
                              ? const SizedBox()
                              : Text('Welcome, ${user.identifier}!'),
                          loading: () => const CircularProgressIndicator(),
                          error: (error, _) => Text('Error: $error'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?", style: TextStyle(fontSize: 12)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF8A2BE2)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
