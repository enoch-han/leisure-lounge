import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWidget extends StatelessWidget {
  final VideoPlayerController videoController;
  const PlayerWidget({Key? key, required this.videoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return videoController != null && videoController.value.isInitialized
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 40),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: IconButton(
                    alignment: Alignment.centerLeft,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                    )),
              ),
            ),
            body: buildPlayer(),
          )
        : Container(
            height: 200,
            child: CircularProgressIndicator(),
          );
  }

  Widget buildPlayer() {
    return buildPlayerWidget();
  }

  Widget buildPlayerWidget() {
    return AspectRatio(
      aspectRatio: videoController.value.aspectRatio,
      child: VideoPlayer(videoController),
    );
  }
}
