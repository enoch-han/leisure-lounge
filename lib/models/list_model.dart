import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leisurelounge/models/like_model.dart';
import '../utils/utils.dart';

class ListModel {
  late String id = CustomUuid().generateTypeId("list");
  late String userId;
  late String contentId;
  DateTime listedAt = DateTime.now();

  static const String ID = "id";
  static const String USERID = "userId";
  static const String CONTENTID = "contentId";
  static const String LISTEDAT = "listedAt";

  ListModel({required this.userId, required this.contentId});

  ListModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (data != null) {
      id = data[ID];
      userId = data[USERID];
      contentId = data[CONTENTID];
      listedAt = data[LISTEDAT];
    } else {
      print("data is null form listmodel class formsnaphot constructor");
    }
  }
}
