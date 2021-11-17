import 'dart:convert';

class Ocean {
  int id;
  String name;
  String imagePath;

  Ocean({required this.id, required this.name, required this.imagePath});

  factory Ocean.fromJson(String str) => Ocean.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ocean.fromMap(Map<String, dynamic> json) => Ocean(
      id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
      name: json["name"],
      imagePath: json["imagePath"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "name": name, "imagePath": imagePath};
}
