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

  Future<List<ListModel>> getListAll(ContentModel content) async {
    List<ListModel> lists = [];
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .get()
        .then((value) {
      value.docs.forEach((doc) async {
        ListModel tempList = await getListById(content, doc.id);
        lists.add(tempList);
      });
    });
    return lists.toList();
  }
}
