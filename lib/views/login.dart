import 'package:chati_app/constants.dart';
import 'package:chati_app/widgets/custom_botton.dart';
import 'package:chati_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/images/chat.png',
                fit: BoxFit.contain,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chati App',
                  style: TextStyle(
                    fontFamily: 'RubikDoodleShadow',
                    fontSize: 30,
                    color: ColorPallet.mainColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              obscure: false,
              onchange: (data) {
                email = data;
              },
              hintText: 'Enter your email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              obscure: true,
              onchange: (data) {
                password = data;
              },
              hintText: 'Enter your password',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomBotton(ontap: () {}, text: 'Login'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'RegisterScreen');
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: ColorPallet.mainColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
