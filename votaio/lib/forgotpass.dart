import 'package:flutter/material.dart';
import 'login.dart';

//    Scaffold.of(context).showSnackBar(SnackBar(
//    content: Text("Incorrect username or password."),

class ScreenForgotPass extends StatefulWidget {
  @override
  _ScreenForgotPassState createState() => _ScreenForgotPassState();
}

class _ScreenForgotPassState extends State<ScreenForgotPass> {
  TextEditingController emailController = TextEditingController();
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reset your password"),
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
                  Icon(Icons.feedback, size: 120, color: Colors.teal),
                  Text(
                    "Enter your email address and we will send you a link to reset your password.",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
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
                        return "Enter an email address";
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
                                        Text("we sent you email to reset password."),
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
                                        Text("Enter an email address"),
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
                          "send password reset email",
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
