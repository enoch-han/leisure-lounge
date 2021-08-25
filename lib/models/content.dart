import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/custom_uuid.dart';
import 'package:flutter/material.dart';

class ContentModel {
  /* this class is the model of how a content should look */

  late String title;
  late String id = CustomUuid().generateTypeId("content");
  late DateTime createdAt = DateTime.now();
  late ContentType type;
  late Genre genre;
  late String contentUrl;
  late String imageUrl;
  late String description;
  late DateTime releaseYear;
  late int rateCount = 1;
  late int likeCount = 0;
  late int commentCount = 0;

//getters and setters

//setters
  set setId(String id) => this.id = id;
  set setReleaseYear(releaseYear) => this.releaseYear = releaseYear;
  set setRateCount(rateCount) => this.rateCount = rateCount;
  set setLikeCount(likeCount) => this.likeCount = likeCount;
  set setCommentCount(commentCount) => this.commentCount = commentCount;
  set setGenre(genre) => this.genre = genre;
  set setTitle(String title) => this.title = title;
  set setCreatedAt(DateTime createdAt) => this.createdAt = createdAt;
  set setType(ContentType type) => this.type = type;
  set setUrl(String url) => this.contentUrl = url;
  set setImageUrl(String imageUrl) => this.imageUrl = imageUrl;
  set setDescription(String description) => this.description = description;

//getters
  DateTime get getReleaseYear => this.releaseYear;
  int get getRateCount => this.rateCount;
  int get getLikeCount => this.likeCount;
  int get getCommentCount => this.commentCount;
  Genre get getGenre => this.genre;
  String get getId => this.id;
  String get getTitle => this.title;
  DateTime get getCreatedAt => this.createdAt;
  ContentType get getType => this.type;
  String get getUrl => this.contentUrl;
  String get getImageUrl => this.imageUrl;
  String get getDescription => this.description;

  //getter and setter end**************

  ContentModel(
      // a constructor to build readymade contents
      {required this.title,
      required this.type,
      required this.genre,
      required this.contentUrl,
      required this.imageUrl,
      required this.description,
      required this.releaseYear});

  ContentModel.fromSnapshot(DocumentSnapshot snapshot) {
    // a constructor which populates the fields parsing from snaphot
    Map<String, dynamic> data = snapshot.data();
    id = data['id'];
    title = data['title'];
    createdAt = DateTime.parse(data['createdAt']);
    type = ContentType.unknown.parseToType(data['type']);
    genre = Genre.unknown.parseToGenre(data['genre']);
    contentUrl = data['contentUrl'];
    imageUrl = data['imageUrl'];
    description = data['description'];
    releaseYear = data['releaseYear'];
    rateCount = data['rareCount'];
    likeCount = data['likeCount'];
    commentCount = data['commentCount'];
  }
}

enum ContentType { movie, music, unknown }

extension parseBothWaysToType on ContentType {
  //this is an extension for the enum which adds functions which turns the
  //enum back to string and the string to enum
  String parseToString() {
    return this.toString().split('.').last;
  }

  ContentType parseToType(String value) {
    switch (value) {
      case 'movie':
        return ContentType.movie;
        // ignore: dead_code
        break;
      case 'music':
        return ContentType.music;
        // ignore: dead_code
        break;
      default:
        print("error on parsetotype therefore default is unknown");
        return ContentType.unknown;
        // ignore: dead_code
        break;
    }
  }
}

enum Genre {
  action,
  comedy,
  fantasy,
  horror,
  mystery,
  drama,
  romance,
  thriller,
  romanticComedy,
  actionComedy,
  unknown
}

extension parseBothWaysToGenre on Genre {
  //this is an extension for the enum which adds functions which turns the
  //enum back to string and the string to enum
  String parseToString() {
    return this.toString().split('.').last;
  }

  Genre parseToGenre(String value) {
    switch (value) {
      case 'action':
        return Genre.action;
        // ignore: dead_code
        break;
      case 'comedy':
        return Genre.comedy;
        // ignore: dead_code
        break;
      case 'fantasy':
        return Genre.fantasy;
        // ignore: dead_code
        break;
      case 'horror':
        return Genre.horror;
        // ignore: dead_code
        break;
      case 'mystery':
        return Genre.mystery;
        // ignore: dead_code
        break;
      case 'drama':
        return Genre.drama;
        // ignore: dead_code
        break;
      case 'romance':
        return Genre.romance;
        // ignore: dead_code
        break;
      case 'thriller':
        return Genre.thriller;
        // ignore: dead_code
        break;
      case 'romanticComedy':
        return Genre.romanticComedy;
        // ignore: dead_code
        break;
      case 'actionComedy':
        return Genre.actionComedy;
        // ignore: dead_code
        break;
      default:
        print("error on parsetogenre therefore default is unknown");
        return Genre.unknown;
        // ignore: dead_code
        break;
    }
  }
}
