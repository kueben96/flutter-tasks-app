import 'package:flutter/material.dart';
import 'package:task_manager/tasks_theme.dart';

class PriorityBadge extends StatelessWidget {
  final String priority;
  final bool? inverted;
  final double? width;
  PriorityBadge({Key? key, required this.priority, this.inverted, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color prioColor = priority == "Urgent"
        ? TasksTheme.prioUrgentRedColor
        : TasksTheme.prioNormalBlueColor;
    return Container(
      //color: inverted == true ? TasksTheme.whiteColor : null,

      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: inverted == true ? TasksTheme.whiteColor : null,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: prioColor)),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            priority,
            style: TasksTheme.of(context)
                .fontStyle12Bold
                .merge(TextStyle(color: prioColor)),
          )),
    );
  }
}
