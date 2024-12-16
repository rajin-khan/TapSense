import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_sense/models/to_do.dart';
import 'package:tap_sense/sections/productivity/new_to_do.dart';
import 'package:tap_sense/sections/productivity/to_do_list.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  late Box<ToDo> _toDoBox; // Hive box to store To-Do items

  @override
  void initState() {
    super.initState();
    _toDoBox = Hive.box<ToDo>('toDoBox'); // Access the already-opened Hive box
  }

  void _openAddToDoOverlay() {
    flutterTts.speak(
        "You are now adding an item to the To-Do List. Tap the microphone at the center of the screen to input an item, then hit save by tapping the lower right below the microphone. Swipe down to cancel.");
    showModalBottomSheet(
      backgroundColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewToDo(onAddToDo: _addToDo),
    );
  }

  void _addToDo(ToDo toDo) {
    flutterTts.speak("You have saved: ${toDo.title}");
    _toDoBox.add(toDo); // Add the To-Do to Hive storage
    setState(() {});
  }

  void _removeToDo(ToDo toDo) {
    flutterTts.speak('You have deleted: ${toDo.title}');
    toDo.delete(); // Remove the To-Do from Hive storage
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ToDo>>(
      valueListenable: _toDoBox.listenable(),
      builder: (context, box, _) {
        final toDos = box.values.toList();
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
        if (toDos.isNotEmpty) {
          mainContent = ToDoList(
            toDos: toDos.cast<ToDo>(), // Cast values to ToDo
            onRemoveToDo: _removeToDo,
          );
        }
        return Column(
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
              child: const Icon(Icons.add_rounded, color: Colors.orange),
            ),
            const SizedBox(height: 20),
            Expanded(child: mainContent),
            const SizedBox(height: 20),
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
      },
    );
  }
}