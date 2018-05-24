class Quake {
  String magnitude;
  String place;
  String time;
  String url;

  Quake(this.magnitude, this.place, this.time, this.url);

  static List<Quake> all(List json) {
    List<Quake> quakes = new List<Quake>();
    for(int i=0; i< json.length; i++) {
      quakes.add(new Quake(
          json[i]['properties']['mag'].toString(),
          json[i]['properties']['place'],
          DateTime.fromMillisecondsSinceEpoch(json[i]['properties']['time']).toString(),
          json[i]['properties']['url'])
      );
    }
    return quakes;
  }
}
