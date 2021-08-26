import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTran = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 49.9, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New slippers', amount: 9.9, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'New phone', amount: 149.9, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTran.map((tx) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal, width: 2)),
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.teal),
              ),
              padding: EdgeInsets.all(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tx.title,
                  style: TextStyle(
                      color: Colors.teal[700],
                      fontSize: 18 - 2,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMd()
                      .format(tx.date), //'yyyy-MM-dd date constructor
                  style: TextStyle(color: Colors.blueGrey),
                )
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
