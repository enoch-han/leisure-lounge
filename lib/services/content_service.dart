import 'dart:async';

import 'package:leisurelounge/services/rate_services.dart';

import '../models/models.dart';
import 'dart:io';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentService {
  String collection = "contents";
  //List<ContentModel> contents = [];

  Future<bool> createContent(ContentModel content) async {
    try {
      await firebaseFirestore.collection(collection).doc(content.id).set({
        "id": content.getId,
        "title": content.getTitle,
        "createdAt": content.getCreatedAt.toString(),
        "type": content.getType.parseToString(),
        "genre": content.getGenre.parseToString(),
        "contentUrl": content.getContentUrl,
        "imageUrl": content.getImageUrl,
        "description": content.getDescription,
        "releaseYear": content.getReleaseYear.toString(),
        "rateCount": content.getRateCount,
        "likeCount": content.getLikeCount,
        "commentCount": content.getCommentCount
      });
      return true;
    } on FirebaseException catch (e) {
      print(
          "error while creating content in content service class createcontent function");
      return false;
    }
  }

  Future<ContentModel> getContentById(String id) async =>
      //retruns content based on a give id
      await firebaseFirestore.collection(collection).doc(id).get().then((doc) {
        print("in the getcontentbyid function from clas content services");
        //contents.add(ContentModel.fromSnapshot(doc) as ContentModel);
        return ContentModel.fromSnapshot(doc);
      });

//returns boolean value depending on the existance of the content
  Future<bool> doesContentExist(String id) async => firebaseFirestore
      .collection(collection)
      .doc()
      .get()
      .then((value) => value.exists as bool);

//returns all the contents in the database
  // Future<List<ContentModel>> getContentAll() async {
  //   contents.clear();
  //   firebaseFirestore.collection(collection).get().then((value) {
  //     value.docs.forEach((doc) async {
  //       ContentModel tempContent = await getContentById(doc.id)
  //           .then((value) => contents.add(value) as ContentModel);
  //       print('in the get content all function');

  //       //contents.add(tempContent);
  //     });
  //   });

  //   print(" the lenght is : ${contents.length}");
  //   return contents.toList();

  //   contents.map((e) => print(e.title));
  //   //return contents.toList();
  // }

  Future<List<ContentModel>> getAllContents() async {
    List<ContentModel> contents = [];
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    // for (int i = 0; i < snapshot.docs.length; i++) {

    //   ContentModel tempContent = getContentById(snapshot.docs.asMap().id);
    // }
    contents.addAll(snapshot.docs.map((e) {
      return ContentModel.fromSnapshot(e);
    }));
    // contents = await firebaseFirestore
    //     .collection(collection)
    //     .get()
    //     .then((value) async {
    //   value.docs.forEach((doc) async {
    //     print(doc);
    //     //ContentModel tempContent = await getContentById(doc.id);
    //     //print(tempContent.title);
    //     ContentModel tempContent = ContentModel.fromSnapshot(doc);
    //     contents.add(await getContentById(doc.id));
    //     print(tempContent.title);
    //     print(contents.length);
    //   });
    //   //print(contents.length);
    //   return contents;
    // });

    // Timer(Duration(seconds: 5), () {
    //   print(contents.length);
    // });
    print(contents.length);
    return contents.toList();
  }

  // Future<List<ContentModel>> getAllContents() async {
  //   List<ContentModel> contents = [];
  //   var snapshots = await firebaseFirestore.collection(collection).get();
  //   contents.add(
  //     snapshots.forEach((doc) async {
  //     ContentModel tempContent = await getContentById(doc.id);
  //     print(tempContent.title);
  //     return tempContent;
  //   })
  //   );
  // }

  //Future<List<ContentModel>> getAllContents() async {}
}
