import 'package:flutter/material.dart';

class NoTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        return Column(
          children: <Widget>[
            Text("No trasactions added"),
            SizedBox(
              height: 10,
            ),
            Container(
              height: contraints.maxHeight * 0.7,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
