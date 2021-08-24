import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              children: <Widget>[
                Card(
                  child: Text('CHART'),
                  // child: Container(  one way is wrapping the child the other is wrapping the parent
                  //     color: Colors.blue,
                  //     width: double.infinity,
                  //     child: Text('CHART')),
                  elevation: 4,
                ),
                Card(
                  child: Text('List of TX'),
                )
              ],
            )));
  }
}
