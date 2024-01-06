import 'package:chati_app/constants.dart';
import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   CustomTextField({
//     this.hintText,
//     this.onchange,
//     required this.obscure,
//     this.suffix,
//     this.onSubmitted,
//   });
//   Function(dynamic)? onSubmitted;

//   String? hintText;
//   Icon? suffix;
//   bool obscure;
//   Function(String)? onchange;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ("This field can't be empty");
//         }
//       },
//       onFieldSubmitted: (value) {
//         if (onSubmitted != null) {
//           onSubmitted!(value);
//         }
//       },
//       obscureText: obscure,
//       onChanged: onchange,
//       decoration: InputDecoration(
//           suffixIcon: GestureDetector(
//           onTap: () {
//             if (onSubmitted != null) {
//               onSubmitted!(_textController.text);
//               _textController.clear();
//             }
//           },
//           child: suffix,
//         ), // Set the suffix icon here.

//         // label: const Text('Email'),
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: ColorPallet.mainColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText,
    this.onChanged,
    required this.obscure,
    this.suffix,
    this.onSubmitted,
    this.controller, // Add this line
  });

  final String? hintText;
  final Icon? suffix;
  final bool obscure;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller; // Add this line

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Set the controller here
      validator: (value) {
        if (value!.isEmpty) {
          return ("This field can't be empty");
        }
      },
      onFieldSubmitted: (value) {
        if (onSubmitted != null) {
          onSubmitted!(value);
          controller!.clear(); // Clear the text via the provided controller
        }
      },
      onChanged: onChanged,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            if (onSubmitted != null) {
              onSubmitted!(controller!.text);
              controller!.clear();
            }
          },
          child: suffix,
        ),
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
