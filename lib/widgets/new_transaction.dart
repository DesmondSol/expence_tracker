import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
//  const NewTransaction({ Key? key }) : super(key: key);
  final Function addtx;
  final titleController = TextEditingController();
  final amountContoller = TextEditingController();

  NewTransaction(this.addtx);

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
    addtx(enteredTitle, enteredAmnt);
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
                  style: TextStyle(color: Colors.teal),
                ))
          ],
        ),
      ),
    );
  }
}
