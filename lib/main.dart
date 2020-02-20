// flutter
import 'package:flutter/material.dart';

// custom
import './widgets/user_transactions.dart';

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
  // user input variables
  // String titleInput;
  // String amountInput;

  final titleController =
      TextEditingController(); // flutter controller for text input
  final amountController =
      TextEditingController(); // flutter controller for text input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenditure Tracker'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ]),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
          UserTransactions(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
