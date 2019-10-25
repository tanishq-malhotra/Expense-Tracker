import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final Function newTransaction;
  Input(this.newTransaction);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  final amountController = TextEditingController();

  final titleController = TextEditingController();

  void submitData() {
    if (titleController.text.length <= 0 || amountController.text.length <= 0)
      return;

    final titleText = titleController.text;
    final amount = double.parse(amountController.text);
    widget.newTransaction(titleText, amount);

    Navigator.of(context).pop();
  }

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
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
