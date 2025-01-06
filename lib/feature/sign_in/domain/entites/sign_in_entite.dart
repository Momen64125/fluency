import 'package:equatable/equatable.dart';
class SignInEntite extends Equatable {
  final String identifier;
  final String password;
  const SignInEntite({
    required this.identifier,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [identifier,password];


}
//
// abstract class SignInEntite {
//   final String identifier;
//   final String password;
//
//   const SignInEntite({required this.identifier, required this.password});
// }
