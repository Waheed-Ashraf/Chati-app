import 'package:chati_app/constants.dart';
import 'package:chati_app/helpers/snak_bar.dart';
import 'package:chati_app/widgets/custom_botton.dart';
import 'package:chati_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                        setState(() {
                          islooding = true;
                        });

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
                          } else {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context,
                                color: ColorPallet.secondColor,
                                message: 'Something goes wrong');
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          islooding = false;
                        });
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
      ),
    );
  }

  Future<void> authMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
