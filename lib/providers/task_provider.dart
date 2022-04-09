import 'package:flutter/material.dart';
import 'package:task_manager/providers/task.dart';
import '../dummy_tasks.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = dummyTasks;

  List<Task> get listOfTasks {
    return [..._tasks];
  }
}
