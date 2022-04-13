import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:task_manager/providers/task_provider.dart';
import 'package:task_manager/tasks_theme.dart';
import 'package:task_manager/widgets/greet_profile_banner.dart';
import 'package:task_manager/widgets/small_todo_card.dart';
import 'package:task_manager/widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<TaskProvider>(context);
    final tasksList = tasksData.listOfTasks;
    var filteredToDo = [...tasksList.where((e) => e.status == "To-Do")];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            GreetProfileBanner(),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: TasksTheme.of(context).fontStyleHeader32,
                children: <TextSpan>[
                  new TextSpan(
                      text: '${tasksList.length} New ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: 'tasks today',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: tasksList[index],
                    child: TaskCard(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: TasksTheme.of(context).fontStyleHeader32,
                children: <TextSpan>[
                  new TextSpan(
                    text: 'To ',
                  ),
                  new TextSpan(
                      text: 'Do',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredToDo.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: filteredToDo[index],
                    child: SmallToDoCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Icon(
//             Icons.add_circle_rounded,
//             color: Theme.of(context).accentColor,
//             size: 40,
//           ),
//         ),