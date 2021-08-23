import 'package:flutter/material.dart';
import '../assets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 26, 26, 26),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ],
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.crown,
                      ),
                      fit: BoxFit.cover)),
            ),
            Text(
              "Name",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "email",
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
