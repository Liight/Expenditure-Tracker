import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

  if(enteredTitle.isEmpty || enteredAmount <= 0){
    return;
  }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller:
                  titleController, // using the flutter controller for text input
              // onChanged: (value){ titleInput = value; },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller:
                  amountController, // using the flutter controller for text input
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // required for IOS check
              onSubmitted: (_) =>
                  submitData, // not using (_), just submitData, required acceptance for syntax
              // onChanged: (value){ amountInput = value; },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
