import 'dart:convert';

List<String> brandModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String brandModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
