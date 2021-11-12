import 'package:expence_tracker/models/transaction.dart';
import './chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTrans;

  Chart(this.recentTrans);

  List<Map<String, Object>> get groupedTransVals {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0.0;
      for (var i = 0; i < recentTrans.length; i++) {
        if (recentTrans[i].date.day == weekDay.day &&
            recentTrans[i].date.month == weekDay.month &&
            recentTrans[i].date.year == weekDay.year) {
          totalsum += recentTrans[i].amount;
        }
      }
     // print(DateFormat.E().format(weekDay));
     // print(totalsum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransVals.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
   // print(groupedTransVals);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransVals.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  e['day'] as String,
                  e['amount'] as double,
                  totalSpending == 0.0 //so that dividing by zero doesnt happen
                      ? 0.0
                      : (e["amount"] as double) / totalSpending),
            ); //Text('${e['day']}: ${e['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}
