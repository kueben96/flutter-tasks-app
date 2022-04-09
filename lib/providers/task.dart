import 'package:flutter/foundation.dart';

class Task with ChangeNotifier {
  final String title;
  final String status;
  final String priority;
  final DateTime date;
  String description;

  Task({
    required this.title,
    required this.status,
    required this.priority,
    required this.date,
    this.description = "",
  });

  // (1) get Task
  // (2)

}
