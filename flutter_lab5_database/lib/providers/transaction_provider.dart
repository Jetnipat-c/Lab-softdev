import 'package:flutter/cupertino.dart';
import 'package:flutter_lab5_database/database/transaction_db.dart';
import 'package:flutter_lab5_database/models/Transactions.dart';
import 'package:sembast/sembast.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transaction = [
    Transactions(
        fname: "เจตนิพัทธ์",
        lname: "ตันเกียรติพงัน",
        address: "119/95 Phuket",
        tel: "098-9999999",
        email: "s6035512021@phuket.psu.ac.th",
        password: "123456")
  ];

  List<Transactions> getTransaction() {
    return transaction;
  }

  void addTransaction(Transactions statement) async {
    // var db = await TransactionDB(dbName: "transaction.db").openDatabase();
    // print(db);
    // แทรกข้อมูลไปบนสุดที่ ตำแหน่ง 0
    transaction.insert(0, statement);
    notifyListeners();
  }
}
