import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_card.dart';
import './no_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transaction.isEmpty
          ? NoTransaction()
          : ListView.builder(
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
