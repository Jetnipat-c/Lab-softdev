import 'package:flutter/material.dart';
import 'package:flutter_lab5_database/providers/transaction_provider.dart';
import 'package:flutter_lab5_database/screens/form_screen.dart';
import 'package:provider/provider.dart';

import 'models/Transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
        // ChangeNotifierProvider(create: (context) {
        //   return TransactionProvider();
        // })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Local Database'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormScreen();
                  }));
                })
          ],
        ),
        body: Consumer(
          builder: (contex, TransactionProvider provider, Widget child) {
            return ListView.builder(
                itemCount: provider.transaction.length,
                itemBuilder: (context, int index) {
                  Transactions data = provider.transaction[index];
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: Text("500"),
                        ),
                      ),
                      title: Text("ข้อมูลผู้ใช้"),
                      subtitle: Text(
                          "ชื่อ ${data.fname} \n นามสกุล ${data.lname} \n ที่อยู่ ${data.address} \n เบอร์โทร ${data.tel} \n ชื่อผู้ใช้ หรือ E-mail ${data.email}"),
                    ),
                  );
                });
          },
        ));
  }
}
