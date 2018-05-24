import 'package:flutter/material.dart';
import 'quakes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        title: new Container(
          child: new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.info),
                new Padding(
                  padding: const EdgeInsets.all(2.0),
                ),
                new Text("Earthquakes")
              ],
            )
          )
        ),
      ),
      body: new Quakes(),
    );
  }
}