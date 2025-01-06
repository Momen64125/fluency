import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/text_field.dart';
import '../../../sign_in/presntation/screens/sign_in.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String identifier = '';
  String phone = '';
  String password = '';
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.43,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          const Text(
                            'Create your account',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF362E3C),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Full name',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF362E3C),
                                ),),
                            ],
                          ),
                          CustomTextFormField(
                            labelText: 'Enter your full name',
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Name is required' : null,
                            onSaved: (value) => name = value ?? '',
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('identifier',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF362E3C),
                                ),),
                            ],
                          ),
                          CustomTextFormField(
                            labelText: 'Enter your identifier',
                            validator: (value) =>
                            value == null || value.isEmpty ? 'identifier is required' : null,
                            onSaved: (value) => identifier = value ?? '',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Mobile number',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF362E3C),
                                ),),
                            ],
                          ),
                          CustomTextFormField(
                            labelText: '05xxxxxxxx',
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Phone number is required' : null,
                            onSaved: (value) => phone = value ?? '',
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 20),
                          const Row(
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
                            labelText:'********',
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Password is required' : null,
                            onSaved: (value) => password = value ?? '',
                            keyboardType: TextInputType.visiblePassword,
                            icon: const Icon(Icons.visibility_outlined, color: Color(0xFF662D91),),

                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF362E3C),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: const Text('Male'),
                                  value: 'Male',
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value as String;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: const Text('Female'),
                                  value: 'Female',
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value as String;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
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
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  ref.read(signUpProvider.notifier).signUp(
                                    name,
                                    identifier,
                                    password,
                                    phone,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent, // خلفية شفافة للزر
                                shadowColor: Colors.transparent, // إزالة الظلال
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                'Create account',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          if (signUpState is AsyncLoading)
                            const Center(child: CircularProgressIndicator()),
                          if (signUpState is AsyncError)
                            Text(
                              'Error: ${signUpState.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have account?"),
                      TextButton(
                        onPressed: () {
                          context.go('/signin');
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8A2BE2),
                          ),
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
