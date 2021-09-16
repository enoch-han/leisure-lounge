import '../models/models.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../data/data.dart';
import '../bloc/bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Profile Page",
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
                onPressed: logoutButtonHandler,
                icon: Icon(
                  Icons.logout_outlined,
                  size: 30,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: ProfileHeader(),
          ),
          ProfileBody(items: trending)
        ],
      ),
    );
  }

  void logoutButtonHandler() {}
}
