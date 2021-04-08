import 'package:flutter/material.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      var tel = telContrller;
                      var email = emailContrller.text;
                      var password = passwordContrller.text;

                      print(fname);
                      print(lname);
                      print(address);
                      print(tel);
                      print(email);
                      print(password);

                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
