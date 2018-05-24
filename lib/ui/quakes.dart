import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/quake.dart';
import 'quake_card.dart';

class Quakes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuakeState();
  }
}

class QuakeState extends State<Quakes> {
  final apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";

  Future<List<Quake>> getQuakes() async {
    http.Response response = await http.get(apiUrl);
    return Quake.all(json.decode(response.body)['features']);
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getQuakes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, position) {
              return new QuakeCard(snapshot, position);
            }
          );
        }
        if (snapshot.hasError) {
          return new Text("Error: ${snapshot.error}");
        }
        return new Center(
          child: new CircularProgressIndicator()
        );
      });
  }
}