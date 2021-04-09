import 'package:flutter/material.dart';
import 'package:flutter_lab5_database/models/Transactions.dart';
import 'package:flutter_lab5_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  // controller
  final fnameContrller = TextEditingController();
  final lnameContrller = TextEditingController();
  final addressContrller = TextEditingController();
  final telContrller = TextEditingController();
  final emailContrller = TextEditingController();
  final passwordContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มสมัครสมาชิก"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 0, right: 5, left: 5),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อ"),
                  controller: fnameContrller,
                  autofocus: true,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาป้อนชื่อผู้ใช้";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "นามสกุล"),
                  controller: lnameContrller,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาป้อนนามสกุล";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ที่อยู่"),
                  controller: addressContrller,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาป้อนที่อยู่";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "เบอร์โทร"),
                  controller: telContrller,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาป้อนเบอร์โทรศัพท์";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      new InputDecoration(labelText: "ชื่อผู้ใช้ หรือ E-mail"),
                  controller: emailContrller,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาป้อนชื่อผู้ใช้ หรือ E-mail";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(labelText: "รหัสผ่าน"),
                  controller: passwordContrller,
                  validator: (val) =>
                      val.length < 6 ? 'Password too short.' : null,
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text("เพิ่มข้อมูล"),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      var fname = fnameContrller.text;
                      var lname = lnameContrller.text;
                      var address = addressContrller.text;
                      var tel = telContrller.text;
                      var email = emailContrller.text;
                      var password = passwordContrller.text;

                      // เตรียมข้อมูลก่อนส่งให้ provider
                      Transactions statement = Transactions(
                        fname: fname,
                        lname: lname,
                        address: address,
                        tel: tel,
                        email: email,
                        password: password,
                      ); // obj

                      // เรียก Provider
                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
