import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/Data.dart';
import 'package:flutter_app/module/MemoEntity.dart';
import 'package:flutter_app/widget/memoList/memoListOne.dart';

class MemoList extends StatelessWidget {
  final data;
  final Data appData;

  MemoList({@required this.data, this.appData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Divider(
          color : Colors.black87,
        ),
      )),
        itemBuilder: (BuildContext context, int index){
          MemoEntity memoEntity = MemoEntity(mapData : data[index]);
          return MemoListOne(
              lastTime : memoEntity.lasttime,
              contents : memoEntity.contents,
              title : memoEntity.title,
              id : memoEntity.id,
              appData: appData,
          );
        },
      itemCount: data.length,
    );
  }

}

