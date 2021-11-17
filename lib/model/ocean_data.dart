import 'dart:convert';

import 'package:ocean_tech/components/enum/WeekDay.dart';

class OceanData {
  int id;
  double ph;
  double temperature;
  DateTime startDate;
  WeekDay weekDay;
  int oceanId;

  OceanData(
      {required this.id,
      required this.ph,
      required this.temperature,
      required this.startDate,
      required this.weekDay,
      required this.oceanId});

  factory OceanData.fromJson(String str) => OceanData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OceanData.fromMap(Map<String, dynamic> json) => OceanData(
      id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
      ph: json["ph"],
      temperature: json["temperature"],
      startDate: json["startDate"],
      weekDay: json["weekDay"],
      oceanId: json["oceanId"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "ph": ph,
        "temperature": temperature,
        "startDate": startDate,
        "weekDay": weekDay,
        "oceanId": oceanId
      };
}
