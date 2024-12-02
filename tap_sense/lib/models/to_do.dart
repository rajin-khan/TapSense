import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ToDo {
  ToDo({
    required this.title,
  }) : id = uuid
            .v4();
  final String id;
  final String title;
}
