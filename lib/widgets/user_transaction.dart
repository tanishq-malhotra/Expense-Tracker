import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './input_card.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
