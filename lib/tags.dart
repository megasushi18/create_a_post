import 'package:flutter/material.dart';

class Tags extends StatelessWidget {

  final String text;
  var list = ["one", "two", "three", "four"];

  Tags({this.text});

  ActionChip createChip(string) {
    return ActionChip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(string),
        ),
        label: Text(string),
      onPressed: () {
        print(string);
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: <Widget>[
        for(String string in list)
          createChip(string),
      ],
    );
  }
}
