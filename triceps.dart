import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arm Workout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TricepsExercisesPage(),
    );
  }
}
class TricepsExercisesPage extends StatelessWidget {
  // Descriptions for each exercise
  final String tricepsPushdownDescription = "The Triceps Pushdown, typically done on a cable machine, is an effective exercise for targeting the triceps. It allows for controlled movement and varying resistance.";
  final String overheadTricepsExtensionDescription = "The Overhead Triceps Extension, which can be done with a dumbbell or barbell, targets the long head of the triceps. It is ideal for building triceps strength and muscle mass.";

  // Instructions for each exercise
  final String tricepsPushdownInstructions = "1. Attach a straight bar or rope attachment to a high cable pulley.\n"
      "2. Stand with your feet shoulder-width apart, holding the bar with an overhand grip (palms down).\n"
      "3. Pull the bar down until your arms are fully extended, keeping your elbows close to your body.\n"
      "4. Return to the starting position in a controlled manner.\n\n"
      "Tip: Avoid locking your elbows or allowing your shoulders to move. Focus on the triceps throughout the exercise.";

  final String overheadTricepsExtensionInstructions = "1. Hold a dumbbell with both hands and lift it above your head.\n"
      "2. Keep your elbows pointing forward and close to your head.\n"
      "3. Lower the dumbbell behind your head, bending your elbows.\n"
      "4. Extend your arms to lift the dumbbell back up, focusing on contracting the triceps.\n\n"
      "Tip: Keep your upper arms stationary, only allowing the elbows to bend. Avoid arching your back.";

  // Image URLs for each exercise
  final String tricepsPushdownImageUrl = 'https://blog.squatwolf.com/wp-content/uploads/2021/05/ezgif.com-gif-maker-1.gif';
  final String overheadTricepsExtensionImageUrl = 'https://legionathletics.com/wp-content/uploads/2022/08/450x338-half.gif';

  // YouTube video URLs for each exercise
  final String tricepsPushdownVideoUrl = 'https://www.youtube.com/shorts/NOtjjNrts8M';
  final String overheadTricepsExtensionVideoUrl = 'https://www.youtube.com/shorts/T3e390Dl3XU';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Triceps Exercises'),
    ),
    body: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Triceps Pushdown Section
    Text('Triceps Pushdown', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: tricepsPushdownDescription),
    SizedBox(height: 10),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: tricepsPushdownInstructions),
    SizedBox(height: 10),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(tricepsPushdownImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(tricepsPushdownVideoUrl)) {
      await launch(tricepsPushdownVideoUrl);
    } else {
    throw 'Could not launch $tricepsPushdownVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Overhead Triceps Extension Section
    Text('Overhead Triceps Extension', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: overheadTricepsExtensionDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: overheadTricepsExtensionInstructions),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(overheadTricepsExtensionImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(overheadTricepsExtensionVideoUrl)) {
    await launch(overheadTricepsExtensionVideoUrl);
    } else {
    throw 'Could not launch $overheadTricepsExtensionVideoUrl';
    }
    },
    ),
    ],
    ),
    ),
    );
    }
    }
