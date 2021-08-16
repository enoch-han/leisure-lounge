import 'package:flutter/material.dart';
import 'package:leisurelounge/assets.dart';
import '../data/data.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class MyListScreen extends StatefulWidget {
  MyListScreen({Key? key}) : super(key: key);

  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> _icons = {
      "movie": Icons.movie,
      "music": Icons.music_note
    };

    final List<Widget> tabs = [_Movie(), _Music()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              "Movies",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _Movie(),
          ),
          SliverToBoxAdapter(
            child: _RecentViewed(),
          )
        ],
      ),
    );
  }
}

//*********************************************************** */
class _Movie extends StatelessWidget {
  const _Movie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Content> mylistitems = trending;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Text(
              "My List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 400.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (BuildContext context, int index) {
                  Content item = trending[index];
                  return GestureDetector(
                    onTap: () {
                      print(
                          'the item called ${item.title} is tapped from the mylist widget');
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 400.0,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 3.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0, 3))
                              ],
                              image: DecorationImage(
                                  image: AssetImage(item.imageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 400.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                        ),
                        Positioned(
                          left: 0.0,
                          right: 0.0,
                          bottom: 10.0,
                          child: Container(
                            width: 200.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                VerticalIconButton(
                                    icon: Icons.play_arrow,
                                    title: "Play",
                                    onTap: () => print(
                                        "play button from mylist was tapped")),
                                VerticalIconButton(
                                    icon: Icons.delete,
                                    title: "Delete",
                                    onTap: () => print(
                                        "delete button from mylist was tapped"))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _RecentViewed extends StatelessWidget {
  final String title = "Recently viewed";
  final List<Content> items = trending;
  _RecentViewed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = items[index];
                return GestureDetector(
                    onTap: () => {
                          print(
                              'the object called ${content.title} was tapped in the recent viewed form my list')
                        },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      height: 200,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ));
              }),
        )
      ]),
    );
  }
}

class _Music extends StatelessWidget {
  const _Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
