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
}

enum ContentType { movie, music }
