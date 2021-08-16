import 'package:flutter/material.dart';
import '../models/models.dart';

class SearchBar extends StatefulWidget {
  String text;
  final ValueChanged<String> onChanged;
  final String hint;
  SearchBar(
      {Key? key,
      required this.text,
      required this.hint,
      required this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.white);
    final styleHint = TextStyle(color: Colors.blue);
    final style = widget.text.isEmpty ? styleHint : styleActive;
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: 4, color: Colors.white)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: style.color,
                  ),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hint,
          hintStyle: style,
          border: InputBorder.none,
        ),
        onChanged: (String value) {
          widget.onChanged(value);
          setState(() {
            widget.text = value;
          });
        },
      ),
    );
  }
}
