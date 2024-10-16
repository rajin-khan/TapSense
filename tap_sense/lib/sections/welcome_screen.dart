import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startApp, {super.key});

  final void Function() startApp;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/tapsense_text.png',
            width: 200,
          ),
          const SizedBox(height: 6),
          Text(
            'Ready to see it all?',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: startApp,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            child: const Text('Let\'s go!'),
          ),
        ],
      ),
    );
  }
}
