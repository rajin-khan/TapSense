import 'package:flutter/material.dart';

import 'package:tap_sense/welcome_screen.dart';
import 'package:tap_sense/menu_screen.dart';

class TapSense extends StatefulWidget {
  const TapSense({super.key});

  @override
  State<TapSense> createState() {
    return _TapSenseState();
  }
}

class _TapSenseState extends State<TapSense> {
  var activeScreen = 'welcome-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'menu-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = WelcomeScreen(switchScreen);

    if (activeScreen == 'menu-screen') {
      screenWidget = const MenuScreen();
    }
    return MaterialApp(
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
          child: screenWidget,
        ),
      ),
    );
  }
}
