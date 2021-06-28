import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: Provider.of<TaskData>(context, listen: true).tasks[index].name,
          isChecked:Provider.of<TaskData>(context, listen: true).tasks[index].isDone,
          checkboxCallback: (bool? checkbox) {
            // setState(() {
            //   widget.tasks[index].toggleDone();
            // });
          },
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
