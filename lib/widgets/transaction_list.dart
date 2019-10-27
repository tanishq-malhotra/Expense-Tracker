import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_card.dart';
import './no_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);
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
                  deleteTx: deleteTx,
                  id: transaction[index].id,
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
