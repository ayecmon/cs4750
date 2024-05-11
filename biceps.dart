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
      home: BicepExercisesPage(),
    );
  }
}
class BicepExercisesPage extends StatelessWidget {
  // Description for each exercise
  final String bicepCurlDescription = "The Dumbbell Bicep Curl is a fundamental exercise for building bicep strength and size. It targets the biceps brachii, providing a solid foundation for arm development.";
  final String hammerCurlDescription = "The Hammer Curl is another effective bicep exercise, focusing on the brachialis and brachioradialis muscles, providing a different angle of resistance compared to traditional bicep curls.";
  final String concentrationCurlDescription = "The Concentration Curl is an isolation exercise that allows for a deep contraction in the biceps, targeting muscle peaks and emphasizing the biceps' distinct shape.";

  // Instructions for each exercise
  final String bicepCurlInstructions = "1. Stand with your feet shoulder-width apart.\n"
      "2. Hold a dumbbell in each hand with your palms facing forward.\n"
      "3. Keep your elbows close to your torso and curl the dumbbells towards your shoulders.\n"
      "4. Hold briefly at the top, then slowly lower the dumbbells back to the starting position.\n\n"
      "Tip: Avoid swinging or using momentum. Focus on a controlled movement and keeping your elbows stationary.";

  final String hammerCurlInstructions = "1. Stand with your feet shoulder-width apart.\n"
      "2. Hold a dumbbell in each hand with your palms facing each other (neutral grip).\n"
      "3. Keep your elbows close to your body and curl the dumbbells toward your shoulders.\n"
      "4. Hold briefly at the top, then slowly lower the dumbbells back down.\n\n"
      "Tip: Keep your wrists straight and focus on the biceps and forearms.";

  final String concentrationCurlInstructions = "1. Sit on a bench with your legs spread apart.\n"
      "2. Hold a dumbbell in one hand and rest your elbow on the inside of your thigh.\n"
      "3. Curl the dumbbell toward your shoulder, focusing on squeezing the biceps.\n"
      "4. Hold briefly at the top, then slowly lower the dumbbell back down.\n\n"
      "Tip: Keep your elbow stationary and avoid leaning too far forward or backward.";

  // Image URLs for each exercise
  final String bicepCurlImageUrl = 'https://workouts4fitness.files.wordpress.com/2017/09/bicep-curls.gif';
  final String hammerCurlImageUrl = 'https://barbend.com/wp-content/uploads/2021/08/hammer-curl-barbend-movement-gif-masters.gif';
  final String concentrationCurlImageUrl = 'https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/03/Concentration-curl.gif?resize=600%2C600&ssl=1';

  // YouTube video URLs for each exercise
  final String bicepCurlVideoUrl = 'https://www.youtube.com/shorts/2jpteC44QKg';
  final String hammerCurlVideoUrl = 'https://www.youtube.com/shorts/0EWBnWyJV5U';
  final String concentrationCurlVideoUrl = 'https://www.youtube.com/shorts/cHxRJdSVIkA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biceps Exercises'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dumbbell Bicep Curl Section
            Text('Dumbbell Bicep Curl', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            MarkdownBody(data: bicepCurlDescription),
            SizedBox(height: 10),
            Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            MarkdownBody(data: bicepCurlInstructions),
            SizedBox(height: 10),
            Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Image.network(bicepCurlImageUrl),
            SizedBox(height: 10),
            Text('Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            InkWell(
              child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
              onTap: () async {
                if (await canLaunch(bicepCurlVideoUrl)) {
                  await launch(bicepCurlVideoUrl);
                } else {
                  throw 'Could not launch $bicepCurlVideoUrl';
                }
              },
            ),

            // Divider to separate the sections
            Divider(height: 30),

            // Hammer Curl Section
            Text('Hammer Curl', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            MarkdownBody(data: hammerCurlDescription),
            SizedBox(height: 10),
            Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            MarkdownBody(data: hammerCurlInstructions),
            SizedBox(height: 10),
            Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Image.network(hammerCurlImageUrl),
            SizedBox(height: 10),
            Text('Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            InkWell(
              child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
              onTap: () async {
                if (await canLaunch(hammerCurlVideoUrl)) {
                  await launch(hammerCurlVideoUrl);
                } else {
                  throw 'Could not launch $hammerCurlVideoUrl';
                }
              },
            ),

            // Divider to separate the sections
            Divider(height: 30),

            // Concentration Curl Section
            Text('Concentration Curl', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            MarkdownBody(data: concentrationCurlDescription),
            SizedBox(height: 10),
            Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            MarkdownBody(data: concentrationCurlInstructions),
            SizedBox(height: 10),
            Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Image.network(concentrationCurlImageUrl),
            SizedBox(height: 10),
            Text('Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            InkWell(
              child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
              onTap: () async {
                if (await canLaunch(concentrationCurlVideoUrl)) {
                  await launch(concentrationCurlVideoUrl);
                } else {
                  throw 'Could not launch $concentrationCurlVideoUrl';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
