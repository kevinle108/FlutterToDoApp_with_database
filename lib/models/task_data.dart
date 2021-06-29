import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/db_helper.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  //todo get tasks from db instead of hardcoding
  List<Task> _tasks = [];

  int nextId = 1;

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void getAllTasksFromDB() async {
    List<Task> tasks = await DbHelper.getAllTasks();
    print('Done retrieving ${tasks.length} tasks from database');
    _tasks = tasks;
  }

  // void updateIdTracker() {
  //   if (_tasks.length == 0) nextId = 1;
  //   else {
  //     tasks.sort((a, b) => (a.id).compareTo(b.id));
  //     nextId = _tasks.last.id;
  //   }
  // }

  void addTask(String newTaskTitle) {
    // Task newTask = Task(taskName: newTaskTitle, id: Random().nextInt(999), isDone: false);
    Task newTask = Task(taskName: newTaskTitle, id: _tasks.length+1, isDone: false);
    _tasks.add(newTask);
    print('Created new task, taskName:${newTask.taskName}, id:${newTask.id}, isDone:${newTask.isDone}');
    DbHelper.insertTask(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    DbHelper.updateTask(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    DbHelper.deleteTask(task.id);
    notifyListeners();
  }
}