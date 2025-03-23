import 'package:get/get.dart';

class Task {
  final int? id;
  final String name;
  RxBool isCompleted;

  Task({this.id, required this.name, required this.isCompleted});

  // Convert a Task object to a Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted.value ? 1 : 0,
    };
  }

  // Create a Task object from a Map (for reading from SQLite)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      isCompleted: RxBool(map['isCompleted'] == 1),
    );
  }
}
