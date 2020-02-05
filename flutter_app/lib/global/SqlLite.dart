import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SqlLite{
  Database db;
  var dataBasePath;

  Future<SqlLite> init() async {
    dataBasePath = await getDatabasesPath() + '/' + 'my_db.db';
    db = await openDatabase(dataBasePath,
      version : 1,
      onCreate : (Database db, int version) async{
        await db.execute(
          'CREATE TABLE memoData1 (indexID INTEGER PRIMARY KEY AUTOINCREMENT, '
              '                    title TEXT, '
              '                    contents TEXT, '
              '                    writeTime TEXT, '
              '                    lastTime TEXT)',
        );
      },
    );
    return this;
  }

  Future<SqlLite> open() async{
    db = await openDatabase(dataBasePath);
    debugPrint(getList().toString());
    return this;
  }

  Future<List<Map>> getList() async{
    return await db.rawQuery('SELECT indexID, title, contents, writeTime, lastTime FROM memoData1 ORDER BY lastTime DESC ');
  }

  Future<List<Map>> getMemo(int currentIndex) async{
    return await db.rawQuery('SELECT indexID, title, contents, writeTime, lastTime FROM memoData1 WHERE indexID = ?',[currentIndex]);
  }

  void deletememoData(int currentIndex){
    db.rawDelete('DELETE FROM memoData1 WHERE indexID = ?', [currentIndex]);
  }

  void deleteMemoAll(){
    db.delete('memoData1');
  }

  void dropMemoTable(){
    db.rawQuery('DROP TABLE memoData1');
  }

  int insertmemoData(String title, String contents){
    int indexID;
    String time = DateTime.now().toString();
    db.rawInsert('INSERT INTO memoData(title, contents, writeTime, lastTime) VALUES (?,?,?,?)',
                  [title,contents,time,time]).then((indexID){
                    indexID = indexID;
                });
    return indexID;
  }

  void updatememoData(title, contents, indexID){
    String time = DateTime.now().toString();
    db.rawQuery('UPDATE memoData SET title = ?, contents = ?, lastTime = ? WHERE indexID = ?',
                  [title, contents, time, indexID]);
  }
}