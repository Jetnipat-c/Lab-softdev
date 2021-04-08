import 'dart:io';

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

  Future <Database> openDatabase() async {
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
}
