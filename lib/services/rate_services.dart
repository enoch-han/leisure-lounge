import '../models/models.dart';
import 'dart:io';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RateService {
  String collection = "rates";
  String contentCollection = "contents";

  void createComment(ContentModel content, RateModel rate) {
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .doc(rate.id)
        .set({
      "id": rate.id,
      "contentId": rate.contentId,
      "userId": rate.userId,
      "value": rate.value,
      "ratedAt": rate.ratedAt
    });
  }

  Future<RateModel> getRateById(ContentModel content, String id) async =>
      firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => RateModel.fromSnapshot(value) as RateModel);

  Future<bool> doesRateExist(ContentModel content, String id) async =>
      firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => value.exists as bool);

  Future<List<RateModel>> getRateAll(ContentModel content) async {
    List<RateModel> rates = [];
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .get()
        .then((value) {
      value.docs.forEach((doc) async {
        RateModel tempRate = await getRateById(content, doc.id);
        rates.add(tempRate);
      });
    });
    return rates.toList();
  }
}
