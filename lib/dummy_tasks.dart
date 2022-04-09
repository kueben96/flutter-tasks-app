import 'package:task_manager/providers/task.dart';

List<Task> dummyTasks = [
  Task(
    title: "Learn Flutter",
    status: "To-Do",
    priority: "Urgent",
    date: DateTime.now(),
  ),
  Task(
    title: "Conenct FireBase",
    status: "To-Do",
    priority: "Later",
    date: DateTime.now(),
  ),
  Task(
      title: "Pre-Define Status",
      status: "In Progress",
      priority: "Later",
      date: DateTime.now(),
      description: "Make List of Strings from which to select the status"),
  Task(
      title: "Pre-Define Priority",
      status: "In Progress",
      priority: "Normal",
      date: DateTime.now(),
      description: "Make List of Strings from which to select the priority"),
  Task(
      title: "Learn Animations",
      status: "To-Do",
      priority: "Normal",
      date: DateTime.now(),
      description: "Make niiiice animations"),
  Task(
      title: "Define Themes",
      status: "To-Do",
      priority: "Normal",
      date: DateTime.now(),
      description: "Themes for different status and priority"),
];
