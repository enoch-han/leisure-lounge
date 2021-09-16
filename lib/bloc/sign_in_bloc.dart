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
  // content related declarations
  ContentService _contentServices = ContentService();
  CommentService _commentService = CommentService();
  LikeServices _likeServices = LikeServices();
  RateService _rateService = RateService();
  ListService _listService = ListService();
  List<ContentModel>? contents;

  UserModel? _userModel;
  GoogleSignIn _googleSignIn = GoogleSignIn();

//  getter
  UserModel? get userModel => _userModel;
  Status get status => _status;
  User? get user => _user;

  SignInProvider.init() {
    print("in sign in bloc init function");
    _fireSetUp();
    _initializeContents();
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

  /*
  form this place the content funtionalities are implemeted
   */

  void _initializeContents() async {
    //this fucntion feches all the available contents in the database
    print("in initializecontents function in the sign in provider class");
    contents = await _contentServices.getAllContents();
    if (contents != null) {
      contents!.forEach((element) {
        print(element.title);
        print(element.description);
      });
    }
  }

  void tempdataadder() {
    print("in tempdata adder in sign in provider class");
    ContentModel avenger = ContentModel(
        title: "avengers",
        type: ContentType.movie,
        genre: Genre.action,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel dontbreathe = ContentModel(
        title: "dont breathe",
        type: ContentType.movie,
        genre: Genre.thriller,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel freeguy = ContentModel(
        title: "free guy",
        type: ContentType.movie,
        genre: Genre.comedy,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel hitmansbodyguard = ContentModel(
        title: "hitmans body guard",
        type: ContentType.movie,
        genre: Genre.actionComedy,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel spyderman = ContentModel(
        title: "spyder man",
        type: ContentType.movie,
        genre: Genre.action,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel conjuring = ContentModel(
        title: "the conjuring",
        type: ContentType.movie,
        genre: Genre.horror,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel thetomorrowwar = ContentModel(
        title: "the tomorrow war",
        type: ContentType.movie,
        genre: Genre.action,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel tenet = ContentModel(
        title: "tenet",
        type: ContentType.movie,
        genre: Genre.action,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel piratesofthecaribbean = ContentModel(
        title: "pirates of the caribbean",
        type: ContentType.movie,
        genre: Genre.fantasy,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    ContentModel holidate = ContentModel(
        title: "holidate",
        type: ContentType.movie,
        genre: Genre.romance,
        description: "",
        releaseYear: DateTime.now(),
        imageUrl: "",
        contentUrl: "");
    // now the creation of these models in database
    _contentServices.createContent(avenger);
    _contentServices.createContent(dontbreathe);
    _contentServices.createContent(freeguy);
    _contentServices.createContent(hitmansbodyguard);
    _contentServices.createContent(spyderman);
    _contentServices.createContent(conjuring);
    _contentServices.createContent(thetomorrowwar);
    _contentServices.createContent(tenet);
    _contentServices.createContent(piratesofthecaribbean);
    _contentServices.createContent(holidate);
  }
}
