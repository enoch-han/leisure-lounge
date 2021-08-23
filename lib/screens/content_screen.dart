import 'package:flutter/material.dart';
import 'package:leisurelounge/models/content.dart';
import '../widgets/widgets.dart';

class ContentScreen extends StatefulWidget {
  final Content content;
  ContentScreen({Key? key, required this.content}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ContentPageHeader(content: widget.content),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.rate_review, title: 'Rate', onTap: () {}),
              VerticalIconButton(
                  icon: Icons.thumb_up, title: 'Like', onTap: () {}),
              VerticalIconButton(
                  icon: Icons.comment, title: 'Comment', onTap: () {})
            ],
          ),
        ),
        Center(
          child: Text(
            "Description",
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Text(
          widget.content.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}
