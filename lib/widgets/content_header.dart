import 'package:flutter/material.dart';
import 'package:leisurelounge/assets.dart';
import 'package:leisurelounge/data/data.dart';
import 'package:leisurelounge/widgets/widgets.dart';
import '../models/models.dart';
import '../models/models.dart';
import '../services/services.dart';
import '../utils/utils.dart';
import '../bloc/bloc.dart';
import 'package:provider/provider.dart';

class ContentHeader extends StatelessWidget {
  final ContentModel featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInProvider authProvider = Provider.of<SignInProvider>(context);
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
            child: Image.asset(featuredContent.contentUrl),
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
                  onTap: () async {
                    print("list icon tapped");
                    ContentService instance = ContentService();
                    ContentModel model = await instance.getContentById(
                        'content+50d1ad75-0033-4d3e-b31d-30426c23fd0f');
                    print(model.title);
                    bool status = await instance.doesContentExist(
                        'content+50d1ad75-0033-4d3e-b31d-30426c23fd0f');
                    print(status);
                    List<ContentModel> lists = await instance.getContentAll();
                    print('4444444444444444444444444444444444444444');
                    print(lists);
                  }),
              _playButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "info",
                  onTap: () async {
                    ContentService instance = ContentService();
                    CommentService comserv = CommentService();
                    LikeServices likserv = LikeServices();
                    RateService ratserv = RateService();
                    ContentModel model = await instance.getContentById(
                        'content+0e64f03a-4dd2-4b5e-a472-510c232ce1e0');
                    LikeModel like = LikeModel(
                        userId: authProvider.userModel!.id,
                        contentId: model.id);
                    likserv.createContent(model, like);
                    CommentModel comment = CommentModel(
                        userId: authProvider.userModel!.id,
                        contentId: model.id,
                        description: "this movie is the very best");
                    comserv.createComment(model, comment);
                    RateModel rate = RateModel(
                        userId: authProvider.userModel!.id,
                        contentId: model.id,
                        value: 4);
                    ratserv.createComment(model, rate);
                    print("info button tapped");
                  })
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
          onPressed: () {
            print("play button clicked");
            //temporarryyyyyyyyyyyyyyyyyyyyyyyyyyy
            ContentService instance = ContentService();
            instance.createContent(featuredcontent);
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
