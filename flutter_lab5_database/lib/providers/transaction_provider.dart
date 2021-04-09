import 'package:flutter/cupertino.dart';
import 'package:flutter_lab5_database/database/transaction_db.dart';
import 'package:flutter_lab5_database/models/Transactions.dart';
import 'package:sembast/sembast.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: "transaction.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transaction.db");

    // บันทึกข้อมูล
    await db.InsertData(statement);

    // ดึงข้อมูล
    transactions = await db.loadAllData();

    // แทรกข้อมูลไปบนสุดที่ ตำแหน่ง 0
    transactions.insert(0, statement);
    notifyListeners();
  }
}
