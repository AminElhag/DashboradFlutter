import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common/validation.dart';
import 'package:dashborad/common_widget/info_text_field.dart';
import 'package:dashborad/common_widget/round_button.dart';
import 'package:dashborad/features/home/presentations/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/img/app_icon.png"),
        leadingWidth: 150,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: context.width,
          height: context.height,
          color: Colors.white.withAlpha(50),
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/img/app_icon.png"),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Get Started with ",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "DashBoard",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Create your account",
                        style: TextStyle(fontSize: 10.0, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      InfoTextField(
                        textEditorController: _fullNameController,
                        hintText: "Your Full Name",
                        inputType: TextInputType.emailAddress,
                        validator: validateFullName,
                        hasPrefixIcon: true,
                        prefixIcon: Icons.person_2_outlined,
                      ),
                      InfoTextField(
                        textEditorController: _emailController,
                        hintText: "Email Address",
                        inputType: TextInputType.emailAddress,
                        validator: validateEmail,
                        hasPrefixIcon: true,
                        prefixIcon: Icons.email_outlined,
                      ),
                      InfoTextField(
                        textEditorController: _passwordController,
                        hintText: "Password",
                        inputType: TextInputType.text,
                        validator: validatePassword,
                        hasPrefixIcon: true,
                        prefixIcon: Icons.lock_outline,
                        hasSuffixIcon: true,
                        hasSuffixActions: true,
                        suffixOffIcon: Icons.lock_outline,
                        suffixOnIcon: Icons.lock_outline,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? ",
                                style: TextStyle(fontSize: 10)),
                            GestureDetector(
                              onTap: () {
                                // Navigate to sign-up screen
                                if (kDebugMode) {
                                  print("Navigate to sign-up");
                                }
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: RoundButton(
                            title: "Login",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Process valid email and password
                                if (kDebugMode) {
                                  print(
                                      "Valid email: ${_emailController.text}");
                                  print(
                                      "Valid password: ${_passwordController.text}");
                                }
                                Navigator.push(context, HomeScreen.route());
                              }
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            titleColor: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
