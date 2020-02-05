import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/Data.dart';
import 'package:flutter_app/module/MemoEntity.dart';
import 'package:flutter_app/widget/memoList/memoList.dart';

import '../editPage.dart';

class WritePage extends StatefulWidget{
  final MemoEntity memoEntity;
  final Data appData;

  //Constructor
  WritePage(this.memoEntity, this.appData);

  @override
  State<StatefulWidget> createState() => _WriteState();
}

//inner Class
class _WriteState extends State<WritePage>{

  @override
  initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.memoEntity!= null ? widget.appData.getMemo(widget.memoEntity.id) : widget.appData.getMemo(null),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return SafeArea(
            child: Scaffold(
              body: MemoWriter(
                  data: snapshot.data,
              ),
                backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text('MI NOTE'),
                backgroundColor: Color.fromARGB(200, 234, 108, 107),
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.lock),
                      tooltip: 'Unvisuable',
                      onPressed: () {
                        setState(() {
 //                         changeColor();
                        });
                      }
                  ),
                  IconButton(
                    icon: const Icon(Icons.mode_edit),
                    tooltip: 'Write',
                    onPressed: (){
                      goAction();
                    },
                  ),
                ],
              ),
            ),
          );
        } else if(snapshot.hasError){
            return Text('It has ERROR');
        }
        return Text('Loading...');
      },
    );
  }

void goAction(){
// 작성 페이지로 돌아가기.
  }
}

class MemoWriter extends StatelessWidget{
  final data;

  MemoWriter({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(''),
    );
  }
}