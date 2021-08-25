import 'package:expence_tracker/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 49.9, date: DateTime.now())
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Text('List of TX'),
                )
              ],
            )));
  }
}
