import 'dart:convert';

class OceanCustomResult {
  String? ocean;
  String? period;
  double? ph;
  double? temperature;

  OceanCustomResult({this.ocean, this.period, this.ph, this.temperature});

  factory OceanCustomResult.fromJson(String str) =>
      OceanCustomResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OceanCustomResult.fromMap(Map<String, dynamic> json) =>
      OceanCustomResult(
          ocean: json["ocean"],
          period: json["period"],
          ph: json["ph"],
          temperature: json["temperature"]);

  Map<String, dynamic> toMap() =>
      {"ocean": ocean, "period": period, "ph": ph, "temperature": temperature};
}
