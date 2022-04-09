import 'package:flutter/material.dart';

class CheckedPage extends StatelessWidget {
  const CheckedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Checked"),
          Icon(Icons.check),
        ],
      ),
    );
  }
}
