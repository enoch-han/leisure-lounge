import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/utils.dart';

class LikeModel {
  late String id = CustomUuid().generateTypeId("like");
  late String userId;
  late String contentId;
  DateTime likedAt = DateTime.now();

  static const String ID = "id";
  static const String USERID = "userId";
  static const String CONTENTID = "contentId";
  static const String LIKEDAT = "likedAt";

  LikeModel({required this.userId, required this.contentId});

  LikeModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (data != null) {
      id = data[ID];
      userId = data[USERID];
      contentId = data[CONTENTID];
      likedAt = data[LIKEDAT];
    } else {
      print("data is null from likemodel class");
    }
  }
}
