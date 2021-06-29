import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/db_helper.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount => _tasks.length;

  TaskData(){
    getAllTasksFromDB();
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void getAllTasksFromDB() async {
    List<Task> tasks = await DbHelper.getAllTasks();
    print('Done retrieving ${tasks.length} tasks from database');
    _tasks = tasks;
    notifyListeners();
  }


  void addTask(String newTaskTitle) async {
    // Task newTask = Task(taskName: newTaskTitle, id: Random().nextInt(999), isDone: false);
    Task newTask = Task(taskName: newTaskTitle, id: 0, isDone: false);
    newTask.id = await DbHelper.insertTask((newTask));
    _tasks.add(newTask);
    print('Created new task, taskName:${newTask.taskName}, id:${newTask.id}, isDone:${newTask.isDone}');
    notifyListeners();
  }

  void updateTask(Task task) async {
    task.toggleDone();
    await DbHelper.updateTask(task);
    notifyListeners();
  }

  void deleteTask(Task task) async {
    await DbHelper.deleteTask(task.id);
    _tasks.remove(task);
    notifyListeners();
  }
}