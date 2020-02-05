import 'package:shared_preferences/shared_preferences.dart';

/// Function For Data Storing
/// It has function about SharedPreferences
class SharedPre {
  static SharedPreferences prefs;
  static const key = "memo_list";
  static const int insertMemoFlag = 1;
  static const int updateMemoFlag = 2;
  static const int deleteMemoFlag = 9;

  SharedPre(){
    init();
  }

  int getInsertMemoFlag(){
    return insertMemoFlag;
  }

  int getUpdateMemoFlag(){
    return updateMemoFlag;
  }

  //Get A SharedPreferences
  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //Get A SharedPreferences
  SharedPreferences getSharedPre() {
    init();

    //TextEditor
    //extended Text_field
    //keyboard동작을 읽어서 던지는 방식.
    return prefs;
  }

  //function for update, insert, delete
  void setMemoList(String memo, int flag, int currentIndex){
    init();
    var temp = getMemoList();
    switch(flag){
      case insertMemoFlag : {
          temp.add(memo);
          prefs.setStringList(key, temp);
          break;
      }
      case updateMemoFlag : {
        print(currentIndex);
        try {
          temp.remove(temp[currentIndex]);
        } catch(e){
          //ignore;;
        }
        temp.add(memo);
        prefs.setStringList(key, temp);
        break;
      }

      case deleteMemoFlag : {
        temp.remove(temp[currentIndex]);
        prefs.setStringList(key, temp);
        break;
      }
    }
  }

  //get a Memo by Index
  String getMemo(var _currentIndex) {
    init();
    var temp = getMemoList();
    String memoContents = temp[_currentIndex];
    return memoContents;
  }

  //get a MemoLIst
  List<String> getMemoList(){
    init();
    List<String> memoList = prefs.getStringList(key) ?? [];
    return memoList;
  }

  //get a MemoLIst
  List<String> getMemoListForList(){
    init();
    List<String> memoList = prefs.getStringList(key) ?? [];
    //titleList 폐지
//    Iterable<String> reversed = memoList.reversed;
 //   memoList = reversed.toList();
  //  print(memoList);
    return memoList;
  }

}