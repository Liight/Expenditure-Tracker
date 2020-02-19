// flutter
import 'package:flutter/material.dart';

// custom
import './transaction.dart';

// run app
void main() => runApp(MyApp());

// main app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

// main app state
class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 49.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Hat',
      amount: 39.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Sunglasses',
      amount: 189.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Weekly Groceries',
      amount: 129.55,
      date: DateTime.now(),
    ),
  ]; // list of transactions(custom class Transaction is not a widget)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text(
                'CHART!',
              ),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(children: <Widget>[
                  Container(
                    child: Text(
                      tx.amount.toString(),
                    ),
                  ),
                  Column(children: <Widget>[
                    Text(tx.title),
                    Text(
                      tx.date.toString(),
                    ),
                  ]),
                ]),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
