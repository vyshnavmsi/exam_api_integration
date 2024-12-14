// To parse this JSON data, do
//
//     final objects = objectsFromJson(jsonString);

import 'dart:convert';

List<Objectsmodel> objectsFromJson(String str) => List<Objectsmodel>.from(
    json.decode(str).map((x) => Objectsmodel.fromJson(x)));
Objectsmodel objectsdetailmodelFromJson(String str) =>
    objectsdetailmodelFromJson(json.decode(str));

// String objectsToJson(List<Objectsmodel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Objectsmodel {
  String? id;
  String? name;
  Data? data;

  Objectsmodel({
    this.id,
    this.name,
    this.data,
  });

  factory Objectsmodel.fromJson(Map<String, dynamic> json) => Objectsmodel(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
      };
}

class Data {
  String? color;
  String? capacity;

  Data({
    this.color,
    this.capacity,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "capacity": capacity,
      };
}
