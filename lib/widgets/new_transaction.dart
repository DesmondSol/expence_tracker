import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

// consider converting to stateful widget if stg is not working
class NewTransaction extends StatefulWidget {
//  const NewTransaction({ Key? key }) : super(key: key);
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountContoller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_titleController.text.isEmpty || _amountContoller.text.isEmpty) {
      print('please enter values');
      Fluttertoast.showToast(
          msg: "please enter values",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmnt = double.parse(_amountContoller.text);
    // addtx(titleController.text,  // another way of putting it
    // double.parse(amountContoller.text)
    if (enteredAmnt <= 0) {
      print('please enter realistic values');
      Fluttertoast.showToast(
          msg: "please enter realistic values",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    widget.addtx(enteredTitle, enteredAmnt, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
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
              controller: _titleController,
              //     onChanged: (val) => ttlInput = val,
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _amountContoller,
              //onSubmitted: (_) => _submitData(),

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //      onChanged: (val) => amntInput = val,  is an alternative to thr controller above
              decoration: InputDecoration(labelText: "Amount"),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      // _selectedDate == null
                      //     ? 'No Date Chosen':
                      'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Theme.of(context).textTheme.button!.color),
                onPressed: _submitData,
                child: Text(
                  'Add Transactions',
                  //   style: TextStyle(
                  //       color: Theme.of(context).textTheme.button!.color),
                ))
          ],
        ),
      ),
    );
  }
}
