import 'package:flutter/material.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScreenSignUp extends StatefulWidget {
  @override
  _ScreenSignUpState createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  TextEditingController loginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp Vota.io"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.account_circle, size: 120, color: Colors.teal),
                  Text(
                    "Create your personal account",
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Username:",
                      labelStyle: TextStyle(color: Colors.teal),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: loginController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter your username";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email:",
                      labelStyle: TextStyle(color: Colors.teal),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter your email";
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Type your password',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: passController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Invalid password";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("SUCCESSFULLY"),
                                    content:
                                        Text("user successfully registered."),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ScreenLogin()),
                                          );
                                        },
                                      )
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("ERROR"),
                                    content:
                                        Text("Incorrect user or password."),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Close"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          }
                        },
                        child: Text(
                          "SingUp",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
