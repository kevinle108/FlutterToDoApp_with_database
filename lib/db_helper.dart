import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoey_flutter/models/task.dart';

const kTableTasks = 'tasks';

class DbHelper {
  static Database? _db;

  static Future<Database> _getDb() async {
    if (_db == null) {
      _db = await openDatabase(
        join(await getDatabasesPath(), 'tasks.db'),
        version: 1,
        onCreate: (db, version) async {
          return await db.execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY, taskName TEXT, isDone INTEGER)');
        },
      );
      print('database tasks.db is opened');
    }
    return _db!;
  }

  static Future<int> insertTask(Task task) async {
    Database db = await _getDb();
    return await db.insert(kTableTasks, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteTask(int id) async {
    Database db = await _getDb();
    print('removed a task from db: taskID: ${id}');
    return await db.delete(kTableTasks, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateTask(Task task) async {
    Database db = await _getDb();
    print('updated task to db: taskName: ${task.taskName}');
    return await db.update(kTableTasks, task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<List<Task>> getAllTasks() async {
    Database db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(kTableTasks);
    print('Read ${maps.length} tasks from the database');
    return List.generate(
        maps.length,
        (i) => Task(
            id: maps[i]['id'],
            taskName: maps[i]['taskName'],
            isDone: maps[i]['isDone'] == 1));
  }
}
