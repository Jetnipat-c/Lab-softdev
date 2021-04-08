import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มสมัครสมาชิก"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อ"),
                  autofocus: true,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "นามสกุล"),
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ที่อยู่"),
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "เบอร์โทร"),
                ),
                TextFormField(
                  decoration:
                      new InputDecoration(labelText: "ชื่อผู้ใช้ หรือ E-mail"),
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "รหัสผ่าน"),
                ),
                FlatButton(
                  child: Text("เพิ่มข้อมูล"),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
