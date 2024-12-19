import '../../domain/entites/sign_in_entite.dart';

class SignInModel extends SignInEntite {
  const SignInModel({required super.email, required super.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

}
