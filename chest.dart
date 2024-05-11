import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChestExercisesPage(),
    );
  }
}

class ChestExercisesPage extends StatelessWidget {
  // Descriptions for each exercise
  final String benchPressDescription = "The Bench Press is a compound exercise that primarily targets the pectoralis major (chest), while also engaging the triceps and deltoids. It is a foundational exercise for upper body strength.";
  final String chestFlyDescription = "The Chest Fly is an isolation exercise that focuses on the chest muscles. It can be performed with dumbbells or a cable machine, emphasizing chest definition and muscle development.";

  // Instructions for each exercise
  final String benchPressInstructions = "1. Lie on a flat bench with your feet flat on the floor.\n"
      "2. Grip the barbell with hands slightly wider than shoulder-width, palms facing forward.\n"
      "3. Lower the barbell to your chest, keeping your elbows at a 45-degree angle.\n"
      "4. Press the barbell back up, extending your arms fully without locking your elbows.\n\n"
      "Tip: Keep your core engaged and avoid arching your back excessively. Focus on using your chest to push the barbell up.";

  final String chestFlyInstructions = "1. Lie on a flat bench holding dumbbells with your arms extended above your chest, palms facing each other.\n"
      "2. With a slight bend in your elbows, lower the dumbbells to the sides in a wide arc.\n"
      "3. Keep your elbows slightly bent as you lower, focusing on the stretch in your chest.\n"
      "4. Raise the dumbbells back to the starting position in a controlled manner.\n\n"
      "Tip: Avoid locking your elbows or using momentum. Maintain a smooth and controlled movement throughout.";

  // Image URLs for each exercise
  final String benchPressImageUrl = 'https://i.makeagif.com/media/9-21-2015/UV5LiJ.gif';
  final String chestFlyImageUrl = 'https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/03/Dumbbell-Chest-Fly.gif?fit=600%2C600&ssl=1';

  // YouTube video URLs for each exercise
  final String benchPressVideoUrl = 'https://www.youtube.com/shorts/VXjPjzEjRSU';
  final String chestFlyVideoUrl = 'https://www.youtube.com/watch?v=Nhvz9EzdJ4U';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Chest Exercises'),
    ),
    body: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Bench Press Section
    Text('Bench Press', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: benchPressDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: benchPressInstructions),
    Image.network(benchPressImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(benchPressVideoUrl)) {
    await launch(benchPressVideoUrl);
    } else {
    throw 'Could not launch $benchPressVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Chest Fly Section
    Text('Chest Fly', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: chestFlyDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: chestFlyInstructions),
    Image.network(chestFlyImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(chestFlyVideoUrl)) {
    await launch(chestFlyVideoUrl);
    } else {
      throw 'Could not launch $chestFlyVideoUrl';
    }
    },
    ),
    ],
    ),
    ),
    );
    }
    }
