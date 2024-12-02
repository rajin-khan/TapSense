import 'package:flutter/material.dart';
import 'package:tap_sense/models/to_do.dart';
import 'package:google_fonts/google_fonts.dart';

class NewToDo extends StatefulWidget {
  const NewToDo({super.key, required this.onAddToDo});

  final void Function(ToDo toDo) onAddToDo;

  @override
  State<NewToDo> createState() {
    return _NewToDoState();
  }
}

class _NewToDoState extends State<NewToDo> {
  final _titleController = TextEditingController();

  void _submitToDoData() {
    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.2),
          title: Text(
            'Invalid input',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          content: Text(
            'Please make sure a valid title was entered.',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Okay', style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddToDo(
      ToDo(title: _titleController.text),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _titleController, //for handling input
            maxLength: 50,
            //keyboardType: TextInputType.text, //basic text type by default, so no need to set this separately
            decoration: InputDecoration(
              label: Text(
                'Title',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),

          

          const SizedBox(height: 30),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); //closes currently open menu and reverts to last one
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _submitToDoData();
                },
                child: Text(
                  'Save To-Do',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
