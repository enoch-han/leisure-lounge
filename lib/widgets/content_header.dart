import 'package:flutter/material.dart';
import 'package:leisurelounge/assets.dart';
import 'package:leisurelounge/data/data.dart';
import 'package:leisurelounge/widgets/widgets.dart';
import '../models/models.dart';
import '../models/models.dart';
import '../services/services.dart';
//import '../utils/utils.dart';
import '../screens/screens.dart';
import '../bloc/bloc.dart';
import 'package:provider/provider.dart';

class ContentHeader extends StatelessWidget {
  final ContentModel featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInProvider authProvider = Provider.of<SignInProvider>(context);
    print("the image url of the content: ${featuredContent.imageUrl}");
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.network(featuredContent.imageUrl).image,
                fit: BoxFit.cover),
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
            child: Text(
              featuredContent.title,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
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
                  icon: Icons.add, title: "List", onTap: () async {}),
              _playButton(
                featuredContent: featuredContent,
              ),
              VerticalIconButton(
                  icon: Icons.info_outline, title: "info", onTap: () async {})
            ],
          ),
        )
      ],
    );
  }
}

//this is the icon button play which is inserted in the middele between list and info buttons
class _playButton extends StatelessWidget {
  final ContentModel featuredContent;
  const _playButton({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      child: TextButton.icon(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ContentScreen(content: featuredContent)));
          },
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
