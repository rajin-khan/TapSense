import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_sense/sections/education/education_screen.dart';
import 'package:tap_sense/sections/navigation/navigation_screen.dart';
import 'package:tap_sense/sections/nutrition/nutrition_screen.dart';
import 'package:tap_sense/sections/productivity/productivity_screen.dart';

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

  void switchScreen() {
    setState(() {
      if (num == 1) {
        activeScreen = 'education-screen';
      } else if (num == 2) {
        activeScreen = 'productivity-screen';
      } else if (num == 3) {
        activeScreen = 'navigation-screen';
      } else if (num == 4) {
        activeScreen = 'nutrition-screen';
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
      screenWidget = ProductivityScreen(restartApp);
    } else if (activeScreen == 'navigation-screen') {
      screenWidget = NavigationScreen(restartApp);
    } else if (activeScreen == 'nutrition-screen') {
      screenWidget = NutritionScreen(restartApp);
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
        Text(
          'PICK ONE OF THE FOUR CORNERS:',
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(228, 239, 244, 1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 300),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                num = 1;
                switchScreen();
              }, // Trigger screen switch on button press
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.book),
              label: const Text('EDUCATION'),
            ),
            TextButton.icon(
              onPressed: () {
                num = 2;
                switchScreen();
              }, // Trigger screen switch on button press
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.work),
              label: const Text('PRODUCTIVITY'),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                num = 3;
                switchScreen();
              }, // Trigger screen switch on button press
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.navigation),
              label: const Text('NAVIGATION'),
            ),
            TextButton.icon(
              onPressed: () {
                num = 4;
                switchScreen();
              }, // Trigger screen switch on button press
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.food_bank),
              label: const Text('NUTRITION'),
            ),
          ],
        ),
        const SizedBox(height: 300),
        TextButton.icon(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.multitrack_audio_rounded),
          label: const Text('READ SCREEN'),
        )
      ],
    );
  }
}
