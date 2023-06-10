import 'package:flutter/material.dart';

import '../modules/task.dart';
import 'TaskScreen.dart';
import '../widgets/tasks_list.dart';
import '../widgets/task_tile.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onAddTask;

  const AddTaskScreen({Key? key, required this.onAddTask}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskName = '';

  void addTaskToList() {
    if (taskName.isNotEmpty) {
      setState(() {
        final task = Task(name: taskName);
        widget.onAddTask(task); // Pass the task as a List
        taskName = '';
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  taskName = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: addTaskToList,
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
