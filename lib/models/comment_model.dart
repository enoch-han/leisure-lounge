import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class CommentModel {
  late String id = CustomUuid().generateTypeId("comment");
  late String userId;
  late String contentId;
  late String description;
  DateTime commentedAt = DateTime.now();

  static const String ID = "id";
  static const String USERID = "userId";
  static const String CONTENTID = "contentId";
  static const String DESCRIPTION = "description";
  static const String COMMENTEDAT = 'commentedAt';

  CommentModel(
      {required this.userId,
      required this.contentId,
      required this.description});

  CommentModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (data != null) {
      id = data[ID];
      userId = data[USERID];
      contentId = data[CONTENTID];
      description = data[DESCRIPTION];
      commentedAt = data[COMMENTEDAT];
    } else {
      print("data is null from commentmodel class");
    }
  }
}
