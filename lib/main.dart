import 'package:chati_app/constants.dart';
import 'package:chati_app/views/login.dart';
import 'package:chati_app/views/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPallet.mainColor),
      ),
      routes: {
        'LoginScreen': (context) => const LoginScreen(),
        'RegisterScreen': (context) => const RegisterScreen(),
      },
      initialRoute: 'Login',
    );
  }
}
