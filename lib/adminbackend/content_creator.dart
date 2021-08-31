import 'dart:io';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ContentCreator {
  late ContentModel content;
  late FileModel file;
  bool status = false;

  ContentCreator({required this.content, required this.file});

  Future<bool> createContentWithFile() async {
    ContentService contentService = ContentService();
    FileService fileService = FileService();
    status = await fileService.storeFile(content, file);
    String imageRef = "contents/" + content.id + "/" + file.imageName;
    String imageDownloadUrl =
        await firebaseStorage.ref(imageRef).getDownloadURL();
    content.setImageUrl = imageDownloadUrl;
    String contentRef = "contents/" + content.id + "/" + file.contentName;
    String contentDownloadUrl =
        await firebaseStorage.ref(contentRef).getDownloadURL();
    content.setUrl = contentDownloadUrl;
    await contentService.createContent(content);
    fileService.createFile(content, file);

    return status;
  }
}
