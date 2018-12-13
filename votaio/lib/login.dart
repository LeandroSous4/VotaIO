import 'package:flutter/material.dart';
import 'singup.dart';
import 'forgotpass.dart';
import 'group.dart';

//    Scaffold.of(context).showSnackBar(SnackBar(
//    content: Text("Incorrect username or password."),

class ScreenLogin extends StatefulWidget {
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _logar({String login: "sousa-04@hotmail.com", String pass}) {
    if (login == "sousa-04@hotmail.com" && pass == "senha123") {
      return true;
    } else {
      setState(() {
        passController.text = "";
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Vota.io"),
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
                  Icon(Icons.person_outline, size: 120, color: Colors.teal),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Login:",
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Enter your username or email',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: loginController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Invalid user";
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
                      if (value.isEmpty ||
                          _logar(pass: passController.text) == false) {
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
                            if (_logar(
                                    login: '${loginController.text}',
                                    pass: '${passController.text}') ==
                                true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoteList()),
                              );
                            }
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
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenSignUp()),
                          );
                        },
                        child: Text(
                          "SignUp",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.teal, fontSize: 15),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenForgotPass()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.teal, fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
