import 'package:equatable/equatable.dart';
class SignInEntite extends Equatable {
  final String email;
  final String password;
  const SignInEntite({
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];


}