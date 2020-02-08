
class MemoEntity {
  String title = '';
  String contents  = '';
  String writetime  = '';
  String lasttime  = '';
  String id  = '';

  MemoEntity({this.title, this.contents, this.writetime, this.lasttime, this.id, mapData}){
    if(mapData != null){
      title = mapData['title'];
      contents = mapData['contents'];
      writetime = mapData['writeTime'];
      lasttime = mapData['lastTime'];
      id = mapData['indexID'].toString();
    }
  }


}
