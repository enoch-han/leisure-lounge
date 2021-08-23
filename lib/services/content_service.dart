import '../models/models.dart';
import 'dart:io';
import '../models/models.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentService {
  String collection = "contents";

  void createContent({
    //creates a content in the firstore database
    String? id,
    String? title,
    DateTime? createdAt,
    ContentType? type,
    String? url,
    String? imageUrl,
    String? descripton,
    Color? color,
  }) {
    firebaseFirestore.collection(collection).doc(id).set({
      "id": id,
      "title": title,
      "createdAt": createdAt.toString(),
      "type": type.toString(),
      "url": url,
      "imageUrl": imageUrl,
      "description": descripton,
      "color": color?.value.toString()
    });
  }

  Future<Content> getContentById(String id) =>
      //retruns content based on a give id
      firebaseFirestore.collection(collection).doc(id).get().then((value) {
        return Content.fromSnapshot(value);
      });

//returns boolean value depending on the existance of the content
  Future<bool> doesContentExist(String id) async => firebaseFirestore
      .collection(collection)
      .doc()
      .get()
      .then((value) => value.exists);

//returns all the contents in the database
  Future<List<Content>> getContentAll() async {
    List<Content> contents = [];
    firebaseFirestore.collection(collection).get().then((value) {
      value.docs.forEach((doc) {
        Content tempContent = getContentById(doc.id) as Content;
        contents.add(tempContent);
      });
    });
    return contents.toList();
  }
}
