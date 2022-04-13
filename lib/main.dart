import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/pages/home_page.dart';
import 'package:task_manager/providers/task_provider.dart';
import 'package:task_manager/tasks_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = TasksTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TaskProvider(),
        )
      ],
      child: Provider<TasksTheme>.value(
        value: theme,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme.theme,
          home: HomePage(),
        ),
      ),
    );
  }
}
