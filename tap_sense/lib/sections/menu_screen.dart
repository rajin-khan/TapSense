import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget { //remember to convert to stateful widget and add buttons for all four sections
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
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
            const SizedBox(height: 280),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'EDUCATION',
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(228, 239, 244, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'PRODUCTIVITY',
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(228, 239, 244, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'NAVIGATION',
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(228, 239, 244, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'NUTRITION',
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(228, 239, 244, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 320),
            TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.multitrack_audio_rounded),
              label: const Text('READ SCREEN'),
            )
          ],
        ),
      ),
    );
  }
}
