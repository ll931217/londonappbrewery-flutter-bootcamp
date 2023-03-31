import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
    const TaskTile({super.key, required this.taskTitle, this.taskDone = false, this.checkboxCallback, this.longpressCallback});

    final String taskTitle;
    final bool taskDone;
    final void Function(bool?)? checkboxCallback;
    final void Function()? longpressCallback;

    @override
    Widget build(BuildContext context) {
        return ListTile(
            onLongPress: longpressCallback,
            title: Text(
                taskTitle,
                style: TextStyle(
                    decoration: taskDone ? TextDecoration.lineThrough : null,
                ),
            ),
            trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: taskDone,
                onChanged: checkboxCallback,
            ),
        );
    }
}
