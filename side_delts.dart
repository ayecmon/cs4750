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
      home: SideDeltExercisesPage(),
    );
  }
}
class SideDeltExercisesPage extends StatelessWidget {
  // Descriptions for each exercise
  final String lateralRaiseDescription = "The Dumbbell Lateral Raise is a classic exercise for developing the side deltoids. It helps in building width and definition in the shoulders.";
  final String cableSideRaiseDescription = "The Cable Side Raise uses a cable machine to target the side delts. It provides continuous resistance throughout the movement, enhancing muscle engagement.";

  // Instructions for each exercise
  final String lateralRaiseInstructions = "1. Stand with your feet shoulder-width apart, holding a dumbbell in each hand by your sides.\n"
      "2. Keep a slight bend in your elbows and your palms facing your body.\n"
      "3. Raise the dumbbells out to the sides, stopping at shoulder height.\n"
      "4. Lower the dumbbells back down in a controlled manner.\n\n"
      "Tip: Avoid shrugging your shoulders or swinging the weights. Focus on the side delts and maintain a steady pace.";

  final String cableSideRaiseInstructions = "1. Attach a handle to a low cable machine.\n"
      "2. Stand with the machine to your side, holding the handle with the arm closest to the machine.\n"
      "3. Raise the handle outward, stopping at shoulder height.\n"
      "4. Lower the handle back down slowly.\n\n"
      "Tip: Keep your elbow slightly bent and avoid leaning away from the cable. Maintain a controlled movement for optimal engagement.";

  // Image URLs for each exercise
  final String lateralRaiseImageUrl = 'https://j.gifs.com/VA8JDo.gif?download=true';
  final String cableSideRaiseImageUrl = 'https://i.makeagif.com/media/2-14-2016/RDwbev.gif';

  // YouTube video URLs for each exercise
  final String lateralRaiseVideoUrl = 'https://www.youtube.com/shorts/G-piLwLu0d4';
  final String cableSideRaiseVideoUrl = 'https://www.youtube.com/shorts/X8tZOGFovj0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Side Delt Exercises'),
    ),
    body: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Lateral Raise Section
    Text('Dumbbell Lateral Raise', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    SizedBox(height: 10),
    MarkdownBody(data: lateralRaiseDescription),
    SizedBox(height: 10),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: lateralRaiseInstructions),
    SizedBox(height: 10),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(lateralRaiseImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(lateralRaiseVideoUrl)) {
      await launch(lateralRaiseVideoUrl);
    } else {
    throw 'Could not launch $lateralRaiseVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Cable Side Raise Section
    Text('Cable Side Raise', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: cableSideRaiseDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold)),
    MarkdownBody(data: cableSideRaiseInstructions),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(cableSideRaiseImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(cableSideRaiseVideoUrl)) {
    await launch(cableSideRaiseVideoUrl);
    } else {
    throw 'Could not launch $cableSideRaiseVideoUrl';
    }
    },
    ),
    ],
    ),
    ),
    );
    }
    }
