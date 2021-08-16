import 'package:flutter/material.dart';
import '../models/models.dart';

class Trending extends StatelessWidget {
  final String title;
  final List<Content> items;
  const Trending({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Trending",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              itemBuilder: (BuildContext context, int index) {
                final Content content = items[index];
                return GestureDetector(
                  onTap: () => print(
                      'the content ${content.title} has been clicked from trending list'),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 130.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(content.imageUrl),
                                fit: BoxFit.cover),
                            border:
                                Border.all(color: content.color, width: 4.0),
                            shape: BoxShape.circle),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 130.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.transparent
                              ],
                                  stops: [
                                0,
                                0.25,
                                1
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter))),
                      Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 60.0,
                            child: Image.asset(content.url),
                          ))
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
