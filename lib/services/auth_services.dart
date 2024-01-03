// import 'package:chati_app/views/register_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthServices {
//   void showSnackBar(BuildContext context,
//       {required Color color, required String message}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         duration: const Duration(seconds: 4),
//         content: Text(
//           message,
//           style: const TextStyle(color: Colors.black),
//         ),
//         backgroundColor: color,
//       ),
//     );
//   }

//   Future<void> authMethod() async {
//     UserCredential user = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//             email: RegisterScreen().email!,
//             password: RegisterScreen().password!);
//   }
// }
