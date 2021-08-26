import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // late String ttlInput;
  // late String amntInput;
  // or just use a built in method for value getting with byilt in feature
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

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
                onPressed: () {},
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
              UserTransactions()
            ],
          )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ));
  }
}
