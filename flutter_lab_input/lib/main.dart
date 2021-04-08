import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class LoginData {
  String username = "";
  String password = "";
  String name = "";
  String address = "";
  String phone = "";
}

class _MyApp extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool status = false;
  String text = '';
  void presslogin() {
    setState(() {
      status = true;
    });
    if (status == true) {
      setState(() {
        text =
            "Welcome  \n E-mail: ${_loginData.username} \n name: ${_loginData.name} \n address: ${_loginData.address} \n phone: ${_loginData.phone}";
      });
    }
  }

  @override
  Widget build(BuildContext inContext) {
    return MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                padding: EdgeInsets.all(50.0),
                child: Form(
                    key: this._formKey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter username";
                            }

                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.username = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "none@none.com",
                              labelText: "Username (eMail address)")),
                      TextFormField(
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter name";
                            }

                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.name = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "name", labelText: "Enter name:")),
                      TextFormField(
                          obscureText: true,
                          validator: (String inValue) {
                            if (inValue.length < 10) {
                              return "Password must be >=10 in length";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.password = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Enter password: ")),
                      TextFormField(
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter address";
                            }

                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.address = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "address",
                              labelText: "Enter address:")),
                      TextFormField(
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter phone";
                            }

                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.phone = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "000-0000000",
                              labelText: "Enter phone:")),
                      RaisedButton(
                          child: Text("Log In!"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print("Username: ${_loginData.username}");
                              print("Password: ${_loginData.password}");
                              print("Name: ${_loginData.name}");
                              print("Address: ${_loginData.address}");
                              print("Phone: ${_loginData.phone}");
                              presslogin();
                            }
                          }),
                      Container(
                        padding: EdgeInsets.all(50.0),
                        child: Text("${text}"),
                      )
                    ])))));
  }
}
