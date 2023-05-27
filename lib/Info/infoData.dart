import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

late Plant plants;
const errImage = 'https://watchandlearn.scholastic.com/content/dam/classroom-magazines/watchandlearn/videos/animals-and-plants/plants/what-are-plants-/english/wall-2018-whatareplantsmp4.transform/content-tile-large/image.png';
String search = "";
ValueNotifier<int> plantNotifier = ValueNotifier<int>(0);

Future<int> getPlants() async {
  String url = 'https://perenual.com/api/species-list?key=sk-a7D5647104910a4821058&indoor=1&q=$search';
  print(url);
  var client = http.Client();
  var uri = Uri.parse(url);
  var response = await client.get(uri);
  if (response.statusCode == 200){
    plants = plantFromJson(response.body);
    return 0;
  }
  return 1;
}



Plant plantFromJson(String str) => Plant.fromJson(json.decode(str));

class Plant {
  final List<Datum> data;
  final int to;
  final int perPage;
  final int currentPage;
  final int from;
  final int lastPage;
  final int total;

  Plant({
    required this.data,
    required this.to,
    required this.perPage,
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.total,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    to: json["to"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    total: json["total"],
  );
}

class Datum {
  final int id;
  final String commonName;
  final List<String> scientificName;
  final List<String> otherName;
  final String cycle;
  final String watering;
  final List<String> sunlight;
  final DefaultImage defaultImage;

  Datum({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.otherName,
    required this.cycle,
    required this.watering,
    required this.sunlight,
    required this.defaultImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    commonName: json["common_name"],
    scientificName: List<String>.from(json["scientific_name"].map((x) => x)),
    otherName: List<String>.from(json["other_name"].map((x) => x)),
    cycle: json["cycle"]!,
    watering: json["watering"]!,
    sunlight: List<String>.from(json["sunlight"]),
    defaultImage: DefaultImage.fromJson(json["default_image"]),
  );
}

class DefaultImage {
  final int license;
  final String licenseName;
  final String licenseUrl;
  final String originalUrl;
  final String? regularUrl;
  final String? mediumUrl;
  final String? smallUrl;
  final String? thumbnail;

  DefaultImage({
    required this.license,
    required this.licenseName,
    required this.licenseUrl,
    required this.originalUrl,
    this.regularUrl,
    this.mediumUrl,
    this.smallUrl,
    this.thumbnail,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) => DefaultImage(
    license: json["license"],
    licenseName: json["license_name"],
    licenseUrl: json["license_url"],
    originalUrl: json["original_url"],
    regularUrl: json["regular_url"],
    mediumUrl: json["medium_url"],
    smallUrl: json["small_url"],
    thumbnail: json["thumbnail"],
  );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}