import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String participantLimit;

  const TopicTile({
    required this.title,
    required this.description,
    required this.time,
    required this.participantLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),

        padding: EdgeInsets.all(16), // Adjust padding as needed
        margin: EdgeInsets.symmetric(
            vertical: 8, horizontal: 16), // Adjust margin as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18, // Adjust font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8), // Add spacing between title and description
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
                height:
                    8), // Add spacing between description and time/participant
            Row(
              children: [
                Text(
                  'Time: $time',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 16), // Add spacing between time and participant
                Text(
                  'Participant Limit: $participantLimit',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(), // Add spacer to push button to the right
                ElevatedButton(
                  onPressed: () {
                    // Navigate to chat box screen when the button is pressed
                    // Implement this navigation logic as per your app's navigation setup
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text('Enter the Box'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
