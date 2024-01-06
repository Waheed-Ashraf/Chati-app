import 'package:chati_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText,
    this.onchange,
    required this.obscure,
    this.suffix,
    this.onSubmitted,
  });
  Function(dynamic)? onSubmitted;

  String? hintText;
  Icon? suffix;
  bool obscure;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return ("This field can't be empty");
        }
      },
      onFieldSubmitted: onSubmitted,
      obscureText: obscure,
      onChanged: onchange,
      decoration: InputDecoration(
        suffixIcon: suffix, // Set the suffix icon here.

        // label: const Text('Email'),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorPallet.mainColor,
          ),
        ),
      ),
    );
  }
}
