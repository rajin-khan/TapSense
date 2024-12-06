import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_sense/sections/education/education_screen.dart';
import 'package:tap_sense/sections/navigation/navigation_screen.dart';
import 'package:tap_sense/sections/detection/detection_screen.dart';
import 'package:tap_sense/sections/productivity/to_dos.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen(this.changeScreen, {super.key});
  final void Function() changeScreen;
  @override
  State<MenuScreen> createState() {
    return _MenuScreenState();
  }
}

var num = 0;

class _MenuScreenState extends State<MenuScreen> {
  var activeScreen = 'menu-screen';

  final FlutterTts flutterTts = FlutterTts();

  void switchScreen() {
    setState(() {
      if (num == 1) {
        activeScreen = 'education-screen';
      } else if (num == 2) {
        activeScreen = 'productivity-screen';
      } else if (num == 3) {
        activeScreen = 'navigation-screen';
      } else if (num == 4) {
        activeScreen = 'detection-screen';
      } else {
        activeScreen = 'menu-screen'; // Default to menu
      }
    });
  }

  void restartApp() {
    setState(() {
      activeScreen = 'menu-screen'; // Default to menu
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = buildMenu();

    // Determine which screen to show based on activeScreen
    if (activeScreen == 'education-screen') {
      screenWidget = EducationScreen(restartApp);
    } else if (activeScreen == 'productivity-screen') {
      screenWidget = ToDos(restartApp);
    } else if (activeScreen == 'navigation-screen') {
      screenWidget = NavigationScreen(restartApp);
    } else if (activeScreen == 'detection-screen') {
      screenWidget = DetectionScreen(restartApp);
    } else {
      screenWidget = buildMenu(); // Build Menu screen
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: screenWidget,
      ),
    );
  }

  // This function builds the Menu layout
  Widget buildMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 40),
        Text(
          'PICK ONE OF THE FOUR CORNERS:',
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(228, 239, 244, 1),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        //const SizedBox(height: 260),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        num = 1;
                        switchScreen();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        foregroundColor: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.book_rounded, size: 55),
                          const SizedBox(height: 20),
                          Text(
                            'READER',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        num = 2;
                        switchScreen();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        foregroundColor: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.checklist_rounded, size: 55),
                          const SizedBox(height: 20),
                          Text(
                            'TO-DOS',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        num = 3;
                        switchScreen();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        foregroundColor: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.navigation_rounded, size: 55),
                          const SizedBox(height: 20),
                          Text(
                            'NAVIGATION',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        num = 4;
                        switchScreen();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        foregroundColor: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.app_shortcut_rounded, size: 55),
                          const SizedBox(height: 20),
                          Text(
                            'DETECTION',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        TextButton.icon(
          //screen reader
          onPressed: () {
            flutterTts.speak(
                "Pick one of the four corners: Top-Left is a Reader, Top-Right is your To-Do List, Bottom-Left is for Navigation, and Bottom-Right is for basic object Detection");
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.multitrack_audio_rounded),
          label: const Text('READ SCREEN'),
        ),
        //const SizedBox(height: 50),
      ],
    );
  }
}