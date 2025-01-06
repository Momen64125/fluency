// // import '../../domain/entites/sign_in_entite.dart';
// //
// // class SignInModel extends SignInEntite {
// //   const SignInModel({required super.identifier, required super.password});
// //
// //   factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
// //         identifier: json['identifier'],
// //         password: json['password'],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         'identifier': identifier,
// //         'password': password,
// //       };
// //
// // }
import '../../domain/entites/sign_in_entite.dart';

class SignInModel extends SignInEntite {
  const SignInModel({required super.identifier, required super.password});


  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      identifier: json['identifier']?.toString() ?? '', // تحويل القيمة إلى String
      password: json['password']?.toString() ?? '',     // تحويل القيمة إلى String
    );
  }

  Map<String, dynamic> toJson() => {
    'identifier': identifier,
    'password': password,
  };
 }
// import '../../domain/entites/sign_in_entite.dart';
//
// class SignInModel extends SignInEntite {
//   const SignInModel({required super.identifier, required super.password});
//
//   factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
//     identifier: json['identifier'],
//     password: json['password'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'identifier': identifier,
//     'password': password,
//   };
// }
