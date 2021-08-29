import 'package:leisurelounge/services/content_service.dart';

import '../models/models.dart';
import 'dart:io';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RateService {
  String collection = "rates";
  String contentCollection = "contents";
  ContentService service = ContentService();

  void createRate(ContentModel content, RateModel rate) {
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
    addRate(content, rate.value);
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

  Future<bool> addRate(ContentModel content, int rate) async {
    ContentModel tempContent =
        service.getContentById(content.id) as ContentModel;
    RateService rateService = RateService();
    List<RateModel> rates = rateService.getRateAll(content) as List<RateModel>;
    int howManyRates = rates.length;
    int ratesSummation = 0;
    rates.map((rateobj) {
      ratesSummation = ratesSummation + rateobj.value;
    });
    ratesSummation = ratesSummation + rate;
    howManyRates++;
    double finalRateCount = ratesSummation / howManyRates;
    firebaseFirestore.collection(contentCollection).doc(content.id).update(
        {"rateCount": finalRateCount.toInt()}).onError((error, stackTrace) {
      print("error occured in content service addrate function");
      return false;
    });
    return true;
  }
}
