import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Use a custom font
      ),
      home: HipThrustPage(),
    );
  }
}
class HipThrustPage extends StatelessWidget {
  final String description = 'The hip thrust is an effective exercise for strengthening the glutes and building lower body strength. It specifically targets the gluteus maximus, while also engaging the hamstrings, quadriceps, and core muscles. It is a popular exercise for improving athletic performance, building muscle mass, and enhancing aesthetic appearance.Equipment: You will need a barbell, weight plates, and a bench or platform.';
  final String instructions = "Setup: Place a barbell on the floor in front of a bench or a platform."
      "\nSit on the floor with your back against the bench and your legs bent, feet flat on the floor about shoulder-width apart.Roll the barbell over your legs until it rests in the crease of your hips.\nIf needed, use a pad or a rolled-up towel to cushion the barbell for comfort."
      "\n\nPositioning: Lean back against the bench, with your shoulder blades resting on the edge. \nYour upper back and head should be supported, but your lower back should remain free.\nAdjust your feet to ensure they are flat on the ground, about shoulder-width apart, with your knees at a 90-degree angle when at the top of the movement."
      "\n\nExecution: Engage your core, squeeze your glutes, and press your feet into the floor.\nDrive your hips upward, lifting the barbell while keeping your shoulders on the bench.\nYour torso should create a straight line from your knees to your shoulders at the top of the movement.\nEnsure that your chin is tucked slightly and your gaze is forward to avoid hyperextending your neck.\nHold at the top for a second, ensuring your glutes are fully engaged.\nSlowly lower your hips back down to the starting position, without touching the floor, maintaining tension in your glutes.\nRepetitions and Sets:Aim for 3-4 sets of 8-12 repetitions, depending on your fitness level and goals.\nRest for 1-2 minutes between sets to maintain good form and strength."
      "\n\nTips for Success:Focus on using your glutes to lift the weight, rather than arching your lower back.If you're new to this exercise, start with lighter weight or just bodyweight to learn the correct form.\nUse a mirror or get feedback from a trainer to ensure proper form."
      "\n\nVariations\nSingle-Leg Hip Thrust: Perform the exercise with one leg lifted, adding an extra challenge for stability and strength.\nBanded Hip Thrust: Add a resistance band around your thighs to engage the gluteus medius and improve hip stability.";
  final String imageUrl = 'https://cdn.shopify.com/s/files/1/2350/9323/files/Barbell_Hip_Thrust_480x480.jpg?v=1676877503';
  final String youtubeVideoUrl = 'https://www.youtube.com/watch?v=xDmFkJxPzeM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: Text(
            'Hip Thrust',
            style: TextStyle(
              // Color must be white for this to work
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightBlueAccent,
              Colors.white,
    ],
    ),
    ),
    child: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            MarkdownBody(data: description),
            SizedBox(height: 20),
            Text(
              'Instructions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            MarkdownBody(data: instructions),
            SizedBox(height: 20),
            Text(
              'Image',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(imageUrl),
            SizedBox(height: 20),
            Text(
              'Video',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            InkWell(
              child: Text(
                'Watch the video',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () async {
                if (await canLaunch(youtubeVideoUrl)) {
                  await launch(youtubeVideoUrl);
                } else {
                  throw 'Could not launch $youtubeVideoUrl';
                }
              },
            ),
          ],
        ),
      ),
      )
    );
  }
}