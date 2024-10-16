//import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

class Reminder {
  Reminder({
    required this.title,
    required this.date,
  }): id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
