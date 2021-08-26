import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  //
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
// Container( //we can use this scrollable here this way
//
//       child: SingleChildScrollView(
//         child: Column(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2)),
                child: Text(
                  '\$${transaction[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction[index].title,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18 - 2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(
                        transaction[index].date), //'yyyy-MM-dd date constructor
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              )
            ],
          ));
        },
        itemCount: transaction.length,
        //  children: transaction.map((tx) {}).toList(),
      ),
    );
  }
}
