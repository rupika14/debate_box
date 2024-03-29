import 'package:debate_box/components/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:debate_box/pages/home_page.dart';

class TopicCreation extends StatelessWidget {
  final void Function(String, String, String, String) addTopic;
  TopicCreation({super.key, required this.addTopic});

  @override
  final title = TextEditingController();
  final description = TextEditingController();
  final time = TextEditingController();
  final particpants = TextEditingController();
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF151515),
      title: Text("Create Topic"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          inputBox("Topic Title", false, title),
          SizedBox(height: 10),
          inputBox("Description", false, description),
          SizedBox(height: 10),
          inputBox("Time", false, time),
          SizedBox(height: 10),
          inputBox("Participant Limit", false, particpants),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            // Call addTopic function and pass the entered values
            addTopic(
              title.text,
              description.text,
              time.text,
              particpants.text,
            );
            Navigator.of(context).pop();
          },
          child: Text(
            'Create',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
