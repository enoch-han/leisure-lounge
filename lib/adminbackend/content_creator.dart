import 'dart:html';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ContentCreator {
  late ContentModel content;
  late File imageFile;
  late File contentFile;
  bool status = false;

  ContentCreator({required this.content});

  Future<bool> createContentWithFile() async {
    print("in create content with file");
    ContentService contentService = ContentService();
    print("second print");
    await contentService.createContent(content);
    FileService fileService = FileService(
        content: this.content,
        imageFile: this.imageFile,
        contentFile: this.contentFile);
    fileService.uploadFile();
    print("third print");

    return status;
  }
}
