import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ScreenVoting extends StatefulWidget {
  @override
  _ScreenVotingState createState() => _ScreenVotingState();
}

class _ScreenVotingState extends State<ScreenVoting> {
  TextEditingController idController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double rating = 2.5;
  int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Voting"),
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
                  Icon(Icons.star_half, size: 120, color: Colors.teal),
                  Text(
                    "You are voting in the group: CORE",
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  StarRating(
                    size: 45.0,
                    rating: rating,
                    color: Colors.orange,
                    borderColor: Colors.grey,
                    starCount: starCount,
                    onRatingChanged: (rating) => setState(
                          () {
                            this.rating = rating;
                          },
                        ),
                  ),
                  Text(
                    "Your rating is: " + (rating*2).toString(),
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print("DEu CERTO");
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
