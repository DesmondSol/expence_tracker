import './widgets/transaction_list.dart';

import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/chart.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amberAccent,
          errorColor: Colors.redAccent,
          fontFamily: 'Exo2',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Exo2',
                  fontSize: 17,
                  fontWeight: FontWeight.normal),
              button: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.normal)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'AdventPro',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)))),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // late String ttlInput;
  // late String amntInput;
  // or just use a built in method for value getting with byilt in feature
  @override
  MyHomeePage createState() => MyHomeePage();
}

class MyHomeePage extends State<MyHomePage> {
  final List<Transaction> _userTran = [
    //   Transaction(
    //       id: '1', title: 'New shoes', amount: 49.9, date: DateTime.now()),
    //   Transaction(
    //       id: '2', title: 'New slippers', amount: 9.9, date: DateTime.now()),
    //   Transaction(
    //       id: '3', title: 'New phone', amount: 149.9, date: DateTime.now())
  ];

  List<Transaction> get _recentTrans {
    return _userTran.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransa(String txtitle, double txamount, DateTime chosenDate) {
    int b;
    if (_userTran.isEmpty) {
      b = 1;
      //print(b);
    } else {
      b = int.parse(_userTran.last.id) + 1;
    }
    // print('$b $txtitle $txamount');
    final newTx = Transaction(
      id: b.toString(),
      title: txtitle,
      amount: txamount,
      date: chosenDate,
    );

    setState(() {
      _userTran.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          //  return NewTransaction(_addNewTransa);
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransa),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // scaffoldMessengerKey: _messangerKey,
        //  debugShowCheckedModeBanner: false,
        //    title: 'Flutter Demo',
        //    theme: ThemeData(
        //     primarySwatch: Colors.blue,
        //   ),

        appBar: AppBar(
          //actionsIconTheme: IconThemeData(color: Colors.white10, size: 36),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Add',
                onPressed: () {
                  _startAddNewTransaction(context);
                }
                //     _startAddNewTransaction(co): Builder(
                // builder: (context) => _startAddNewTransaction(context)
                ),
            IconButton(
              icon: const Icon(Icons.account_box_outlined),
              tooltip: 'About creators',
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text(
                    'made by Solomon T \n contact me: soltig66@gmail.com',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  //      duration: Duration(milliseconds: 200),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
          leading: Icon(Icons.access_time_sharp),
          leadingWidth: 70,
          title: const Text('Expense Planner'),
          //  centerTitle: true,
        ),
        body: SingleChildScrollView(
            //for full screen scroll
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Chart(_recentTrans), TransactionList(_userTran)],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: Icon(Icons.add),
          ),
        ));
  }
}
