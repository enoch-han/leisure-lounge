import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/models.dart';

class Player extends StatefulWidget {
  final ContentModel content;
  Player({Key? key, required this.content}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late VideoPlayerController videoController;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    videoController = VideoPlayerController.network(widget.content.contentUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => videoController.play());
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}
