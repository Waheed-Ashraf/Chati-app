import 'package:chati_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hintText, required this.onchange, required this.obscure});
  String hintText;
  bool obscure;
  Function(String) onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return ("This field can't be empty");
        }
      },
      obscureText: obscure,
      onChanged: onchange,
      decoration: InputDecoration(
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
