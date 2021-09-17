import 'package:flutter/material.dart';
import 'package:leisurelounge/services/player.dart';
import '../models/models.dart';

class ContentPageHeader extends StatelessWidget {
  final ContentModel content;
  const ContentPageHeader({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(content.imageUrl).image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Stack(
        children: [
          Positioned(
            child: Text(
              content.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            left: 20,
            bottom: 20,
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Player(content: content)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
            ),
            right: 10,
            bottom: 10,
          )
        ],
      ),
    );
  }
}
