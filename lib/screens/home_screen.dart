import 'package:flutter/material.dart';
import 'package:leisurelounge/bloc/bloc.dart';
import 'package:leisurelounge/widgets/recent.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import '../data/data.dart';
import '../services/services.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";
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
    final SignInProvider signInProvider = Provider.of<SignInProvider>(context);
    print("in homescreen build");
    ContentService contentService = ContentService();
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: FutureBuilder(
        future: signInProvider.featuredContent(),
        builder: (context, snapshot) {
          print("the snapshot data${snapshot.data}");
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                //----- here is the featured content header ------
                child: ContentHeader(
                  featuredContent: snapshot.data as ContentModel,
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
          );
        },
      ),
    );
  }
}
