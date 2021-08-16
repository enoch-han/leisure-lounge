import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../assets.dart';

final Content somename = Content(
    id: "hello",
    title: "avengers",
    createdAt: DateTime.now(),
    type: ContentType.movie,
    url: "someurl",
    imageUrl: "someimage",
    description: "blablabla");

final Content featuredcontent = Content.newContent(
    title: "sintel",
    type: ContentType.movie,
    url: Assets.sintelTitle,
    imageUrl: Assets.sintel,
    description: "something something");

final List<Content> trending = [
  Content.newContent(
      title: "The last airbender",
      type: ContentType.movie,
      url: Assets.atlaTitle,
      imageUrl: Assets.atla,
      description: "wezete wezete",
      color: Colors.orange),
  Content.newContent(
      title: "the umbrella academy",
      type: ContentType.movie,
      url: Assets.umbrellaAcademyTitle,
      imageUrl: Assets.umbrellaAcademy,
      description: "umbrella umbrella",
      color: Colors.yellow),
  Content.newContent(
      title: "carole and tuesday",
      type: ContentType.movie,
      url: Assets.caroleAndTuesdayTitle,
      imageUrl: Assets.caroleAndTuesday,
      description: "tuesday with caroll",
      color: Colors.lightBlueAccent),
  Content.newContent(
      title: "Black mirror",
      type: ContentType.movie,
      url: Assets.blackMirrorTitle,
      imageUrl: Assets.blackMirror,
      description: "all the descriptions about black mirror")
];
