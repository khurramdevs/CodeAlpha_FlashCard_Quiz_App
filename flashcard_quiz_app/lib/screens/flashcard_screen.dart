import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final List<Map<String, String>> _flashcards = [
    {
      "question": "What is Flutter?",
      "answer": "An open-source UI SDK by Google.",
    },
    {
      "question": "What is Dart?",
      "answer": "A programming language optimized for UI.",
    },
    {
      "question": "What is State Management?",
      "answer": "A way to manage data flow in apps.",
    },
    {
      "question": "What is Widget Tree?",
      "answer": "The hierarchy that defines UI structure.",
    },
  ];

  int _currentIndex = 0;
  final GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
    });
    _cardKey.currentState?.toggleCard(); // reset flip
  }

  void _prevCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _flashcards.length) % _flashcards.length;
    });
    _cardKey.currentState?.toggleCard(); // reset flip
  }

  void _flipCard() {
    _cardKey.currentState?.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    final card = _flashcards[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Flashcards"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlipCard(
            key: _cardKey,
            flipOnTouch: true,
            front: _buildCard(card["question"]!, Colors.deepPurpleAccent),
            back: _buildCard(card["answer"]!, Colors.orangeAccent),
          ),
          const SizedBox(height: 40),
          Text(
            "Card ${_currentIndex + 1} of ${_flashcards.length}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _prevCard,
                icon: const Icon(Icons.navigate_before),
                label: const Text("Previous"),
              ),
              const SizedBox(width: 15),
              ElevatedButton.icon(
                onPressed: _flipCard,
                icon: const Icon(Icons.flip),
                label: const Text("Flip"),
              ),
              const SizedBox(width: 15),
              ElevatedButton.icon(
                onPressed: _nextCard,
                icon: const Icon(Icons.navigate_next),
                label: const Text("Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String text, Color color) {
    return Container(
      width: 320,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
