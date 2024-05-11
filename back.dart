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
      home: BackExercisesPage(),
    );
  }
}

class BackExercisesPage extends StatelessWidget {
  // Descriptions for each exercise
  final String latPulldownDescription = "The Lat Pulldown targets the latissimus dorsi, providing a great way to build a broader back. It also engages the biceps and upper back muscles.";
  final String seatedCableRowDescription = "The Seated Cable Row focuses on the middle back, specifically the rhomboids and trapezius. It's a great exercise for developing a strong, thick back.";
  final String backExtensionDescription = "The Back Extension, or hyperextension, targets the lower back (erector spinae). It is an effective exercise for building lower back strength and stability.";

  // Instructions for each exercise
  final String latPulldownInstructions = "1. Sit on the lat pulldown machine and adjust the thigh pad for stability.\n"
      "2. Grab the bar with a wide grip, palms facing forward.\n"
      "3. Pull the bar down toward your upper chest, keeping your back straight.\n"
      "4. Hold briefly at the bottom, then slowly return the bar to the starting position.\n\n"
      "Tip: Avoid swinging or leaning back excessively. Focus on engaging the lats and keeping your core tight.";

  final String seatedCableRowInstructions = "1. Sit at a cable row machine with your feet on the footplates.\n"
      "2. Hold the handle with both hands, palms facing inward.\n"
      "3. Pull the handle toward your lower chest, keeping your elbows close to your body.\n"
      "4. Hold briefly, then return to the starting position in a controlled manner.\n\n"
      "Tip: Keep your back straight and avoid rounding your shoulders. Focus on squeezing the middle back.";

  final String backExtensionInstructions = "1. Lie face down on a hyperextension bench, with your hips aligned with the edge.\n"
      "2. Hook your ankles under the footpads and cross your arms over your chest.\n"
      "3. Slowly lift your upper body until your body forms a straight line.\n"
      "4. Hold briefly, then return to the starting position.\n\n"
      "Tip: Avoid overextending your back. Keep the movement controlled and focus on engaging the lower back.";

  // Image URLs for each exercise
  final String latPulldownImageUrl = 'https://legionathletics.com/wp-content/uploads/2022/01/Lat-Pulldown.gif';
  final String seatedCableRowImageUrl = 'https://legionathletics.com/wp-content/uploads/2022/06/Seated-Cable-Row.gif';
  final String backExtensionImageUrl = 'https://media1.popsugar-assets.com/files/thumbor/oKAbsVCXl1wbpXcEYhUHWlj1uJw=/fit-in/792x808/filters:format_auto():upscale()/2019/01/10/659/n/1922729/tmp_KPVPg4_8c2a3adbd8c7e13c_IMB_MwXuQT.GIF';

  // YouTube video URLs for each exercise
  final String latPulldownVideoUrl = 'https://www.youtube.com/shorts/77bPLrsMwiQ';
  final String seatedCableRowVideoUrl = 'https://www.youtube.com/shorts/_PALjGstyFM';
  final String backExtensionVideoUrl = 'https://www.youtube.com/shorts/nBUzp4Nj_3Q';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Back Exercises'),
    ),
    body: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Lat Pulldown Section
    Text('Lat Pulldown', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: latPulldownDescription),
    SizedBox(height: 10),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: latPulldownInstructions),
    SizedBox(height: 10),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(latPulldownImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(latPulldownVideoUrl)) {
    await launch(latPulldownVideoUrl);
    } else {
    throw 'Could not launch $latPulldownVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Seated Cable Row Section
    Text('Seated Cable Row', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: seatedCableRowDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: seatedCableRowInstructions),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(seatedCableRowImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(seatedCableRowVideoUrl)) {
    await launch(seatedCableRowVideoUrl);
    } else {
    throw 'Could not launch $seatedCableRowVideoUrl';
    }
    },
    ),

    // Divider to separate the sections
    Divider(height: 30),

    // Back Extension Section
    Text('Back Extension', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    MarkdownBody(data: backExtensionDescription),
    Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    MarkdownBody(data: backExtensionInstructions),
    Text('Image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Image.network(backExtensionImageUrl),
    InkWell(
    child: Text('Watch the video', style: TextStyle(color: Colors.blue)),
    onTap: () async {
    if (await canLaunch(backExtensionVideoUrl)) {
    await launch(backExtensionVideoUrl);
    } else {
      throw 'Could not launch $backExtensionVideoUrl';
    }
    },
    ),
    ],
    ),
    ),
    );
    }
    }
