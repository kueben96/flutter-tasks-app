import 'package:flutter/material.dart';
import 'package:task_manager/tasks_theme.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({Key? key, required this.status}) : super(key: key);

  final String status;
  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Icon statusIcon;
    switch (status) {
      case 'Done':
        {
          statusColor = TasksTheme.statusDoneGreyColor;
          statusIcon = Icon(
            Icons.check_circle_rounded,
            color: statusColor,
          );
        }
        break;
      case 'To-Do':
        {
          statusColor = TasksTheme.statusToDoColor;
          statusIcon = Icon(
            Icons.label_important,
            color: statusColor,
          );
        }
        break;
      case 'In Progress':
        {
          statusColor = TasksTheme.statusInProgressGreenColor;
          statusIcon = Icon(
            Icons.keyboard_arrow_right,
            color: statusColor,
          );
        }
        break;
      default:
        {
          statusColor = TasksTheme.blackColor;
          statusIcon = Icon(Icons.check_box);
        }
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: statusColor)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(right: 8), child: statusIcon),
            Text(
              status,
              style: TasksTheme.of(context)
                  .fontStyle12Bold
                  .merge(TextStyle(color: statusColor)),
            ),
          ],
        ),
      ),
    );
  }
}
