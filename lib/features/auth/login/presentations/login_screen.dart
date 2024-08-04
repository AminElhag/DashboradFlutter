import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common/validation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isShowPassword = false;

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
      body: Container(
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
                    Text(
                      "Welcome back!",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Login to youe account",
                      style: TextStyle(fontSize: 10.0, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: 300,
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            hintText: "Email Address",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black.withAlpha(80),
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: validateEmail,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: 300,
                        child: TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: !_isShowPassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.black.withAlpha(80),
                              size: 20,
                            ),
                            suffixIcon: (_isShowPassword)
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isShowPassword = !_isShowPassword;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.black.withAlpha(80),
                                      size: 20,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isShowPassword = !_isShowPassword;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.black.withAlpha(80),
                                      size: 20,
                                    )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: validatePassword,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Recover Password",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Theme.of(context).primaryColor),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",
                              style: TextStyle(fontSize: 10)),
                          GestureDetector(
                            onTap: () {
                              // Navigate to sign-up screen
                              print("Navigate to sign-up");
                            },
                            child: Text(
                              "Sign up",
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
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process valid email and password
                            print("Valid email: ${_emailController.text}");
                            print(
                                "Valid password: ${_passwordController.text}");
                          }
                        },
                        minWidth: double.maxFinite,
                        elevation: 0,
                        color: Theme.of(context).primaryColor,
                        height: 50,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
    );
  }
}
