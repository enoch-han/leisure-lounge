import 'package:leisurelounge/services/content_service.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeServices {
  String collection = "likes";
  String contentCollection = "contents";
  ContentService service = ContentService();

  void createLike(ContentModel content, LikeModel like) {
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .doc(like.id)
        .set({
      "id": like.id,
      "userId": like.userId,
      "contentId": like.contentId,
      "likedAt": like.likedAt
    });
    addLikeCount(content);
  }

  Future<LikeModel> getLikeById(ContentModel content, String id) async =>
      await firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) {
        return LikeModel.fromSnapshot(value);
      });

  Future<bool> doesLikeExist(ContentModel content, String id) async =>
      firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => value.exists as bool);

  Future<List<LikeModel>> getLikeAll(ContentModel content) async {
    List<LikeModel> likes = [];
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .get()
        .then((value) {
      value.docs.forEach((doc) async {
        LikeModel tempLike = await getLikeById(content, doc.id);
        likes.add(tempLike);
      });
    });
    return likes.toList();
  }

  Future<bool> addLikeCount(ContentModel content) async {
    //this function adds the the like count by 1
    ContentModel tempContent =
        service.getContentById(content.id) as ContentModel;
    firebaseFirestore.collection(contentCollection).doc(content.id).update(
        {"likeCount": tempContent.likeCount++}).onError((error, stackTrace) {
      print("error occured in like service addlikecount function");
      return false;
    });
    return true;
  }
}
