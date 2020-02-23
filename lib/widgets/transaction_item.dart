// flutter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// custom
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          // style: Theme.of(context).textTheme.subtitle,
        ),
        trailing: (MediaQuery.of(context).size.width > 360)
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                label: const Text('Delete'), // Skipping redundant object instantiation when parent rebuilds
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(
                  transaction.id,
                ),
              ),
      ),
    );
  }
}
