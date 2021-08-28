import '../utils/utils.dart';
import '../models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  String collection = "users";

  void createUser(UserModel user) {
    //creates a user data in the firstore database
    firebaseFirestore.collection(collection).doc(user.id).set({
      "name": user.getName,
      "id": user.getId,
      "email": user.getEmail,
      "photo": user.getPhoto,
      "isBanned": user.getIsbanned
    });
  }

  Future<UserModel> getUserById(String id) async =>
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
