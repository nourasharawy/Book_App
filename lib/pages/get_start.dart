import 'package:flutter/material.dart';

import 'home.dart';
class GetStart extends StatefulWidget {
  @override
  _GetStartState createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books")),
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.85),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: RaisedButton(
                padding: EdgeInsets.all(30),
                color: Colors.white70,
                child: Text(('Start'), style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold,)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home()));
                }),
          ),
        ],
      ),
    );
  }
}
