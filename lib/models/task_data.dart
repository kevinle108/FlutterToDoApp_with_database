import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Task1'),
    Task(name: 'Task2'),
    Task(name: 'Task3'),
  ];

}