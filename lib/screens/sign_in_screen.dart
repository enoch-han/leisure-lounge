import 'package:flutter/material.dart';
import 'package:leisurelounge/widgets/sign_in_widget.dart';
import '../assets.dart';
import '../bloc/bloc.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.signInImage), fit: BoxFit.cover)),
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Leisure Lounge",
                      style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                  ),
                ),
                Center(
                  child: SignInWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
