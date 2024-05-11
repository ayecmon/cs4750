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
      home: glute_isolation(),
    );
  }
}
class glute_isolation extends StatelessWidget {
  // Descriptions for each exercise
  final String kickbackDescription = "The glute kickback is a great exercise for isolating the glutes. It can be performed with a cable machine, resistance bands, or bodyweight.";
  final String hyperextensionDescription = "Glute hyperextension is designed to target the glutes and lower back, typically performed on a hyperextension bench.";

  // Instructions for each exercise
  final String kickbackInstructions = "Setup: Attach an ankle strap to a low cable machine and connect it to one ankle. Stand facing the cable machine with a slight bend in your knees."
      "\nPositioning: Hold onto the cable machine for stability and extend your leg backward, squeezing your glute."
      "\nExecution: Avoid arching your back or using momentum. Keep the movement controlled."
      "\nRepetitions: Aim for 3-4 sets of 8-12 repetitions on each leg.";

  final String hyperextensionInstructions = "Setup: Adjust the hyperextension bench to your height. Lie face down with your hips at the edge."
      "\nPositioning: Keep your torso stable and your lower back straight."
      "\nExecution: Engage your glutes and lift your legs, focusing on the gluteal contraction."
      "\nRepetitions: Aim for 3-4 sets of 8-12 repetitions. Ensure controlled movement.";

  // Image URLs for each exercise
  final String kickbackImageUrl = 'https://cdn.shopify.com/s/files/1/1633/7705/files/standing_cable_glute_kickbacks_480x480.jpg?v=1633238678';
  final String hyperextensionImageUrl = 'https://www.tennisfitnesslove.com/wp-content/uploads/2016/06/hyperextensions-e1464804326492.jpg';

  // Video URLs for each exercise
  final String kickbackVideoUrl = 'https://www.youtube.com/shorts/E5C820rPOTA';
  final String hyperextensionVideoUrl = 'https://www.youtube.com/shorts/7-KnNTi8lmg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glute Isolation Exercises'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Glute Kickback Section
            Text('Glute Kickback', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            MarkdownBody(data: kickbackDescription),
            SizedBox(height: 20),
            Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            MarkdownBody(data: kickbackInstructions),
            SizedBox(height: 20),
            Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Image.network(kickbackImageUrl),
            SizedBox(height: 20),
            Text('Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            InkWell(
              child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
              onTap: () async {
                if (await canLaunch(kickbackVideoUrl)) {
                  await launch(kickbackVideoUrl);
                } else {
                  throw 'Could not launch $kickbackVideoUrl';
                }
              },
            ),

            // Divider for clarity between exercises
            Divider(height: 40),

            // Glute Hyperextension Section
            Text('Glute Hyperextension', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            MarkdownBody(data: hyperextensionDescription),
            SizedBox(height: 20),
            Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            MarkdownBody(data: hyperextensionInstructions),
            SizedBox(height: 20),
            Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Image.network(hyperextensionImageUrl),
            SizedBox(height: 20),
            Text('Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            InkWell(
              child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
              onTap: () async {
                if (await canLaunch(hyperextensionVideoUrl)) {
                  await launch(hyperextensionVideoUrl);
                } else {
                  throw 'Could not launch $hyperextensionVideoUrl';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
