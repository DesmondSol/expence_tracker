
import 'package:hive/hive.dart';

import 'models/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('Participants');
}
