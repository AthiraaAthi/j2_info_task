// To parse this JSON data, do
//
//     final sampleApi = sampleApiFromJson(jsonString);

import 'dart:convert';

List<SampleApi> sampleApiFromJson(String str) =>
    List<SampleApi>.from(json.decode(str).map((x) => SampleApi.fromJson(x)));

class SampleApi {
  String? name;
  String? age;
  String? address;

  SampleApi({
    this.name,
    this.age,
    this.address,
  });

  factory SampleApi.fromJson(Map<String, dynamic> json) => SampleApi(
        name: json["name"],
        age: json["age"],
        address: json["address"],
      );
}
