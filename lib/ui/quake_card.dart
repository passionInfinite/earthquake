import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuakeCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int position;

  QuakeCard(this.snapshot, this.position);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw new Exception("Hello World!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        child: new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Row(
                children: <Widget>[
                  new CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: new Center(
                      child: new Text(snapshot.data[position].magnitude, style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ),
                    radius: 36.0,
                  ),
                  new Flexible(
                    child: new Column(
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        new Container(
                          alignment: Alignment.topLeft,
                          margin: new EdgeInsets.only(left: 10.0),
                          child: new Text(snapshot.data[position].place, style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ),
                        new Container(
                          alignment: Alignment.topLeft,
                          margin: new EdgeInsets.only(top: 10.0, left: 10.0),
                          child: new Text(snapshot.data[position].time, style: new TextStyle(fontSize: 16.0)),
                        ),
                        new Container(
                          alignment: Alignment.topLeft,
                          margin: new EdgeInsets.only(top: 10.0, left: 10.0),
                          child: new InkWell(
                            child: new Row(
                              children: <Widget>[
                                new Icon(Icons.info_outline, color: Colors.lightBlue),
                                new Padding(padding: new EdgeInsets.only(left: 2.0)),
                                new Text("More Information", style: new TextStyle(color: Colors.lightBlue, fontSize: 16.0))
                              ],
                            ),
                            onTap: () => _launchURL(snapshot.data[position].url),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}