import 'dart:async';
import '../utils/utils.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class SignInProvider with ChangeNotifier {
  User? _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();

  UserModel? _userModel;
  GoogleSignIn _googleSignIn = GoogleSignIn();

//  getter
  UserModel? get userModel => _userModel;
  Status get status => _status;
  User? get user => _user;

  SignInProvider.init() {
    _fireSetUp();
  }

  _fireSetUp() async {
    //basic firbase instance initialization
    await initialization.then((value) {
      auth.authStateChanges().listen(_onStateChanged as dynamic);
    });
  }

  //
  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      //1.signs the user
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      //2. declares the authentication instance to a variable
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      //3. recieves the authentication credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //4. signs the user in with the aquired credentials
      await auth.signInWithCredential(credential).then((userCredentials) async {
        _user = userCredentials.user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("id", _user!.uid);
        if (!await _userServices.doesUserExist(_user!.uid)) {
          //5. checks if the user exists and creates a user collection in the database
          UserModel tempUser = UserModel(
              id: _user!.uid,
              name: _user!.displayName.toString(),
              email: _user!.email.toString(),
              photo: _user!.photoURL.toString());
          _userServices.createUser(tempUser);
          await initializeUserModel();
        } else {
          await initializeUserModel();
        }
      });
      return {'success': true, 'message': 'success'};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<bool> initializeUserModel() async {
    //initializes a user model by searching the database based on the id
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _userId = preferences.getString('id').toString();
    _userModel = await _userServices.getUserById(_userId);
    notifyListeners();
    if (_userModel == null) {
      return false;
    } else {
      return true;
    }
  }

  Future signOut() async {
    //signs the user out
    auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  _onStateChanged(User firebaseUser) {
    // ignore: unnecessary_null_comparison
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
      notifyListeners();
    } else {
      _user = firebaseUser;
      initializeUserModel();
      //Future.delayed(const Duration(seconds: 2), () {
      _status = Status.Authenticated;
      notifyListeners();
      //});
    }
  }
}
