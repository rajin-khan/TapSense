import 'package:tap_sense/models/to_do.dart';
import 'package:tap_sense/sections/productivity/to_do_item.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
    required this.toDos,
    required this.onRemoveToDo,
  });

  final List<ToDo> toDos;
  final void Function(ToDo toDo) onRemoveToDo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: toDos.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(toDos[index]),
        onDismissed: (direction) {
          onRemoveToDo(toDos[index]);
        },
        child: ToDoItem(toDo: toDos[index]),
      ), // the => operator acts as a "quick" function that only has to return one thing.
    );
  }
}
