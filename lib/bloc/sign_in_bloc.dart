import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInBloc extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool isSigningIn;

  bool get getIsSigningIn => this.isSigningIn;

  set setIsSigningIn(bool isSigningIn) {
    this.isSigningIn = isSigningIn;
    notifyListeners();
  }

  SignInBloc([this.isSigningIn = false]);

  Future login() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    // ignore: unnecessary_null_comparison
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = user.authentication;
      //final credential =
      //GoogleAuthProvider.getCredential(accessToken: googleAuth.);
    }
  }
}
