//import 'package:tap_sense/sections//productivity/new_to_do.dart';
import 'package:flutter/material.dart';

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
  final List<ToDo> _registeredToDos = [
    ToDo(title: 'Get Groceries'),
    ToDo(title: 'Watch Movie'),
  ];

  void _openAddToDoOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewToDo(onAddToDo: _addToDo),
    ); //ctx is the same as context, we just used it to differentiate the two contexts.
  }

  void _addToDo(ToDo toDo) {
    setState(() {
      _registeredToDos.add(toDo);
    });
  }

  void _removeToDo(ToDo toDo) {
    final toDoIndex = _registeredToDos.indexOf(toDo);
    setState(() {
      _registeredToDos.remove(toDo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      //to have an info message appear when an item is removed
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('To-Do item deleted.'),
        action: SnackBarAction(
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
    Widget mainContent = const Center(
      child: Text('No to-do items. Start adding something you want to do!'),
    );
    if (_registeredToDos.isNotEmpty) {
      mainContent = ToDoList(
        toDos: _registeredToDos,
        onRemoveToDo: _removeToDo,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tapsense To-Do Protoype'),
        actions: [
          IconButton(
            onPressed:
                _openAddToDoOverlay, //we don't add parentheses here because flutter needs to execute this function only when pressed, not all the time.
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            //the expanded widget must be used here we are trying to display a list (listview) inside another list (the column widget)
            child: mainContent,
          ),
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
      ),
    );
  }
}
