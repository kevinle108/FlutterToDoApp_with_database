import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle = '';
  final void Function(String?) addTaskCallback;

  AddTaskScreen({required this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(20.0),
      //     topRight: Radius.circular(20.0),
      //   )
      // ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
              onPressed: () {
                addTaskCallback(newTaskTitle);
              },
              child: Text(
                'Add',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
