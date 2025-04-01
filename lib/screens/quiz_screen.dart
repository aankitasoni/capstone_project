import 'package:capstone_project/screens/quiz/quiz_main_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/backButton.dart';
import '../widgets/widget_support.dart';
import 'bottom_navbar.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(
              onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavbar()),
        );
        },
          iconColor: Colors.black,
          circleColor: Colors.black12,
        ),
        Image.asset(
                "assets/balloon2.png",
                // width: 250,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  normalText("Welcome to ", Colors.black54, 24),
                  headingText("Quiz Section", Colors.black, 28),
                ],
              ),
              const SizedBox(height: 20),
              normalText(
                "Do you feel confident? Here you'll face our most difficult questions!",
                Colors.black45,
                16,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizMainScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: headingText("Continue", Colors.white, 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
