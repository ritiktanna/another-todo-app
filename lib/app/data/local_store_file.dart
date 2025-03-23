import 'package:another_todo_app/app/modules/home/model/task_model.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _tableName = 'tasks';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  // Insert Task
  Future<int> insertTask(Task task) async {
    final db = await database;
    return await db.insert(_tableName, task.toMap());
  }

  // Get All Tasks
  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      orderBy: 'isCompleted ASC, id DESC',
    );

    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }

  // Update Task
  Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update(
      _tableName,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  // Delete Task
  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
