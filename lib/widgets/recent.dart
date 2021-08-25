import 'package:flutter/material.dart';
import '../models/models.dart';

class Recent extends StatelessWidget {
  final String title = "Recent";
  final List<ContentModel> items;
  const Recent({Key? key, required this.items}) : super(key: key);

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
          height: 500,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final ContentModel content = items[index];
                return GestureDetector(
                  onTap: () => {
                    print(
                        'the object called ${content.title} was tapped in the recent list')
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    height: 400,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
