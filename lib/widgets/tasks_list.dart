import 'package:flutter/material.dart';
import './task_tile.dart';
import '../modules/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key, required List<Task> tasks}) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();

  static _TasksListState? of(BuildContext context) {
    return context.findAncestorStateOfType<_TasksListState>();
  }
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3'),
  ];

  void addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void toggleTask(Task task) {
    setState(() {
      task.toggleDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Task task = tasks[index];
        return TaskTile(
          isChecked: task.isDone,
          checkboxCallback: (_) => toggleTask(task),
          task: task,
        );
      },
    );
  }
}
