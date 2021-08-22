import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const String? ID = "id";
  static const String? NAME = "name";
  static const String? PHOTO = "email";

  late String _id;
  late String _name;
  late String _photo;

//  getters
  String get name => _name;
  String get photo => _photo;
  String get id => _id;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    _name = data[NAME];
    _photo = data[PHOTO];
    _id = data[ID];
  }
}
