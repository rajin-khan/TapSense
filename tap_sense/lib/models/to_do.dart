import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'to_do.g.dart';

const uuid = Uuid();

@HiveType(typeId: 0) // Define a typeId for Hive storage
class ToDo extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  ToDo({
    required this.title,
  }) : id = uuid.v4(); // Generate a unique ID for each To-Do item
}
