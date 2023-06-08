import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/task.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) checkboxCallback;
  final Task task;

  TaskTile({
    this.isChecked = false,
    required this.checkboxCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: isChecked
            ? TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      trailing: TaskCheckBox(
        checkBoxState: isChecked,
        checkboxCallback: checkboxCallback,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final Function(bool?) checkboxCallback;

  TaskCheckBox({
    required this.checkBoxState,
    required this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: checkboxCallback,
    );
  }
}
