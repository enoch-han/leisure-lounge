import 'dart:html';
import 'dart:async';
import '../utils/utils.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentProvider with ChangeNotifier {
  ContentModel? _content;
  ContentService _contentService = ContentService();

  ContentProvider.init() {}

  _contentProviderSetUP() async {
    firebaseFirestore.collection("contents").snapshots().listen((event) {});
  }
}
