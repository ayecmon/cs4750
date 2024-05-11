import 'package:flutter/material.dart';
import 'Arm_workout.dart';
import 'glutes.dart';
import 'chest.dart';
import 'back.dart';
import 'legs.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FullBodyPage(),
    );
  }
}

class FullBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WorkoutButton(
                  muscleGroup: 'Arms',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ArmWorkoutPage()),
                    );
                  },
                ),
                SizedBox(width: 20),
                WorkoutButton(
                  muscleGroup: 'Back',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  BackExercisesPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WorkoutButton(
                  muscleGroup: 'Chest',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ChestExercisesPage()),
                    );
                  },
                ),
                SizedBox(width: 20),
                WorkoutButton(
                  muscleGroup: 'Glutes',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  GlutesExercisePage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WorkoutButton(
                  muscleGroup: 'Legs',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LegExercisesPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutButton extends StatelessWidget {
  final String muscleGroup;
  final VoidCallback onPressed;

  const WorkoutButton({
    Key? key,
    required this.muscleGroup,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(muscleGroup),
    );
  }
}
