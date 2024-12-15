//import 'package:tap_sense/sections//productivity/new_to_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_sense/models/to_do.dart';
import 'package:tap_sense/sections/productivity/new_to_do.dart';
import 'package:tap_sense/sections/productivity/to_do_list.dart';

class ToDos extends StatefulWidget {
  const ToDos(this.onRestart, {super.key});
  final void Function() onRestart;

  @override
  State<ToDos> createState() {
    return _ToDosState();
  }
}

class _ToDosState extends State<ToDos> {
  final FlutterTts flutterTts = FlutterTts();

  final List<ToDo> _registeredToDos = [];

  void _openAddToDoOverlay() {
    flutterTts.speak(
        "You are now adding an item to the To-Do List. Tap the microphone at the center of the screen to input an item, then hit save by tapping the lower right below the microphone. Swipe down to cancel.");
    showModalBottomSheet(
      backgroundColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewToDo(onAddToDo: _addToDo),
    ); //ctx is the same as context, we just used it to differentiate the two contexts.
  }

  void _addToDo(ToDo toDo) {
    flutterTts.speak("You have saved: ${toDo.title}");
    setState(() {
      _registeredToDos.add(toDo);
    });
  }

  void _removeToDo(ToDo toDo) {
    flutterTts.speak('You have deleted: ${toDo.title}');
    final toDoIndex = _registeredToDos.indexOf(toDo);
    setState(() {
      _registeredToDos.remove(toDo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      //to have an info message appear when an item is removed
      SnackBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        duration: const Duration(seconds: 3),
        content: Text(
          'To-Do item deleted.',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w500,
          ),
        ),
        action: SnackBarAction(
          textColor: Colors.orange,
          label: 'Undo', //the part that brings the item back
          onPressed: () {
            setState(() {
              _registeredToDos.insert(toDoIndex, toDo);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
        'No to-do items. Start adding something you want to do!',
        style: GoogleFonts.poppins(
          color: const Color.fromARGB(232, 255, 255, 255),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
    if (_registeredToDos.isNotEmpty) {
      mainContent = ToDoList(
        toDos: _registeredToDos,
        onRemoveToDo: _removeToDo,
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 30),
        Text(
          'TO-DO LIST',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _openAddToDoOverlay,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: Colors.black,
          ),
          child: const Icon(Icons.add_rounded,
              color: Colors.orange), // icon of the button
        ),
        const SizedBox(height: 20),
        Expanded(
          //the expanded widget must be used here we are trying to display a list (listview) inside another list (the column widget)
          child: mainContent,
        ),
        const SizedBox(height: 20),
        TextButton.icon(
          //screen reader
          onPressed: () {
            String spoken = "Your To-Do List is: ";
            if (_registeredToDos.isEmpty) {
              spoken =
                  "Your To-Do List is empty. Tap the button on top to add something!";
            } else {
              for (int i = 0; i < _registeredToDos.length; i++) {
                spoken += _registeredToDos[i].title;
                spoken += ", ";
              }
            }
            flutterTts.speak(spoken);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.multitrack_audio_rounded),
          label: const Text('READ SCREEN'),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: widget.onRestart,
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
