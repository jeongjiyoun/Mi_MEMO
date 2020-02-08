import 'package:flutter/material.dart';
import 'package:flutter_app/module/MemoEntity.dart';

class MemoWriter extends StatelessWidget {
  final MemoEntity memoEntity;

  MemoWriter({this.memoEntity}){
    print(memoEntity.contents);
  }

  @override
  Widget build(BuildContext context) {
    Color colour;
    String contentText;

    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 40.0, 10.0, 20.0),
      child: new Theme(data:
        new ThemeData(
          primaryColor: Colors.grey[700],
          accentColor: Colors.transparent,
          hintColor: Colors.grey[700],
        ),
        child: Container(
          child: new TextField(
            cursorColor: Colors.grey[800],
            maxLength: 5000,
            maxLines: null,
            expands: true,
            maxLengthEnforced: false,
            keyboardType: TextInputType.multiline,
            controller: TextEditingController(
                text: contentText = memoEntity.contents),
            style: new TextStyle(
              color: colour,
              fontSize: 20.0,
            ),
            onChanged: (text) {
              contentText = text;
            },
          ),
        ),
      ),
    );
  }
}