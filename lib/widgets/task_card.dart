import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/task.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/tasks_theme.dart';
import 'package:task_manager/widgets/prio_badge.dart';
import 'package:task_manager/widgets/status_badge.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = Provider.of<Task>(context);
    return Container(
      width: 280,
      child: Card(
        shadowColor: TasksTheme.standardCardBackgroundColor,
        color: TasksTheme.standardCardBackgroundColor,
        elevation: 10,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: TasksTheme.blackColor),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title,
                  // "UX Design for MONS Calendar",
                  //style: Theme.of(context).textTheme.headline6,
                  style: TextStyle(fontFamily: 'Bebas Neue', fontSize: 33)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.flag,
                      size: 15,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(task.date),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  task.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
              Spacer(),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: StatusBadge(
                        status: task.status,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: PriorityBadge(
                        priority: task.priority,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
