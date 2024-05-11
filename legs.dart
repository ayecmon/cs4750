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
      home: LegExercisesPage(),
    );
  }
}
class LegExercisesPage extends StatelessWidget {
  // Descriptions for each exercise
  final String squatDescription = "The Squat is a compound exercise targeting the quadriceps, glutes, and hamstrings. It is a fundamental exercise for building strength and muscle mass in the legs.";
  final String legCurlDescription = "The Leg Curl targets the hamstrings, isolating the muscles at the back of the thighs. It is typically performed on a machine designed for this exercise.";
  final String gluteBridgeDescription = "The Glute Bridge targets the glutes while also engaging the hamstrings. It's a bodyweight exercise that can be made more challenging with weights or resistance bands.";
  final String calfRaiseDescription = "The Calf Raise focuses on the calves, specifically the gastrocnemius and soleus. It can be performed with bodyweight or additional resistance like dumbbells.";
  final String adductorMachineDescription = "The Adductor Machine targets the adductor muscles on the inner thighs. It helps to improve hip stability and strength.";

  // Instructions for each exercise
  final String squatInstructions = "1. Stand with your feet shoulder-width apart.\n"
      "2. Lower your hips as if sitting back into a chair, keeping your chest up and back straight.\n"
      "3. Bend your knees until your thighs are parallel to the ground or lower.\n"
      "4. Push through your heels to return to the starting position.\n\n"
      "Tip: Keep your knees tracking over your toes and avoid rounding your back.";

  final String legCurlInstructions = "1. Lie face down on a leg curl machine, hooking your heels under the footpads.\n"
      "2. Bend your knees to curl the footpads toward your glutes.\n"
      "3. Hold briefly at the top, then slowly lower the weight back down.\n\n"
      "Tip: Keep your hips pressed against the bench to avoid lifting your hips.";

  final String gluteBridgeInstructions = "1. Lie on your back with your knees bent and feet flat on the floor.\n"
      "2. Push through your heels to lift your hips, forming a straight line from your knees to your shoulders.\n"
      "3. Squeeze your glutes at the top, then lower your hips back down.\n\n"
      "Tip: Avoid arching your lower back excessively. Focus on squeezing the glutes.";

  final String calfRaiseInstructions = "1. Stand with your feet shoulder-width apart, toes pointing forward.\n"
      "2. Raise your heels to stand on your toes, keeping your knees slightly bent.\n"
      "3. Hold briefly at the top, then slowly lower your heels back down.\n\n"
      "Tip: Perform the exercise on a raised platform for a greater range of motion.";

  final String adductorMachineInstructions = "1. Sit on the adductor machine with your legs resting against the pads.\n"
      "2. Squeeze your legs together to bring the pads closer.\n"
      "3. Hold briefly at the top, then slowly allow the pads to return to the starting position.\n\n"
      "Tip: Keep your back straight and avoid leaning forward.";

  // Image URLs for each exercise
  final String squatImageUrl = 'https://www.journalmenu.com/wp-content/uploads/2017/11/front-squat-gif-side-view-slow-motion-front-squat-technique.gif';
  final String legCurlImageUrl = 'https://i.makeagif.com/media/7-15-2015/8Nk9oa.gif';
  final String gluteBridgeImageUrl = 'https://www.shape.com/thmb/7bYY5YSWWi5tV5eaWTDNMKNdjWI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/glute-bridge-f18ea3dea1f9427a82688d1669701b17.gif';
  final String calfRaiseImageUrl = 'https://cdn.jefit.com/assets/img/exercises/gifs/142.gif';
  final String adductorMachineImageUrl = 'https://cdn.jefit.com/assets/img/exercises/gifs/217.gif';

  // YouTube video URLs for each exercise
  final String squatVideoUrl = 'https://www.youtube.com/watch?v=gcNh17Ckjgg';
  final String legCurlVideoUrl = 'https://www.youtube.com/shorts/ANKSmhT0dTk';
  final String gluteBridgeVideoUrl = 'https://www.youtube.com/shorts/2-47T-U82KU';
  final String calfRaiseVideoUrl = 'https://www.youtube.com/shorts/fOfPwmb5FXU';
  final String adductorMachineVideoUrl = 'https://www.youtube.com/shorts/LM_NZjWAsSo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Leg Exercises'),
    ),
    body: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Squat Section
    Text('Squat', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: squatDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: squatInstructions),
    Image.network(squatImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(squatVideoUrl)) {
    await launch(squatVideoUrl);
    } else {
      throw 'Could not launch $squatVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Leg Curl Section
    Text('Leg Curl', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: legCurlDescription),
    MarkdownBody(data: legCurlInstructions),
    Image.network(legCurlImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(legCurlVideoUrl)) {
    await launch(legCurlVideoUrl);
    } else {
    throw 'Could not launch $legCurlVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Glute Bridge Section
    Text('Glute Bridge', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: gluteBridgeDescription),
    MarkdownBody(data: gluteBridgeInstructions),
    Image.network(gluteBridgeImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(gluteBridgeVideoUrl)) {
    await launch(gluteBridgeVideoUrl);
    } else {
    throw 'Could not launch $gluteBridgeVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Calf Raise Section
    Text('Calf Raise', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
    MarkdownBody(data: calfRaiseDescription),
    MarkdownBody(data: calfRaiseInstructions),
    Image.network(calfRaiseImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(calfRaiseVideoUrl)) {
    await launch(calfRaiseVideoUrl);
    } else {
    throw 'Could not launch $calfRaiseVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Adductor Machine Section
    Text('Adductor Machine', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: adductorMachineDescription),
    MarkdownBody(data: adductorMachineInstructions),
    Image.network(adductorMachineImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(adductorMachineVideoUrl)) {
    await launch(adductorMachineVideoUrl);
    } else {
    throw 'Could not launch $adductorMachineVideoUrl';
    }
    },
    ),
    ],
    ),
    ),
    );
    }
    }
