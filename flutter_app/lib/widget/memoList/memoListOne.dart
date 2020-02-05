import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/global/Data.dart';
import 'package:flutter_app/module/MemoEntity.dart';
import 'package:flutter_app/screen/writePage.dart';

class MemoListOne extends StatelessWidget {
  final String title;
  final String id;
  final String lastTime;
  final Data appData;

  MemoListOne({this.title, this.id, this.lastTime, this.appData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            lastTime,
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
              goMemoUpdate(id, context);
          },
          onLongPress: (){
              goMemoDelete(id);
          }
      ),
      );
  }

  goMemoUpdate(String id, BuildContext context){
    MemoEntity memoEntity = new MemoEntity(title: title, id: id, lasttime: lastTime);
    Navigator.push(context, MaterialPageRoute(builder: (context) => WritePage(memoEntity, appData)));
  }
  goMemoDelete(String id){
    //Will you really delete it? Y/N
  }
}