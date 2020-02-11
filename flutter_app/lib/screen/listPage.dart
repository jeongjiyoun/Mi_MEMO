import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/Data.dart';
import 'package:flutter_app/module/MemoEntity.dart';
import 'package:flutter_app/screen/writePage.dart';
import 'package:flutter_app/screen/loadingPage.dart';
import 'package:flutter_app/widget/memoList/memoList.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPage extends StatefulWidget{
  final Data appData; //AppData

  //Constructor
  ListPage({this.appData});

  @override
  State<StatefulWidget> createState() => _MemoState();
}

//inner Class
class _MemoState extends State<ListPage>{

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
      future: widget.appData.getMemoList(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return SafeArea(
            child: Scaffold(
              body: MemoList(
                  data: snapshot.data,
                  appData : widget.appData,
              ),
                backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text('MI NOTE',
                  style: GoogleFonts.autourOne(),),
                backgroundColor: Color.fromARGB(200, 234, 108, 107),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.mode_edit),
                    tooltip: 'Write',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WritePage(
                              new MemoEntity(),
                              widget.appData)
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else if(snapshot.hasError){
            return LoadingPage();
        }
        return LoadingPage();
      },
    );
  }

}