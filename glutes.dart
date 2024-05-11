import 'package:flutter/material.dart';
import 'Hip_thrust.dart';
import 'Split_squats.dart';
import 'Romanian_deadlift.dart';
import 'Glute_isolation.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Use a custom font
      ),
      home: GlutesExercisePage(),
    );
  }
}
class GlutesExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glute Workout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GluteWorkoutButton(
                  exercise: 'Hip Thrust',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  HipThrustPage()),
                    );
                  },
                ),
                SizedBox(width: 20),
                GluteWorkoutButton(
                  exercise: 'Romanian DeadLift',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  RDLPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GluteWorkoutButton(
                  exercise: 'Bulgarian Split Squats',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SplitSquatsPage()),
                    );
                  },
                ),
                SizedBox(width: 20),
                GluteWorkoutButton(
                  exercise: 'Glute Isolation Exercises',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  glute_isolation()),
                    );
                  },
                ),
              ],
            ),
            // Add more rows for more exercises
          ],
        ),
      ),
    );
  }
}

class GluteWorkoutButton extends StatelessWidget {
  final String exercise;
  final VoidCallback onPressed;

  const GluteWorkoutButton({
    Key? key,
    required this.exercise,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(exercise),
    );
  }
}