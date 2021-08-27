import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const String? ID = "id";
  static const String? NAME = "name";
  static const String? PHOTO = "photo";
  static const String? Email = "email";
  static const String? ISBANNED = "isBanned";

  late String id;
  late String name;
  late String photo;
  late String email;
  bool isbanned = false;

//  getters
  String get getName => name;
  String get getPhoto => photo;
  String get getId => id;
  String get getEmail => this.email;
  bool get getIsbanned => this.isbanned;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.photo});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (data == null) {
      print("the user is nulllllllll");
    }
    name = data[NAME];
    photo = data[PHOTO];
    id = data[ID];
    email = data[Email];
    isbanned = data[ISBANNED];
  }
}
