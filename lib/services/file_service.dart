import '../models/models.dart';
import '../utils/utils.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FileService {
  String collection = "files";
  String contentCollection = "contents";
  String contentsDir = "contents";

  void createFile(ContentModel content, FileModel file) {
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .doc(file.id)
        .set({
      "id": file.id,
      "imageName": file.imageName,
      "imageUrl": file.imageUrl,
      "contentName": file.contentName,
      "contentUrl": file.contentUrl
    });
  }

  Future<FileModel> getFileById(ContentModel content, String id) async =>
      await firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => FileModel.fromSnapshot(value) as FileModel);

  Future<bool> doesFileExist(ContentModel content, String id) =>
      firebaseFirestore
          .collection(contentCollection)
          .doc(content.id)
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => value.exists as bool);

  Future<List<FileModel>> getFileAll(ContentModel content) async {
    List<FileModel> files = [];
    firebaseFirestore
        .collection(contentCollection)
        .doc(content.id)
        .collection(collection)
        .get()
        .then((value) {
      value.docs.forEach((doc) async {
        FileModel tempFile = await getFileById(content, doc.id);
        files.add(tempFile);
      });
    });
    return files.toList();
  }

  Future<bool> storeFile(ContentModel content, FileModel file) async {
    try {
      await firebaseStorage
          .ref(contentsDir)
          .child(content.id)
          .child(file.imageName)
          .putFile(File(file.imageUrl));
      await firebaseStorage
          .ref(contentsDir)
          .child(content.id)
          .child(file.contentName)
          .putFile(File(file.contentUrl));

      return true;
    } on FirebaseException catch (e) {
      print(
          "storing halted due to firbaseexception in file service class storefile fucntion");
      print(e.stackTrace);
      return false;
    }
  }
}
