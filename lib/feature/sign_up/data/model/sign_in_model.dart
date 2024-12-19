import '../../domain/entites/sign_up_entite.dart';

class SignUpModel extends SignUpEntite {
  const SignUpModel({required super.email, required super.password, required super.phone, required super.name});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
      };

}
