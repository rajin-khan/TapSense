import 'package:tap_sense/models/to_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({required this.toDo, super.key});

  final ToDo toDo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(0, 255, 255, 255),
      child: Padding(
        //since card does not have its own padding, we wrap its child elements with the padding widget.
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(
              toDo.title,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
