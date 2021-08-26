import './widgets/user_transaction.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // late String ttlInput;
  // late String amntInput;
  // or just use a built in method for value getting with byilt in feature

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
            body: SingleChildScrollView(
                child: Column(
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
                UserTransactions()
              ],
            ))));
  }
}
