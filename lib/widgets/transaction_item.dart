//dart
import 'dart:math';
// flutter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// custom
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key, // Key step 2: accept the key (origin: transactionList)
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key); // Key step 3: forward the key

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

@override
void initState() { 
  const availableColors = [Colors.red, Colors.black, Colors.blue, Colors.purple];
  _bgColor = availableColors[Random().nextInt(4)];
  super.initState();
}

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
          backgroundColor: _bgColor,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          // style: Theme.of(context).textTheme.subtitle,
        ),
        trailing: (MediaQuery.of(context).size.width > 360)
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: const Text('Delete'), // Skipping redundant object instantiation when parent rebuilds
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(
                  widget.transaction.id,
                ),
              ),
      ),
    );
  }
}
