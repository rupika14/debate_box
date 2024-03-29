// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String content;
  const MyButton({super.key, required this.onPressed, required this.content});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      // () {

      //   Navigator.pop(context);
      //   Navigator.pushNamed(context, '/home');
      // },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            // Color.fromARGB(255, 39, 127, 199),
            Colors.black),
        padding: MaterialStatePropertyAll(
          EdgeInsets.fromLTRB(160, 20, 160, 20),
        ),
      ),
      child: Text(
        content,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
