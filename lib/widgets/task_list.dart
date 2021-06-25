import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(
      name: 'Task1',
    ),
    Task(
      name: 'Task2',
    ),
    Task(
      name: 'Task3',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone, checkboxCallback: (){}),
        TaskTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone, checkboxCallback: (){}),
        TaskTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone, checkboxCallback: (){}),
      ],
    );
  }
}
