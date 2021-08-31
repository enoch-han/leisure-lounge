import 'dart:io';

import '../utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FileModel {
  late String id = CustomUuid().generateTypeId("files");
  late String imageName;
  late String imageUrl;
  late String contentName;
  late String contentUrl;

  static const String ID = "id";
  static const String IMAGENAME = "imageName";
  static const String IMAGEURL = "imageUrl";
  static const String CONTENTNAME = "contentName";
  static const String CONTENTURL = "contentUrl";

  FileModel(File imageFile, File contentFile) {
    this.imageUrl = imageFile.path;
    this.contentUrl = contentFile.path;
    this.imageName = imageFile.path.split('/').last;
    this.contentName = contentFile.path.split('/').last;
  }

  FileModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (data != null) {
      id = data[ID];
      imageName = data[IMAGENAME];
      imageUrl = data[IMAGEURL];
      contentName = data[CONTENTNAME];
      contentUrl = data[CONTENTURL];
    } else {
      print("data is null form filemodel class fromsnapshot constructor");
    }
  }
}
