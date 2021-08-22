import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../bloc/bloc.dart';
import '../screens/screens.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInProvider signInProvider = Provider.of<SignInProvider>(context);
    return Container(
      width: 700,
      height: 400,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.75),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.red.shade900)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          Center(
            child: Text(
              'Welcome to the sign in page',
              style: TextStyle(
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.w300,
                  fontSize: 30),
            ),
          ),
          Spacer(),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                side: BorderSide(color: Colors.red.shade900),
                minimumSize: Size(100, 50),
                backgroundColor: Colors.black.withOpacity(0.8),
              ),
              onPressed: () async {
                //appProvider.changeLoading();
                Map result = await signInProvider.signInWithGoogle();
                bool success = result['success'];
                String message = result['message'];
                print(message);

                if (!success) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(message)));
                  //appProvider.changeLoading();
                } else {
                  //appProvider.changeLoading();
                  NavigationScreen();
                }
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red.shade900,
              ),
              label: Text("Sign in with google")),
          Spacer(),
          Text(
            'Sign in to continue',
            style: TextStyle(color: Colors.red.shade800),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
