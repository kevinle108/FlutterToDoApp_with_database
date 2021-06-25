
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task.'),
      trailing: TaskTileCheckbox(),
    );
  }
}

class TaskTileCheckbox extends StatefulWidget {

  @override
  State<TaskTileCheckbox> createState() => _TaskTileCheckboxState();
}

class _TaskTileCheckboxState extends State<TaskTileCheckbox> {
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (newValue){
        setState(() {
          isChecked = newValue != null ? newValue : false;
        });
      },
    );
  }
}

