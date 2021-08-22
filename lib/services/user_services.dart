import '../utils/utils.dart';
import '../models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  String collection = "users";

  void createUser({
    //creates a user data in the firstore database
    String? id,
    String? name,
    String? photo,
  }) {
    firebaseFirestore.collection(collection).doc(id).set({
      "name": name,
      "id": id,
      "photo": photo,
    });
  }

  Future<UserModel> getUserById(String id) =>
      //returns a usermodel by searching the database based on the given id
      firebaseFirestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<bool> doesUserExist(String id) async => firebaseFirestore
      //checks if the user exists or not
      .collection(collection)
      .doc(id)
      .get()
      .then((value) => value.exists);
}
