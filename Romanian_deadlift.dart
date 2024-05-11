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
      home: RDLPage(),
    );
  }
}
class RDLPage extends StatelessWidget {
  final String description ="Primary Muscles Worked: Hamstrings, glutes, lower back (erector spinae).\nSecondary\nMuscles Worked: Core, forearms, shoulders (for stabilization)\nEquipment: Barbell or dumbbells.\nLevel: Intermediate to advanced." ;
  final String instructions ="Set Up\nEquipment:Choose between a barbell or dumbbells. Beginners might find dumbbells easier to control, while a barbell is better for heavier weights.\nFoot Placement:Stand with your feet hip-width apart, with your toes pointing straight ahead or slightly outward. This stance provides a stable base for the movement.\nGrip:If using a barbell, choose an overhand grip (palms facing down), with your hands slightly wider than shoulder-width. With dumbbells, hold them at your sides with your palms facing inwards."
      "\n\nPositioning\nBody Alignment:Keep your spine neutral (no rounding or excessive arching). Your head should be in line with your spine, and your shoulders pulled back and down.\nKnee Position:Keep your knees slightly bent. This is not a squat, so don't bend your knees too much. The focus is on the hips and hamstrings.\nHip Hinge:To hinge at the hips, imagine you are pushing your hips backward toward a wall. This movement should be slow and controlled."
      "\n\nExecution\nLowering Phase:Start by pushing your hips back, allowing the barbell or dumbbells to descend along the front of your thighs.Keep your back straight and shoulders retracted as you lower the weight.Aim to lower the weight to just below your knees or at mid-shin level, depending on your flexibility and strength. Feel the stretch in your hamstrings.\nLifting Phase:Engage your hamstrings and glutes to push your hips forward, lifting the barbell or dumbbells back up.Keep the weight close to your body and maintain a neutral spine as you return to the starting position.\nBreathing:Inhale as you lower the weight, and exhale as you lift it back up."
      "\n\nTips for Success\nControl the Movement:Avoid using momentum or jerky movements. Focus on a smooth, controlled motion throughout the exercise.\nMind Your Spine:Keep your back straight and your core engaged. If your back starts to round, lighten the weight and work on your form.\nStart Light:Begin with a manageable weight to ensure proper form, then gradually increase the weight as you gain confidence and strength.\nUse a Mirror or Trainer:Check your form in a mirror or get feedback from a trainer to avoid bad habits and reduce the risk of injury."
      "\n\nVariations\nSingle-Leg RDL:Perform the exercise on one leg at a time. This increases the demand on balance and stability.\nKettlebell RDL:Use a kettlebell instead of a barbell or dumbbells. This can change the dynamics of the lift due to the different weight distribution.\nRDL with Bands:Add resistance bands for additional tension, especially at the top of the lift.\nSumo RDL:Use a wider stance (sumo stance) to target the inner thighs and groin along with the hamstrings and glutes.";
  final String imageUrl = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.fitboot.com%2Fromanian-deadlift%2F&psig=AOvVaw1IM_GiekCFR7lRBR-1TB1g&ust=1715112623750000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCNDopNLq-YUDFQAAAAAdAAAAABAJ';
  final String youtubeVideoUrl = 'https://www.youtube.com/watch?v=WIcpu2UkJoY';

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
              'Romanian Deadlift',
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