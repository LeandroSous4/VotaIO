import 'package:flutter/material.dart';
import 'login.dart';
import 'participe.dart';

void main() {
  runApp(MaterialApp(
      title: "Vota.Io",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vota.io",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Stack(
        children: <Widget>[
          Image.asset("images/votar.png", fit: BoxFit.cover, height: 1000.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 90, 10, 40),
                child: FlatButton(
                  splashColor: Colors.black,
                  child: Text("Create poll",
                      style: TextStyle(fontSize: 40.0, color: Colors.blueGrey)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenLogin()),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
                child: FlatButton(
                  splashColor: Colors.black,
                  child: Text("To vote",
                      style: TextStyle(fontSize: 40.0, color: Colors.blueGrey)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenParticipe()),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
      )
    );
  }
}
