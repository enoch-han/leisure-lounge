import 'package:flutter/material.dart';
import 'package:leisurelounge/models/content.dart';
import 'package:leisurelounge/models/models.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import '../bloc/bloc.dart';

class ContentScreen extends StatefulWidget {
  final ContentModel content;

  ContentScreen({Key? key, required this.content}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    final SignInProvider signInProvider = Provider.of<SignInProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
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
          preferredSize: Size(MediaQuery.of(context).size.width, 40)),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(
          children: [
            ContentPageHeader(content: widget.content),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.content.getRateCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        widget.content.getLikeCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        widget.content.getCommentCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      VerticalIconButton(
                          icon: Icons.rate_review,
                          title: 'Rate',
                          onTap: () {
                            signInProvider.rate(
                                3,
                                signInProvider.userModel as UserModel,
                                widget.content);
                            setState(() {});
                          }),
                      VerticalIconButton(
                          icon: Icons.thumb_up,
                          title: 'Like',
                          onTap: () {
                            print(signInProvider.status);
                            print(
                                "this is the user in like tapped ${signInProvider.user}");
                            signInProvider.like(
                                signInProvider.userModel as UserModel,
                                widget.content);
                            setState(() {});
                          }),
                      VerticalIconButton(
                          icon: Icons.comment,
                          title: 'Comment',
                          onTap: () {
                            signInProvider.comment(
                                "description",
                                signInProvider.userModel as UserModel,
                                widget.content);
                          })
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Description",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text(
              widget.content.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
