import 'package:equatable/equatable.dart';
class SignUpEntite extends Equatable {
  final String identifier;
  final String password;
  final String phone;
  final String name;
  const SignUpEntite({
    required this.identifier,
    required this.password,
    required this.phone,
    required this.name

  });

  @override
  // TODO: implement props
  List<Object?> get props => [identifier,password,phone,name];


}