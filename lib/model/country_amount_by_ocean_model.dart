import 'dart:convert';

import 'package:ocean_tech/model/ocean.dart';

class CountryAmountByOceanModel {
  int countries;
  String ocean;
  String imagePath;

  CountryAmountByOceanModel(
      {required this.countries, required this.ocean, required this.imagePath});

  factory CountryAmountByOceanModel.fromJson(String str) =>
      CountryAmountByOceanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountryAmountByOceanModel.fromMap(Map<String, dynamic> json) =>
      CountryAmountByOceanModel(
          countries: json["countries"],
          ocean: json["ocean"],
          imagePath: json["imagePath"]);

  Map<String, dynamic> toMap() =>
      {"countries": countries, "ocean": ocean, "imagePath": imagePath};
}
