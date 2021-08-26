import 'package:expence_tracker/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 49.9, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New slippers', amount: 9.9, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'New phone', amount: 149.9, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Demo'),
            ),
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('CHART'),
                    color: Colors.blue,
                    // child: Container(  one way is wrapping the child the other is wrapping the parent
                    //     width: double.infinity,
                    //     child: Text('CHART')),
                    elevation: 4,
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: "Title"),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Amount"),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Add Transactions',
                              style: TextStyle(color: Colors.teal),
                            ))
                      ],
                    ),
                  ),
                ),
                Column(
                  children: transactions.map((tx) {
                    return Card(
                        child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
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
                              DateFormat.yMMMd().format(
                                  tx.date), //'yyyy-MM-dd date constructor
                              style: TextStyle(color: Colors.blueGrey),
                            )
                          ],
                        )
                      ],
                    ));
                  }).toList(),
                )
              ],
            )));
  }
}
