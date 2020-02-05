import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/editPage.dart';
import 'package:flutter_app/global/sharedPre.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _listPageScreenState();
  }
}

class _listPageScreenState extends State<ListPage> {
  var _currentIndex = -1;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  SharedPre _sharedPre = new SharedPre();
  var _memoList = new List<String>();

  @override
  Widget build(BuildContext context) {
    return listView(context);
  }

  @override
  void initState() {
    super.initState();
    _memoList = _sharedPre.getMemoList();
  }

  StatefulWidget listView(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('MI NOTE'),
        backgroundColor: Color.fromARGB(200, 234, 108, 107),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.mode_edit),
            tooltip: 'Write',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(
                flag : _sharedPre.getInsertMemoFlag(),
              )
              ));
            },
          ),
        ],
      ),
      body: Container(
        child : Container(
          child: _buildList(),
        ),
      ),
    );
  }


  Widget _buildWrappedRow(String content, int index) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: Key(content),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _memoList = _sharedPre.getMemoListForList();
          _memoList.removeAt(index);
        });
      },
      child: _buildRow(content, index),
    );
  }

  Widget _buildRow(String content, int index) {
    return ListTile(
      title: Text(
        content,
        style: _biggerFont,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        _currentIndex = index;
        Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(
          currentIndex: _currentIndex,
          flag : _sharedPre.getUpdateMemoFlag(),
        )
        ));
      },
        onLongPress: (){
        }
    );
  }
  Widget _buildList() {
    //final itemCount = _memoList.length == 0 ? 0 : _memoList.length * 2 - 1;
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal:16.0),
        itemCount: _memoList.length,
        itemBuilder: (context, index) {
          final memo = _memoList[index];
          return _buildWrappedRow(memo, index);
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color : Colors.black87,
          ),
        )
    );
  }

}

