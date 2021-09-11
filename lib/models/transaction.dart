import 'package:hive/hive.dart';

part 'transaction.g.dart';


@HiveType(typeId: 0)
class Transaction extends HiveObject{
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double amount;
  @HiveField(3)
  DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
