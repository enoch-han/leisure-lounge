import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';

class RateModel {
  late String id = CustomUuid().generateTypeId("rate");
  late String userId;
  late String contentId;
  DateTime ratedAt = DateTime.now();
  int value = 1;

  static const String ID = "id";
  static const String USERID = "userId";
  static const String CONTENTID = "contentId";
  static const String RATEDAT = "ratedAt";
  static const String VALUE = "value";

  RateModel({required this.userId, required this.contentId, required value});

  RateModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (data != null) {
      id = data[ID];
      userId = data[USERID];
      contentId = data[CONTENTID];
      ratedAt = data[RATEDAT];
      value = data[VALUE];
    } else {
      print("data is null from ratemodel class");
    }
  }
}
