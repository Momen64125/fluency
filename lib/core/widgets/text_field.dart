import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Icon? icon;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.validator,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.controller,  this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        suffixIcon: icon,
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
