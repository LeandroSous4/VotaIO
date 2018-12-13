import 'package:flutter/material.dart';
import 'voting.dart';

class ScreenParticipe extends StatefulWidget {
  @override
  _ScreenParticipeState createState() => _ScreenParticipeState();
}

class _ScreenParticipeState extends State<ScreenParticipe> {
  TextEditingController idController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _codeVote(String id) {
    if (id == "ls99") {
      return true;
    } else {
      setState(() {
        idController.text = "";
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Participate in voting"),
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
                  Icon(Icons.all_inclusive, size: 120, color: Colors.teal),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Voting code:",
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Enter the voting code',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: idController,
                    validator: (value) {
                      if (value.isEmpty ||
                          _codeVote(idController.text) == false) {
                        return "Invalid code";
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
                            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenVoting()),
                    );
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("ERROR"),
                                    content: Text("Incorrect voting code."),
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
                          "Vote",
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
