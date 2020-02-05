import 'package:flutter/material.dart';
import 'package:flutter_app/global/Data.dart';
import 'package:flutter_app/screen/listPage.dart';

void main() => runApp(new MyApp()) ;

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Data data = Data();

    return FutureBuilder(
      future: data.load(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return MaterialApp(
              title : 'MI NOTE',
              theme: ThemeData.light().copyWith(
              ),
            home: ListPage(appData: snapshot.data),
          );
        } else if(snapshot.hasError){
          print(snapshot);
          return MaterialApp(home : Text('error.....'));
        }
        return MaterialApp(home: Text('loading'));
      },
    );
  }
}

