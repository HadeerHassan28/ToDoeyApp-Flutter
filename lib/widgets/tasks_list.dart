import 'package:flutter/material.dart';
import './task_tile.dart';
import '../modules/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Task task = tasks[index];
        return TaskTile(
          isChecked: task.isDone,
          checkboxCallback: (newValue) {
            setState(() {
              task.toggleDone();
            });
          },
          task: task,
        );
      },
    );
  }
}
