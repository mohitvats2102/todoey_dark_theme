import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Wash Clothes'),
    Task(name: 'Read KRISHNA book'),
  ];

//  List<Task> get tasks {
//    return [..._tasks];
//  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void changeTaskCompletion(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void addNewTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
