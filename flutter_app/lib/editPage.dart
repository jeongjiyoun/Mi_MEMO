import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/sharedPre.dart';

///It Is Editing Memo Page
class EditPage extends StatefulWidget {
  final int currentIndex;
  final int flag;

  EditPage({@required this.currentIndex,@required this.flag, ScrollController listViewController, data});

  @override
    State<StatefulWidget> createState() {
    // TODO: implement createState
    return _editPageScreenState(currentIndex, flag);
  }
}

class _editPageScreenState extends State<EditPage>{
  var _currentIndex;
  String _contentText = '';
  int _flag;
  Color _colour = Colors.black87;
  SharedPre sharedPre = new SharedPre();

  @override
  void initState() {
    super.initState();
    try {
      _contentText = sharedPre.getMemoList()[_currentIndex];
    }catch(e){
      _contentText = '';
    }
  }

  _editPageScreenState(currentIndex, int flag){
    _flag = flag;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return editView(context);
  }

  void changeColor(){
    if(_colour == Colors.black87){
      _colour = Colors.white;
    } else {
      _colour = Colors.black87;
    }
  }

  StatefulWidget editView(BuildContext context){
    return Scaffold(
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
                  changeColor();
                });
              }
          ),
          IconButton(
            icon: const Icon(Icons.mode_edit),
            tooltip: 'Save',
            onPressed: (){
              sharedPre.setMemoList(_contentText, _flag, _currentIndex);
              Navigator.pushNamed(context, '/list');
            },
          ),
        ],
      ),
      body: Container(
        child : Container(

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
                  margin: EdgeInsets.fromLTRB(0.0, 40.0, 10.0, 20.0),
                  child: new Theme(data:
                  new ThemeData(
                    primaryColor: Colors.grey[700],

                    accentColor: Colors.transparent,
                    hintColor: Colors.grey[700],
                  ),
                    child: new TextField(
                      cursorColor: Colors.grey[800],
                      maxLength: 5000,
                      maxLines: null,
                      maxLengthEnforced: false,
                      keyboardType: TextInputType.multiline,
                      controller: TextEditingController(text: _contentText),
                      style: new TextStyle(
                        color: _colour,
                        fontSize: 20.0,
                      ),
                      onChanged: (text) {
                        _contentText = text;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}