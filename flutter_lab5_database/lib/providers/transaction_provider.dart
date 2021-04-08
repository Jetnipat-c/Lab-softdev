import 'package:flutter/cupertino.dart';
import 'package:flutter_lab5_database/database/transaction_db.dart';
import 'package:sembast/sembast.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transaction = [];

  List<Transaction> getTransaction() {
    return transaction;
  }

  void addTransaction(Transaction statement) async {
    var db = await TransactionDB(dbName: "transaction.db").openDatabase();
    print(db);
    transaction.insert(0, statement);
    notifyListeners();
  }
}
