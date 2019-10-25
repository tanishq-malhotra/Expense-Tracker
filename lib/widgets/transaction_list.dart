import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
        return TransactionCard(
          amount: tx.amount,
          title: tx.title,
          date: tx.date,
        );
      }).toList(),
    );
  }
}
