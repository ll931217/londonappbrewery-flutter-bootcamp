import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/data/tasks.dart';

import 'package:todoey/components/task_tile.dart';

class TasksList extends StatelessWidget {
    const TasksList({super.key});

    @override
    Widget build(BuildContext context) {
        return Consumer<Tasks>(
            builder: (BuildContext context, taskData, child) {
                print(taskData.tasks);
                return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                        final task = taskData.tasks[index];
                        return TaskTile(
                            taskTitle: task.name,
                            taskDone: task.isDone,
                            checkboxCallback: (bool? currentCheckboxState) {
                                taskData.toggleDone(task);
                            },
                            longpressCallback: () {
                                taskData.deleteTask(task);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('Deleted ${task.name}'),
                                ));
                            }
                        );
                    },
                    itemCount: taskData.tasksCount,
                );
            },
        );
    }
}
