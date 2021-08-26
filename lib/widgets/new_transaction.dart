import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
//  const NewTransaction({ Key? key }) : super(key: key);
  final titleController = TextEditingController();
  final amountContoller = TextEditingController();

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
