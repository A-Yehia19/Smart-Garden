import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const primaryGreen = Color(0xFF31a05f);
const secondGreen = Color(0xFF6bbe76);

const white = Color(0xFFFBFBFB);
const black = Color(0xFF0E1A0D);

late double width;
late double height;

ValueNotifier<int> counter = ValueNotifier<int>(0);
const plantImage = "Assets/plant1.png";
const alarmImage = "Assets/alarm.png";
const url = 'https://api.open-meteo.com/v1/forecast?latitude=31.20&longitude=29.92&current_weather=true';

int moisture = 80;
int waterLVL = 15;
double temp = 27;
bool motion = false;

String textMsg = "All good\n:D";
late String temperature;
late String status;

Future<int> getWeather() async {
  Map<int, String> condition= {
    0 : 'Clear Sky',
    1 : 'Partly Cloudy',
    2 : 'Partly Cloudy',
    3 : 'Partly Cloudy',
    45 : 'Fog',
    48 : 'Fog',
    51 : 'Light Drizzle',
    53 : 'Moderate Drizzle',
    55 : 'Dense Drizzle',
    56 : 'Light Freezing Drizzle',
    57 : 'Dense Freezing Drizzle',
    61 : 'Slight Rain',
    63 : 'Moderate Rain',
    65 : 'Heavy Rain',
    66 : 'Light Freezing Rain',
    67 : 'heavy Freezing Rain',
    71 : 'Slight Snow Fall',
    73 : 'Moderate Snow Fall',
    75 : 'Heavy Snow Fall',
    77 : 'Snow grains',
    80 : 'Slight Rain Showers',
    81 : 'Moderate Rain Showers',
    82 : 'Violent Rain Showers',
    85 : 'Slight Snow Showers',
    86 : 'Heavy Snow Showers',
    95 : 'Thunderstorm',
    96 : 'Thunderstorm with hail',
    99 : 'Thunderstorm with hail',
  };

  var client = http.Client();
  var uri = Uri.parse(url);
  var response = await client.get(uri);
  if (response.statusCode == 200){
    Map<String, dynamic> map = Map.castFrom(json.decode(response.body));

    temperature = map['current_weather']['temperature'].toString();
    int code = map['current_weather']['weathercode'];
    status = condition[code]?? 'Sunny';

    return 0;
  }
  return 1;
}

Future<int> getData() async{
  var db = FirebaseFirestore.instance;
  db.collection('sensors').doc('Moisture').get().then((value) => moisture = value['value']);
  db.collection('sensors').doc('Motion').get().then((value) => motion = value['value']);
  db.collection('sensors').doc('Temperature').get().then((value) => temp = value['value']);
  await db.collection('sensors').doc('WaterLvl').get().then((value) => waterLVL = value['value']);

  if (waterLVL<10){
    textMsg = "Please fill the water tank!";
  }else{
    textMsg = "All good\n:D";
  }

  counter.value++;
  return 0;
}