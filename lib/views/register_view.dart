import 'package:chati_app/constants.dart';
import 'package:chati_app/widgets/custom_botton.dart';
import 'package:chati_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: 120,
                height: 120,
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
              // CustomTextField(
              //   hintText: 'Confirm your password',
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              CustomBotton(
                  //firebase auth =======>
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await authMethod();
                        // ignore: use_build_context_synchronously
                        showSnackBar(
                          context,
                          color: ColorPallet.mainColor,
                          message: 'Your email created successfully .',
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          // ignore: use_build_context_synchronously
                          showSnackBar(
                            context,
                            color: ColorPallet.secondColor,
                            message: 'The password provided is too weak.',
                          );
                        } else if (e.code == 'email-already-in-use') {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context,
                              color: ColorPallet.secondColor,
                              message: 'Email already exist');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  text: 'Register'),
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
      ),
    );
    ;
  }

  void showSnackBar(BuildContext context,
      {required Color color, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: color,
      ),
    );
  }

  Future<void> authMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
