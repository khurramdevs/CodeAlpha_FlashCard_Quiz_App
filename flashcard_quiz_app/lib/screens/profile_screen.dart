import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: const Center(
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/profile.png"),
        ),
      ),
    );
  }
}
