import 'package:capstone_project/screens/bottom_navbar.dart';
import 'package:capstone_project/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../widgets/backButton.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/widget_support.dart';

class ResultScreen extends StatefulWidget {
  final int points;
  final int inPoints;

  const ResultScreen({super.key, required this.points, required this.inPoints});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: backButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavbar()),
                );
              },
              iconColor: Colors.white,
              circleColor: Colors.white70,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  headingText("Your Final Score", Colors.white, 28),
                  const SizedBox(height: 50),
                  CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 10.0,
                    percent: (widget.points.toDouble()) / 100,
                    center: Text(
                      "${widget.points}/20",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: lightGrey,
                    progressColor: Colors.green,
                  ),
                  const SizedBox(height: 80),
                  Text(
                    "Correct Answer: ${widget.points}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Incorrect Answer: ${widget.inPoints}",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    buttonText: "Try Another",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
