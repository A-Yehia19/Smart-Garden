import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String name = "daisy";
int moistLimit = 30;

TextEditingController NameController = TextEditingController();
TextEditingController MoistController = TextEditingController();

Future<int> getControls() async {
  var db = FirebaseFirestore.instance;
  await db.collection('controls').doc('Name').get().then((value) => name = value['value']);
  await db.collection('controls').doc('MoistLimit').get().then((value) => moistLimit = value['value']);

  return 0;
}

confirm(){
  String nametext = name;
  int moisttext = moistLimit;
  if(NameController.value.text != ""){
    nametext = NameController.value.text;
  }
  if(MoistController.value.text != ""){
    moisttext = int.parse(MoistController.value.text);
  }

  print(NameController.value.text);
  print(MoistController.value.text);
  var db = FirebaseFirestore.instance;
  db.collection('controls').doc('Name').set({"value": nametext});
  db.collection('controls').doc('MoistLimit').set({"value": moisttext});
}