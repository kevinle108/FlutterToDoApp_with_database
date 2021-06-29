import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  //todo get tasks from db instead of hardcoding
  List<Task> _tasks = [
    Task(taskName: 'Task1', id: Random(0).nextInt(999), isDone: false),
    Task(taskName: 'Task2', id: Random(0).nextInt(999), isDone: false),
    Task(taskName: 'Task3', id: Random(0).nextInt(999), isDone: false),
  ];

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String newTaskTitle) {
    _tasks.add(Task(taskName: newTaskTitle, id: Random(0).nextInt(999), isDone: false));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}