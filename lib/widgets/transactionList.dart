// flutter
import 'package:flutter/material.dart';

// custom
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions; // 1st positional argument
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx); // bindings

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(children: <Widget>[
              Text('No transactions added yet',
                  style: Theme.of(context).textTheme.title),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ]);
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  key:
                      ValueKey(transactions[index].id), // Key step 1: Set the key at the topmost Widget(see: transaction_item)
                  transaction: transactions[index],
                  deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
