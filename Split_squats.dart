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
      home: SplitSquatsPage(),
    );
  }
}
class SplitSquatsPage extends StatelessWidget {
  final String description ="The Bulgarian Split Squat is a lower body exercise that targets the quadriceps, glutes, hamstrings, and stabilizing muscles. It's a single-leg exercise that also improves balance, coordination, and core stability. Here's a comprehensive guide, breaking down the exercise into sections: Set Up, Positioning, Execution, Tips for Success, and Variations.";
  final String instructions ="Set Up\n\nEquipment:You'll need a bench, step, or sturdy platform about knee-height to rest your back foot on.Optional: Dumbbells, kettlebells, or a barbell for added resistance.\nStarting Position:Stand about 2-3 feet in front of the bench with your back facing it.Place the top of your back foot (the shoelaces) on the bench. You can also use the ball of your foot if that's more comfortable.\nPositioning\nFoot Placement:Your front foot should be facing forward, with your knee aligned over your toes.Adjust the distance from the bench to find a comfortable position where you can lunge without straining.Body Alignment:Keep your torso upright, shoulders relaxed, and core engaged.Your back leg should be relaxed, allowing the front leg to do the work."
      "\n\nExecution\nLowering Phase:Begin by bending your front knee, lowering your body toward the floor.Aim to keep your front knee aligned with your toes and your back straight.Your back knee should drop toward the ground but should not touch it.\nDepth:Lower until your front thigh is approximately parallel to the ground. Adjust based on flexibility and comfort.Keep your front heel on the ground; don't let it lift.\nLifting Phase:Push through your front heel to return to the starting position.Keep your torso upright and avoid leaning forward excessively.\nBreathing:Inhale as you lower your body and exhale as you lift back up."
      "\n\nTips for Success\nStability:If you struggle with balance, hold onto a wall or use a stability bar.\nControl:Perform the exercise with a controlled movement. Avoid bouncing or jerking.\nAlignment:Ensure your front knee doesn't cave inward or go too far past your toes.Keep it aligned with your toes.\nStart Light:If you're new to the Bulgarian Split Squat, start with bodyweight to master the form before adding weights.\nCheck Your Back Leg:Don't overly stress the back knee. It should move naturally, not bearing too much weight."
      "\n\nVariations\nDumbbell Bulgarian Split Squat:Hold a dumbbell in each hand by your sides for added resistance.Barbell Bulgarian Split Squat:Use a barbell on your upper back (as in a back squat) for increased resistance.\nKettlebell Bulgarians split Squat:Hold a kettlebell at chest level (goblet-style) for a different feel and center of gravity.\nPlyometric Bulgarian Split Squat:Perform the squat with a jump at the top for increased intensity and power training.\nBosu Ball Bulgarian Split Squat:Place your front foot on a Bosu ball to increase the balance challenge.";
  final String imageUrl = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.burnthefatinnercircle.com%2Fpublic%2FBulgarian-Split-Squats.cfm&psig=AOvVaw0FbmhT_H2xlTO1129GyqAP&ust=1715114247385000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIjnl9Xw-YUDFQAAAAAdAAAAABAp';
  final String youtubeVideoUrl = 'https://www.youtube.com/shorts/5C7Ns59C17Q';

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
              'Bulgarian Split Squats',
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
                Colors.white70,
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