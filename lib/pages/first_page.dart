// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Center(
            child: Text(
              "DebateBox",
              style: TextStyle(
                  color: Colors.blue.shade300,
                  fontSize: 44,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              // color: Colors.amber,
              padding: EdgeInsets.only(left: 15),
              // height: 200,
              width: 250,
              child: Text(
                "Join dynamic debates with users world wide ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Image.asset(
            "images/home.png",
            width: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/signup');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 39, 127, 199),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(150, 10, 150, 10),
                ),
              ),
              child: Text(
                "Join",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
