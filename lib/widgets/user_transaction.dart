import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './input_card.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 59.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Home Groceries',
      amount: 29.2,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(),
        TransactionList(transaction),
      ],
    );
  }
}
