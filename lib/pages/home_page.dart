// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:debate_box/components/topic_dialogbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:debate_box/components/new_tile.dart';
import 'package:debate_box/components/icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> topics = [];

  void addTopic(
      String title, String description, String time, String participantLimit) {
    setState(() {
      topics.add({
        'title': title,
        'description': description,
        'time': time,
        'participantLimit': participantLimit,
      });
    });
  }

  void _showTopicCreationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return TopicCreation(
          addTopic: addTopic,
        );
      },
    );
  }

  @override

  // Sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/signup');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151515),
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body: SafeArea(
        child: ListView(
          children: [
            // Add existing TopicTiles
            for (var topic in topics)
              TopicTile(
                title: topic['title'] ?? '',
                description: topic['description'] ?? '',
                time: topic['time'] ?? '',
                participantLimit: topic['participantLimit'] ?? '',
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              icon: Icons.home,
            ),
            MyIconButton(
              onPressed: () => Navigator.pushNamed(context, '/search'),
              icon: Icons.search,
            ),
            MyIconButton(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              icon: Icons.person,
            ),
            MyIconButton(
              onPressed: () => signUserOut(),
              icon: Icons.logout,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTopicCreationDialog(context),
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/*
Scaffold(
      backgroundColor: Color(0xFF151515),
      // Bottom Bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                icon: Icons.home),
            MyIconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                icon: Icons.search),
            MyIconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icons.person),
            MyIconButton(onPressed: () => signUserOut(), icon: Icons.logout),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Loggedin",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTopicCreationDialog(context);
        },
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
*/
