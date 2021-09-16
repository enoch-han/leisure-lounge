import '../models/models.dart';
import '../utils/utils.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListService {
  String collection = "lists";
  String contentCollection = "contents";

  void createList(ContentModel content, ListModel list) {
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .doc(list.contentId)
        .set({
      "id": list.id,
      "userId": list.userId,
      "contentId": list.contentId,
      "listedAt": list.listedAt
    });
  }

  Future<ListModel> getListById(ContentModel content, String id) async =>
      await firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => ListModel.fromSnapshot(value) as ListModel);

  Future<bool> doesListExist(ContentModel content, String id) =>
      firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => value.exists as bool);

  Future<List<ListModel>> getAllLists(ContentModel content) async {
    List<ListModel> lists = [];
    QuerySnapshot snapshot = await firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .get();
    lists.addAll(snapshot.docs.map((doc) {
      return ListModel.fromSnapshot(doc);
    }));
    print(lists.length);
    return lists.toList();
  }
}
