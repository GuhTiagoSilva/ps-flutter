import 'dart:convert';

import 'package:ocean_tech/model/ocean.dart';

class OceanMaxTemperatureModel {
  double maxTemperature;
  String ocean;
  String period;

  OceanMaxTemperatureModel(
      {required this.maxTemperature,
      required this.ocean,
      required this.period});

  factory OceanMaxTemperatureModel.fromJson(String str) =>
      OceanMaxTemperatureModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OceanMaxTemperatureModel.fromMap(Map<String, dynamic> json) =>
      OceanMaxTemperatureModel(
          maxTemperature: json["maxTemperature"],
          ocean: json["ocean"],
          period: json["period"]);

  Map<String, dynamic> toMap() =>
      {"maxTemperature": maxTemperature, "ocean": ocean, "period": period};
}
