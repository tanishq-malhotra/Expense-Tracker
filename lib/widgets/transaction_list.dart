import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionCard(
            amount: transaction[index].amount,
            title: transaction[index].title,
            date: transaction[index].date,
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}
