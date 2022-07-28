import 'dart:convert';

List<CarsModel> carsModelFromJson(String str) => List<CarsModel>.from(json.decode(str).map((x) => CarsModel.fromJson(x)));

String carsModelToJson(List<CarsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarsModel {
  CarsModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  factory CarsModel.fromJson(Map<String, dynamic> json) => CarsModel(
    id: json["id"],
    year: json["year"],
    make: json["make"],
    model: json["model"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "year": year,
    "make": make,
    "model": model,
    "type": type,
  };
}