import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tap_sense/models/to_do.dart';
import 'package:tap_sense/tap_sense.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(ToDoAdapter()); // Register ToDo adapter
  await Hive.openBox<ToDo>('toDoBox'); // Open the To-Do Hive box

  runApp(
    const TapSense(),
  );
}