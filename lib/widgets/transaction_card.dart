import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Function deleteTx;
  TransactionCard({
    @required this.title,
    @required this.amount,
    @required this.date,
    @required this.id,
    @required this.deleteTx,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(date),
        ),
        trailing: MediaQuery.of(context).size.width > 600
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text("Delete"),
                onPressed: () => deleteTx(id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(id),
              ),
      ),
    );
  }
}
