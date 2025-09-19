import 'package:flutter/material.dart';

class FlashcardWidget extends StatelessWidget {
  final String question;
  final String answer;
  final bool showAnswer;

  const FlashcardWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.showAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: showAnswer
              ? [Colors.orangeAccent, Colors.deepOrange]
              : [Colors.deepPurpleAccent, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          showAnswer ? answer : question,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
