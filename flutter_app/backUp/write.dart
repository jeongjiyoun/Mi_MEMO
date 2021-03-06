import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/Data.dart';
import 'package:flutter_app/module/MemoEntity.dart';
import 'package:flutter_app/screen/listPage.dart';
import 'package:google_fonts/google_fonts.dart';

class WritePage extends StatefulWidget{
  final MemoEntity memoEntity;
  final Data appData;
  TextEditingController _textEditingController = new TextEditingController();

  //Constructor
  WritePage(this.memoEntity, this.appData);

  @override
  State<StatefulWidget> createState() => _WriteState();
}

//inner Class
class _WriteState extends State<WritePage>{
  Color colour = Colors.black87;
  String _currentContents;
  TextEditingController _textEditingController;

  void init(){
    _textEditingController = TextEditingController.fromValue(new TextEditingValue(text: widget.memoEntity.contents,
        selection: new TextSelection.collapsed(offset: widget.memoEntity.contents.length-1
        )
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Row(
            children: <Widget>[
              Expanded( //선이 들어갈 배경
                flex: 5,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(width: 1.0),
                      ),
                      Expanded(
                        flex: 1,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: Colors.red[200],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: VerticalDivider(
                          thickness: 0.8,
                          color: Colors.red[200],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(width: 3.0,),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 95,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 20.0),
                  child: new Theme(data:
                  new ThemeData(
                    primaryColor: Colors.red[200],
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
                        style: GoogleFonts.nanumGothic(
                          color: colour,
                          fontSize: 20.0,
                        ),
                        controller: TextEditingController.fromValue(new TextEditingValue(text: widget.memoEntity.contents,
                            selection: new TextSelection.collapsed(offset: widget.memoEntity.contents.length-1
                            )
                        )
                        ),
                        onChanged: (text) {
                          _currentContents = text;
                          widget.memoEntity.contents = text;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar :  AppBar(
          title: Text('MI NOTE'),
          backgroundColor: Color.fromARGB(200, 234, 108, 107),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.clear),
                tooltip: 'delete',
                onPressed: () {
                  deleteMemo();
                }
            ),
            IconButton(
                icon: const Icon(Icons.lock),
                tooltip: 'Unvisuable',
                onPressed: () {
                  changeColor();
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
  }


  void changeColor(){
    setState(() {
    });
    if(colour == Colors.black87){
      colour = Colors.white;
    } else {
      colour = Colors.black87;
    }

    _textEditingController = TextEditingController.fromValue(new TextEditingValue(text: widget.memoEntity.contents,
        selection: new TextSelection.collapsed(offset: widget.memoEntity.contents.length-1
        )
      )
    );
  }

  void deleteMemo() {
    String id = widget.memoEntity.id;
    Data appData = widget.appData;
    if (id == null) {
      return;
    } else {
      showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('삭제하시겠습니까?'),
            content: new Text('되돌릴 수 없습니다. 정말 삭제하시겠습니까?'),
            actions: <Widget>[
              new FlatButton(
                child: new Text("예",
                  style: TextStyle(color: Colors.black87),),
                onPressed: () {
                  print(id);
                  appData.deleteMemoData(int.parse(id));
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(appData: appData,)));
                },
              ),
              new FlatButton(
                child: new Text("아니오"
                  , style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void goAction()async {
    if(_currentContents == null ||_currentContents == '') {
    }   else {
      String title =makeTitle(_currentContents);
      if(widget.memoEntity.id == null || widget.memoEntity.id == ''){
        print('저장');
        await widget.appData.addMemoData(title, _currentContents);
      } else {
        print('갱신');
        await widget.appData.updateMemoData(int.parse(widget.memoEntity.id), title, _currentContents);
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(
      appData: widget.appData,
    )));

  }

  String makeTitle(String _currentContents){
    String title = _currentContents.split(' ')[0];
    if(title.length >= 8){
      title = title.substring(0,8) + '...';
    }
    return title;
  }
}
