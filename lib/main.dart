import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/input_card.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
              button: TextStyle(color: Colors.white),
            ),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showChart = true;
  List<Transaction> _userTransactions = [];

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: txDate.toString(),
      date: txDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _addNewTransactionButton(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Input(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var appBar = AppBar(
      title: Text('Expense Tracker'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _addNewTransactionButton(context),
        ),
      ],
    );

    var txList = Container(
      height: (MediaQuery.of(context).size.height * 0.7 -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top),
      child: TransactionList(
        _userTransactions,
        _deleteTransaction,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("show chart"),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height * 0.32 -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top),
                child: Chart(_recentTransactions),
              ),
            if (!isLandscape) txList,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height * 0.7 -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top),
                      child: Chart(_recentTransactions),
                    )
                  : txList,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransactionButton(context),
      ),
    );
  }
}
