import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/features/auth/services/authService.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:amazon_clone/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../common/widgets/custom_textfield.dart';

enum AuthType { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthType _auth = AuthType.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthService authService = AuthService();

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text style should be in app_style.dart
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  tileColor: _auth == AuthType.signup
                      ? Styles.backgroundColor
                      : Styles.greyBackgroundCOlor,
                  title: const Text(
                    "Create account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Styles.secondaryColor,
                    value: AuthType.signup,
                    groupValue: _auth,
                    onChanged: (AuthType? value) {
                      setState(() {
                        _auth = value!;
                      });
                    },
                  ),
                ),
                if (_auth == AuthType.signup)
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getWidth(8),
                        vertical: AppLayout.getHeight(8)),
                    color: Styles.backgroundColor,
                    child: Form(
                      key: _signupFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            hintText: "Name",
                          ),
                          Gap(AppLayout.getHeight(10)),
                          CustomTextField(
                            controller: _emailController,
                            hintText: "Email",
                          ),
                          Gap(AppLayout.getHeight(10)),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: "Password",
                          ),
                          Gap(AppLayout.getHeight(10)),
                          CustomButton(
                              text: "Sign Up",
                              onPressed: () {
                                if (_signupFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  tileColor: _auth == AuthType.signin
                      ? Styles.backgroundColor
                      : Styles.greyBackgroundCOlor,
                  title: Text(
                    "Sign-In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Styles.secondaryColor,
                    value: AuthType.signin,
                    groupValue: _auth,
                    onChanged: (AuthType? value) {
                      setState(() {
                        _auth = value!;
                      });
                    },
                  ),
                ),
                if (_auth == AuthType.signin)
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getWidth(8),
                        vertical: AppLayout.getHeight(8)),
                    color: Styles.backgroundColor,
                    child: Form(
                      key: _signinFormKey,
                      child: Column(
                        children: [
                          Gap(AppLayout.getHeight(10)),
                          CustomTextField(
                            controller: _emailController,
                            hintText: "Email",
                          ),
                          Gap(AppLayout.getHeight(10)),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: "Password",
                          ),
                          Gap(AppLayout.getHeight(10)),
                          CustomButton(
                              text: "Sign In",
                              onPressed: () {
                                if (_signinFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              })
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
