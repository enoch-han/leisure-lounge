import 'dart:html';
import 'dart:async';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './sign_in_bloc.dart';
import 'package:flutter/material.dart';

class ContentProvider with ChangeNotifier {
  ContentProvider() {
    initialize();
  }
  ContentModel? _content;
  ContentService _contentService = ContentService();
  LikeServices _likeServices = LikeServices();
  CommentService _commentService = CommentService();
  RateService _rateService = RateService();
  ListService _listService = ListService();
  Stream contentFireStream =
      firebaseFirestore.collection('contents').snapshots();
  //StreamController contentsStream = StreamController();
  late SignInProvider signInProvider;

  bool lockStatus = false;

  initialize() {
    print("in content_bloc class init function");
    //signInProvider = Provider.of<SignInProvider>(context, listen: false);
    //this.user = signInProvider.userModel as UserModel;
    _contentProviderSetUP();
  }

  _contentProviderSetUP() async {
    print("in content bloc content provider setup funtion");
    /*contentsStream.sink.add(await _contentService.getContentAll());
    firebaseFirestore.collection("contents").snapshots().listen((event) {
      updateStream();
      notifyListeners();
    });*/
  }

  updateStream() {
    //contentsStream.stream.drain();
    //contentsStream.sink.add(_contentService.getContentAll());
    //notifyListeners();
  }

  lockContent(ContentModel content) {
    //this function must be called first when the contentsdetail page opens
    unlockContent();
    this.lockStatus = true;
    this._content = content;
    notifyListeners();
  }

  unlockContent() {
    this.lockStatus = false;
    this._content = null;
    notifyListeners();
  }

  like(UserModel user) {
    if (this.lockStatus) {
      LikeModel like =
          LikeModel(userId: user.id, contentId: this._content?.id as String);
      _likeServices.createLike(this._content as ContentModel, like);
      notifyListeners();
    } else {
      print("content is not locked from content bloc like function");
    }
  }

  comment(String description, UserModel user) {
    if (this.lockStatus) {
      CommentModel comment = CommentModel(
          userId: user.id,
          contentId: this._content?.id as String,
          description: description);
      _commentService.createComment(this._content as ContentModel, comment);
      notifyListeners();
    }
  }

  rate(int value, UserModel user) {
    if (this.lockStatus) {
      RateModel rate = RateModel(
          userId: user.id,
          contentId: this._content?.id as String,
          value: value);
      _rateService.createRate(this._content as ContentModel, rate);
      notifyListeners();
    }
  }

  list(UserModel user) {
    if (this.lockStatus) {
      ListModel list =
          ListModel(userId: user.id, contentId: this._content?.id as String);
      _listService.createList(this._content as ContentModel, list);
    }
  }

  addList(ContentModel content, UserModel user) {
    ListModel list = ListModel(userId: user.id, contentId: content.id);
    _listService.createList(content, list);
  }

  /*ContentModel featuredContent() {
    //this is a funtion that returns featured content
    return
  }*/
}
