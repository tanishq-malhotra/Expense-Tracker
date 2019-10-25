import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final Function newTransaction;

  Input(this.newTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => newTransaction(
                  titleController.text, double.parse(amountController.text)),
            ),
          ],
        ),
      ),
    );
  }
}
