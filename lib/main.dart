import './widgets/transaction_list.dart';

import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // late String ttlInput;
  // late String amntInput;
  // or just use a built in method for value getting with byilt in feature
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  final List<Transaction> _userTran = [
    Transaction(
        id: '1', title: 'New shoes', amount: 49.9, date: DateTime.now()),
    Transaction(
        id: '2', title: 'New slippers', amount: 9.9, date: DateTime.now()),
    Transaction(
        id: '3', title: 'New phone', amount: 149.9, date: DateTime.now())
  ];

  void _addNewTransa(String txtitle, double txamount) {
    int b = int.parse(_userTran.last.id) + 1;
    final newTx = Transaction(
        id: b.toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());

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
    return MaterialApp(
        scaffoldMessengerKey: _messangerKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              //actionsIconTheme: IconThemeData(color: Colors.white10, size: 36),
              backgroundColor: Colors.teal,
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
                    _messangerKey.currentState!.showSnackBar(const SnackBar(
                      content: Text(
                        'made by Solomon T \n contact me: soltig66@gmail.com',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.teal,
                      //      duration: Duration(milliseconds: 200),
                    ));
                  },
                ),
              ],
              leading: Icon(Icons.access_time_sharp),
              leadingWidth: 70,
              title: const Text('Expense Planner'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                //for full screen scroll
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
                TransactionList(_userTran)
              ],
            )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () => _startAddNewTransaction(context),
                child: Icon(Icons.add),
              ),
            )));
  }
}
