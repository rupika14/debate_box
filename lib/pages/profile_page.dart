// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:debate_box/components/signup_textfield.dart';
import 'package:debate_box/components/signin_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final fName = TextEditingController();
  final lName = TextEditingController();
  final bio = TextEditingController();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151515),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              inputBox(
                "First Name",
                false,
                fName,
              ),
              SizedBox(
                height: 30,
              ),
              inputBox(
                "Last Name",
                false,
                lName,
              ),
              SizedBox(
                height: 30,
              ),
              inputBox(
                "Bio",
                false,
                bio,
              ),
              SizedBox(
                height: 30,
              ),
              MyButton(
                onPressed: () {},
                content: "Update",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
