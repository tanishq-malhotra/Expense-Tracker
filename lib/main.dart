import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() => _HomePage();
}

class _HomePage extends State<MyApp> {
  List<Transaction> transaction = [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.blue,
              child: Text('Chart'),
            ),
            Card(
              color: Colors.red,
              child: Text('List of TX'),
            ),
          ],
        ),
      ),
    );
  }
}
