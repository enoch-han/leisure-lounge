import 'package:flutter/material.dart';
import 'package:leisurelounge/data/data.dart';
import 'package:leisurelounge/models/models.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  /**
   * this class needs high level of refactoring or coding 
   * here is how the logic works the list contents from which the list
   * tile is in this class and the search bar in other class so the function
   * searchitems function is passed to the search bar where it has another
   * function which invokes the searchitems function and the class's setstate
   * so the logic has some back and forthe actions which is not good so needs 
   * recoding
   */
  String query = '';
  late List<ContentModel> allContent;
  @override
  void initState() {
    allContent = trending;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black38),
          alignment: Alignment.center,
          child: Text(
            "search contents here",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: SearchBar(
                text: query, hint: "search by name", onChanged: searchItems),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: allContent.length,
                itemBuilder: (BuildContext context, int index) {
                  ContentModel content = allContent[index];
                  return Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => print("list tile tapped"),
                          leading: Image.asset(
                            content.imageUrl,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(content.title),
                          subtitle: Text(content.description),
                        ),
                        Divider(
                          color: Colors.black54,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  void searchItems(String query) {
    setState(() {
      this.query = query;
      print("in searchitem");
      allContent = allContent.where((content) {
        return content.title.contains(query);
      }).toList();
    });
  }
}
