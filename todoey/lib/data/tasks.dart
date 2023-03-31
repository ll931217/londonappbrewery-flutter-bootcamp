import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:todoey/models/task.dart';

class Tasks extends ChangeNotifier {
    List<Task> _tasks = [];

    int get tasksCount {
        return _tasks.length;
    }

    UnmodifiableListView<Task> get tasks {
        return UnmodifiableListView(_tasks);
    }

    void addTask(String taskName) {
        _tasks.add(Task(name: taskName));
        notifyListeners();
    }

    void toggleDone(Task task) {
        task.toggleDone();
        notifyListeners();
    }

    void deleteTask(Task task) {
        _tasks.remove(task);
        notifyListeners();
    }
}
