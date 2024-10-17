import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductivityScreen extends StatelessWidget {
  const ProductivityScreen(this.onRestart, {super.key});
  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'PRODUCTIVITY SCREEN',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: onRestart,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
              textStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
          ),
          child: const Text('BACK'),
        ),
      ],
    );
  }
}
