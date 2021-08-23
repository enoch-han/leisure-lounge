import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/uuid.dart';
import 'package:flutter/material.dart';

class Content {
  /* this class is the model of how a content should look */
  late String id;
  late String title;
  late DateTime createdAt;
  late ContentType type;
  late String url;
  late String imageUrl;
  late String description;
  late Color color;

//getters and setters

  String get getId => this.id;

  set setId(String id) => this.id = id;

  String get getTitle => this.title;

  set setTitle(String title) => this.title = title;

  DateTime get getCreatedAt => this.createdAt;

  set setCreatedAt(DateTime createdAt) => this.createdAt = createdAt;

  ContentType get getType => this.type;

  set setType(ContentType type) => this.type = type;

  String get getUrl => this.url;

  set setUrl(String url) => this.url = url;

  String get getImageUrl => this.imageUrl;

  set setImageUrl(String imageUrl) => this.imageUrl = imageUrl;

  String get getDescription => this.description;

  set setDescription(String description) => this.description = description;

  Color get getColor => this.color;

  set setColor(Color color) => this.color = color;
  //getter and setter end**************

  Content(
      // a constructor to build readymade contents
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.type,
      required this.url,
      required this.imageUrl,
      required this.description,
      this.color = Colors.black});

  Content.newContent(
      //a constructor for new content values
      {required this.title,
      required this.type,
      required this.url,
      required this.imageUrl,
      required this.description,
      this.color = Colors.black}) {
    Uuid uuid = Uuid();
    this.id = uuid.generateContentId();
    this.createdAt = DateTime.now();
  }

  Content.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = data['id'];
    title = data['title'];
    createdAt = DateTime.parse(data['createdAt']);
    type = data['type'];
    url = data['url'];
    imageUrl = data['imageUrl'];
    description = data['description'];
    color = parseColor(data['color']);
  }

  Color parseColor(String color) {
    //a function that changes valid color string to color object
    Color newColor =
        new Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16));
    return newColor;
  }
}

enum ContentType { movie, music }
