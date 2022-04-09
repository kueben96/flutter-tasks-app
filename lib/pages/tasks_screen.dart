import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_manager/widgets/greet_profile_banner.dart';
import 'package:task_manager/widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  static const List<Widget> taskCards = [
    TaskCard(),
    TaskCard(),
    TaskCard(),
    TaskCard()
  ];

  @override
  Widget build(BuildContext context) {
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
                style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: '4 New ',
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
                itemCount: taskCards.length,
                itemBuilder: (context, index) {
                  return taskCards[index];
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
                style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
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
          ],
        ),
      ),
    );
  }
}
