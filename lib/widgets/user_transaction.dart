import './transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  // const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransa),
        TransactionList(_userTran)
      ],
    );
  }
}
