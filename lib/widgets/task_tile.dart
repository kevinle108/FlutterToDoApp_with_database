
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkboxCallback(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          'This is a task',
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
      ),
      trailing: TaskTileCheckbox(checkboxState: isChecked, toggleCheckboxState: checkboxCallback,),
    );
  }
}

class TaskTileCheckbox extends StatelessWidget {
  final bool checkboxState;
  final void Function(bool?) toggleCheckboxState;

  TaskTileCheckbox({required this.checkboxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}

