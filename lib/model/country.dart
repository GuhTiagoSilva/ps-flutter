import 'dart:convert';

import 'package:ocean_tech/model/ocean.dart';

class Country {
  int id;
  String name;
  String population;
  List<Ocean> oceans = [];

  Country(
      {required this.id,
      required this.name,
      required this.population,
      required this.oceans});

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
      id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
      name: json["name"],
      population: json["population"],
      oceans: json["oceans"].cast<Ocean>());

  Map<String, dynamic> toMap() =>
      {"id": id, "name": name, "population": population, "oceans": oceans};
}
