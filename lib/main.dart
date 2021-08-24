import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                  color: Colors.blue, width: 100, child: Text('CHART')),
              elevation: 4,
            ),
            Card(
              child: Text('List of TX'),
            )
          ],
        ));
  }
}
