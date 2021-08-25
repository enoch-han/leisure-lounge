import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../assets.dart';

final ContentModel somename = ContentModel(
  title: "avengers",
  type: ContentType.movie,
  genre: Genre.action,
  contentUrl: "someurl",
  imageUrl: "someimage",
  description: "blablabla",
  releaseYear: DateTime.now(),
);

final ContentModel featuredcontent = ContentModel(
    title: "sintel",
    type: ContentType.movie,
    contentUrl: Assets.sintelTitle,
    genre: Genre.comedy,
    imageUrl: Assets.sintel,
    description: "something something",
    releaseYear: DateTime.now());

final List<ContentModel> trending = [
  ContentModel(
      title: "The last airbender",
      type: ContentType.movie,
      genre: Genre.drama,
      contentUrl: Assets.atlaTitle,
      imageUrl: Assets.atla,
      description: "wezete wezete",
      releaseYear: DateTime.now()),
  ContentModel(
      title: "the umbrella academy",
      type: ContentType.movie,
      genre: Genre.fantasy,
      contentUrl: Assets.umbrellaAcademyTitle,
      imageUrl: Assets.umbrellaAcademy,
      description: "umbrella umbrella",
      releaseYear: DateTime.now()),
  ContentModel(
      title: "carole and tuesday",
      type: ContentType.movie,
      genre: Genre.horror,
      contentUrl: Assets.caroleAndTuesdayTitle,
      imageUrl: Assets.caroleAndTuesday,
      description: "tuesday with caroll",
      releaseYear: DateTime.now()),
  ContentModel(
      title: "Black mirror",
      type: ContentType.movie,
      genre: Genre.romance,
      contentUrl: Assets.blackMirrorTitle,
      imageUrl: Assets.blackMirror,
      description: "all the descriptions about black mirror",
      releaseYear: DateTime.now())
];
