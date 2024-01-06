import 'package:chati_app/constants.dart';
import 'package:chati_app/helpers/snak_bar.dart';
import 'package:chati_app/views/chat_screen.dart';
import 'package:chati_app/widgets/custom_botton.dart';
import 'package:chati_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;
  bool islooding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: islooding,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
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
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Enter your email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obscure: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Enter your password',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomBotton(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          islooding = true;
                        });

                        try {
                          await signInMethod();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, "ChatScreen");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(
                              context,
                              color: ColorPallet.secondColor,
                              message: 'No user found for that email.',
                            );
                          } else if (e.code == 'wrong-password') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context,
                                color: ColorPallet.secondColor,
                                message: 'Wrong password');
                          } else {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context,
                                color: ColorPallet.secondColor,
                                message: 'Something goes wrong');
                          }
                        } catch (e) {}
                        setState(() {
                          islooding = false;
                        });
                      }
                    },
                    text: 'Login'),
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
        ),
      ),
    );
  }

  Future<void> signInMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
