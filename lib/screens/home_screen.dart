import 'package:flutter/material.dart';
import 'package:leisurelounge/widgets/recent.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;
  late ScrollController _scrollController;
  @override
  initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            //----- here is the featured content header ------
            child: ContentHeader(
              featuredContent: featuredcontent,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Trending(
                    title: "Trending",
                    items: trending,
                    key: PageStorageKey("trending"),
                  ),
                  Recent(
                    items: trending,
                    key: PageStorageKey("recent"),
                  ),
                  Recommendation(
                    items: trending,
                    key: PageStorageKey("recommendation"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
