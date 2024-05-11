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
      home: FrontDeltExercisesPage(),
    );
  }
}
class FrontDeltExercisesPage extends StatelessWidget {
  // Descriptions for each exercise
  final String frontRaiseDescription = "The Dumbbell Front Raise targets the front deltoids, emphasizing shoulder strength and definition. It is a basic yet effective exercise for the front shoulder.";
  final String overheadPressDescription = "The Barbell Overhead Press is a compound exercise targeting the front deltoids, along with other shoulder muscles. It requires a barbell and engages more muscles for stability.";
  final String arnoldPressDescription = "The Arnold Press is a unique variation of the overhead press, named after Arnold Schwarzenegger. It engages the front deltoids through a rotational movement, providing a dynamic shoulder exercise.";

  // Instructions for each exercise
  final String frontRaiseInstructions = "1. Stand with your feet shoulder-width apart, holding a dumbbell in each hand.\n"
      "2. Keep your arms extended in front of your thighs, palms facing down.\n"
      "3. Raise the dumbbells to shoulder height, maintaining a slight bend in your elbows.\n"
      "4. Lower the dumbbells back down in a controlled manner.\n\n"
      "Tip: Avoid swinging or using momentum. Keep your core engaged for stability.";

  final String overheadPressInstructions = "1. Stand with your feet shoulder-width apart, holding a barbell at shoulder height with palms facing forward.\n"
      "2. Engage your core and press the barbell upward until your arms are fully extended.\n"
      "3. Lower the barbell back to shoulder height in a controlled manner.\n\n"
      "Tip: Keep your back straight and avoid leaning back during the press.";

  final String arnoldPressInstructions = "1. Sit on a bench with back support, holding dumbbells at shoulder height with your palms facing toward you.\n"
      "2. As you press upward, rotate the dumbbells, so your palms face outward at the top.\n"
      "3. Lower the dumbbells, reversing the rotation, until you're back at shoulder height.\n\n"
      "Tip: Focus on the rotation and maintain control throughout the movement.";

  // Image URLs for each exercise
  final String frontRaiseImageUrl = 'https://gymvisual.com/img/p/2/4/9/4/0/24940.gif';
  final String overheadPressImageUrl = 'https://www.nerdfitness.com/wp-content/uploads/2014/05/military-press.gif';
  final String arnoldPressImageUrl = 'https://barbend.com/wp-content/uploads/2023/10/seated-dumbbell-shoulder-press-barbend-movement-gif-masters-2.gif';

  // YouTube video URLs for each exercise
  final String frontRaiseVideoUrl = 'https://www.youtube.com/shorts/yHx8wPv4RPo';  // Replace with a valid YouTube video URL
  final String overheadPressVideoUrl = 'https://www.youtube.com/shorts/iGOOXBd2J6w';  // Replace with a valid YouTube video URL
  final String arnoldPressVideoUrl = 'https://www.youtube.com/shorts/6K_N9AGhItQ';  // Replace with a valid YouTube video URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Front Delt Exercises'),
    ),
    body: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Dumbbell Front Raise Section
    Text('Dumbbell Front Raise', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    SizedBox(height: 10),
    MarkdownBody(data: frontRaiseDescription),
    SizedBox(height: 10),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: frontRaiseInstructions),
    SizedBox(height: 10),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(frontRaiseImageUrl),
    SizedBox(height: 10),
    Text('Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(frontRaiseVideoUrl)) {
    await launch(frontRaiseVideoUrl);
    } else {
    throw 'Could not launch $frontRaiseVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Barbell Overhead Press Section
    Text('Barbell Overhead Press', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: overheadPressDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: overheadPressInstructions),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(overheadPressImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    onTap: () async {
    if (await canLaunch(overheadPressVideoUrl)) {
    await launch(overheadPressVideoUrl);
    } else {
    throw 'Could not launch $overheadPressVideoUrl';
      }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Arnold Press Section
    Text('Arnold Press', style: TextStyle(fontSize: 24, fontWeight:FontWeight.bold)),
    MarkdownBody(data: arnoldPressDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: arnoldPressInstructions),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold)),
    Image.network(arnoldPressImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    onTap: () async {
    if (await canLaunch(arnoldPressVideoUrl)) {
      await launch(arnoldPressVideoUrl);
    } else {
    throw 'Could not launch $arnoldPressVideoUrl';
    }
    },
    ),
    ],
    ),
    ),
    );
    }
    }
