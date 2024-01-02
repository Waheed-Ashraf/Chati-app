import 'package:chati_app/constants.dart';
import 'package:chati_app/widgets/custom_botton.dart';
import 'package:chati_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                'assets/images/email-marketing.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Enter your email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Enter your password',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Confirm your password',
            ),
            const SizedBox(
              height: 8,
            ),
            CustomBotton(text: 'Register'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, 'LoginScreen');
                  },
                  child: const Text(
                    'Login',
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
    ;
  }
}
