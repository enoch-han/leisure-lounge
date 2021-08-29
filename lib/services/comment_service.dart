import 'package:leisurelounge/services/content_service.dart';

import '../models/models.dart';
import 'dart:io';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentService {
  String collection = "comments";
  String contentCollection = "contents";
  ContentService service = ContentService();

  void createComment(ContentModel content, CommentModel comment) {
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .doc(comment.id)
        .set({
      "id": comment.id,
      "userId": comment.userId,
      "contentId": comment.contentId,
      "description": comment.description,
      "commentedAt": comment.commentedAt
    });
    addCommentCount(content);
  }

  Future<CommentModel> getCommentById(ContentModel content, String id) async =>
      await firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => CommentModel.fromSnapshot(value) as CommentModel);

  Future<bool> doesCommentExist(ContentModel content, String id) =>
      firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => value.exists as bool);

  Future<List<CommentModel>> getCommentAll(ContentModel content) async {
    List<CommentModel> comments = [];
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .get()
        .then((value) {
      value.docs.forEach((doc) async {
        CommentModel tempComment = await getCommentById(content, doc.id);
        comments.add(tempComment);
      });
    });
    return comments.toList();
  }

  Future<bool> addCommentCount(ContentModel content) async {
    ContentModel tempContent =
        service.getContentById(content.id) as ContentModel;
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .update({"commentCount": tempContent.commentCount++}).onError(
            (error, stackTrace) {
      print("error occured in comment service addcommentcount function");
      return false;
    });
    return true;
  }
}
