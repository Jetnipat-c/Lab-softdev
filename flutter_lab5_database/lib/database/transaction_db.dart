import 'dart:io';

import 'package:flutter_lab5_database/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  // บริการเกี่ยวกับฐานข้อมูล

  String dbName;

  // ถ้ายังไม่ถูกสร้าง => สร้าง
  // ถูกสร้างไว้แล้ว => เปิด
  TransactionDB({this.dbName});

  Future<Database> openDatabase() async {
    // หาตำแหน่งที่จะเก็บข้อมูล

    // dbLocation = c:/user/cheer
    // dbLocation = c:/user/cheer/transaction.db
    Directory appDirectory = await getApplicationDocumentsDirectory();
    // dbName = transaction.db
    String dbLocation = join(appDirectory.path, dbName);
    // สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  // บันทึกข้อมูล
  Future<int> InsertData(Transactions statement) async {
    // ฐานข้อมูล store
    // transaction.db => expense
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    // json
    var keyId = store.add(db, {
      "fname": statement.fname,
      "lname": statement.lname,
      "address": statement.address,
      "tel": statement.tel,
      "email": statement.email,
      "password": statement.password,
    });
    db.close();
    return keyId;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);
    List transactionList = List<Transactions>();
    for (var record in snapshot) {
      transactionList.add(Transactions(
        fname: record["fname"],
        lname: record["lname"],
        address: record["address"],
        tel: record["tel"],
        email: record["email"],
        password: record["password"],
      ));
    }
    return transactionList;
  }
}
