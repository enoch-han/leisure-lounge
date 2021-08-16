import 'package:flutter/material.dart';
import 'package:leisurelounge/widgets/widgets.dart';
import '../models/models.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
            height: 500,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            )),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.url),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add,
                  title: "List",
                  onTap: () => print("list icon tapped")),
              _playButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "info",
                  onTap: () => print("info button tapped"))
            ],
          ),
        )
      ],
    );
  }
}

//this is the icon button play which is inserted in the middele between list and info buttons
class _playButton extends StatelessWidget {
  const _playButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      child: TextButton.icon(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () => print("play button clicked"),
          icon: Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
          label: Text(
            "Play",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          )),
    );
  }
}
