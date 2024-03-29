// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:debate_box/components/signup_textfield.dart';
import 'package:debate_box/components/signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Text editing Controllers+

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign user in
  // void signUserIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  // }

  // Sign user in
  void signUserIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to the home page
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      // Handle sign-in errors, if any
      print("Sign-in error: $e");
      // Show a snackbar or any other error indication to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151515),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
              inputBox("Email ", false, emailController),
              SizedBox(
                height: 15,
              ),
              inputBox("Password", true, passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white54),
                    ),
                  )
                ],
              ),
              // Sign in Button
              MyButton(
                onPressed: () => signUserIn(context),
                content: "Sign in",
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Or continue with",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Image.asset(
                  'images/google.png',
                  height: 60,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.white54),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Register Now",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
