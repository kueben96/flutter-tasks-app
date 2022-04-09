import 'package:flutter/material.dart';

class GreetProfileBanner extends StatelessWidget {
  const GreetProfileBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Image.asset(
            'assets/images/profile_pic.png',
            width: 32,
          ),
        ),
        RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(text: 'Hello, '),
              new TextSpan(
                  text: 'Kübra',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
