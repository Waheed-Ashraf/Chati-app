import 'package:chati_app/constants.dart';
import 'package:chati_app/firebase_options.dart';
import 'package:chati_app/views/login.dart';
import 'package:chati_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: 'LoginScreen',
    );
  }
}
