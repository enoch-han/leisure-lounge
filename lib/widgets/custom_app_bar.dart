import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
          child: Row(
        children: [
          Icon(
            Icons.headphones,
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    title: "movies",
                    onTap: () => print("movies text button tapped")),
                _AppBarButton(
                    title: "music",
                    onTap: () => print("music text button tapped"))
              ],
            ),
          )
        ],
      )),
    );
  }
}

// this class is created to shorten code so it can be used in the custom app bar class
class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppBarButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as VoidCallback,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}
