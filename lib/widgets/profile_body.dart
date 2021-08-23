import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ProfileBody extends StatelessWidget {
  final String title = "Liked contents";
  final List<Content> items;
  const ProfileBody({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 400.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            Content item = items[index];
            return GestureDetector(
              onTap: () {
                print(
                    'the item called ${item.title} is tapped from the mylist widget');
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    height: 400.0,
                    width: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 3))
                        ],
                        image: DecorationImage(
                            image: AssetImage(item.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    height: 400.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
                  ),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 10.0,
                    child: Container(
                      width: 200.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          VerticalIconButton(
                              icon: Icons.play_arrow,
                              title: "Play",
                              onTap: () =>
                                  print("play button from mylist was tapped")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
