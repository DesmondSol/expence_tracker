import 'package:flutter/material.dart';

// consider converting to stateful widget if stg is not working
class NewTransaction extends StatefulWidget {
//  const NewTransaction({ Key? key }) : super(key: key);
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountContoller = TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty || amountContoller.text.isEmpty) {
      print('please enter values');
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmnt = double.parse(amountContoller.text);
    // addtx(titleController.text,  // another way of putting it
    // double.parse(amountContoller.text)
    if (enteredAmnt <= 0) {
      print('please enter realistic values');
      return;
    }
    widget.addtx(enteredTitle, enteredAmnt);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              //     onChanged: (val) => ttlInput = val,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: amountContoller,
              onSubmitted: (_) => submitData(),

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //      onChanged: (val) => amntInput = val,  is an alternative to thr controller above
              decoration: InputDecoration(labelText: "Amount"),
            ),
            TextButton(
                onPressed: submitData,
                child: Text(
                  'Add Transactions',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
