// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:debate_box/pages/auth_page.dart';
import 'package:debate_box/pages/first_page.dart';
import 'package:debate_box/pages/home_page.dart';
import 'package:debate_box/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:debate_box/pages/search_page.dart';
import 'package:debate_box/pages/profile_page.dart';

// void main() {
//   runApp(const DebateBox());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DebateBox());
}

class DebateBox extends StatelessWidget {
  const DebateBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/first': (context) => FirstPage(),
          '/signup': (context) => SignUp(),
          '/home': (context) => HomePage(),
          '/search': (context) => SearchPage(),
          '/profile': (context) => ProfilePage(),
        },
        home: AuthPage());
  }
}
