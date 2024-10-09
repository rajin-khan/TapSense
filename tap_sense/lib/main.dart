import 'package:flutter/material.dart';

import 'package:tap_sense/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 60, 40, 3),
                Color.fromARGB(255, 72, 1, 33),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const WelcomeScreen(),
        ),
      ),
    ),
  );
}
