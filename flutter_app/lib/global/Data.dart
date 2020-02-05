import 'package:flutter/cupertino.dart';
import 'package:flutter_app/global/SqlLite.dart';

class Data {
  SqlLite sqlLite;

  Future<Data> load() async{
    sqlLite = await SqlLite().init();
    return this;
  }

  Future<void> open() async {
    await sqlLite.open();
  }

  Future<List<Map>> getMemoList() async{
    open();
    debugPrint(sqlLite.getList().toString());
    List<Map> memoLIst = await sqlLite.getList();
    print(memoLIst);
    return memoLIst;
  }

  void addMemoData(String title, contents) async{
    open();
    sqlLite.insertmemoData(title, contents);
}

  void deleteAll() async{
    open();
    sqlLite.deleteMemoAll();
  }

  void updateMemoData(int currentIndex, String title, String contents) async{
    await open();
    await sqlLite.updatememoData(title, contents, currentIndex);
  }

  void deleteMemoData(int currentIndex) async{
    await open();
    await sqlLite.deletememoData(currentIndex);
;  }

  Future<List<Map>> getMemo(String id) async{
    await open();
    if(id != null)return await sqlLite.getMemo(int.parse(id));
    else if(id != null)return List<Map>();
  }

}