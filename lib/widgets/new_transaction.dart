import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
//  const NewTransaction({ Key? key }) : super(key: key);
  final Function addtx;
  final titleController = TextEditingController();
  final amountContoller = TextEditingController();

  NewTransaction(this.addtx);

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
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: amountContoller,
              //      onChanged: (val) => amntInput = val,
              decoration: InputDecoration(labelText: "Amount"),
            ),
            TextButton(
                onPressed: () {
                  addtx(
                      titleController.text, double.parse(amountContoller.text));

                  print(titleController.text);
                  print(amountContoller.text);
                },
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
