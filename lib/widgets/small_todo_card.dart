import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/task.dart';
import 'package:task_manager/tasks_theme.dart';
import 'package:task_manager/widgets/prio_badge.dart';
import 'package:task_manager/widgets/status_badge.dart';

class SmallToDoCard extends StatelessWidget {
  const SmallToDoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = Provider.of<Task>(context);
    return Container(
      width: 200,
      child: Card(
        color: TasksTheme.statusToDoColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: TasksTheme.blackColor),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TasksTheme.of(context)
                    .fontStyleHeader24
                    .merge(TextStyle(color: TasksTheme.whiteColor)),
              ),
              Text(
                task.description,
                style: TextStyle(color: TasksTheme.whiteColor),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              PriorityBadge(
                priority: task.priority,
                inverted: true,
                width: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
