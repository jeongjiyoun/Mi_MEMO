import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingPageState();
  }
}

class LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) => loadingView(context);

  StatefulWidget loadingView(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 75,
                child: FlatButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.mode_edit,
                      size: 60.0,
                      color: Color(0xFFEF9A9A),
                    ),
                    label: Text('Mi Note',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFEF9A9A),
                    ),),
                  ),
              ),
              Expanded(
                flex: 5,
                child: Divider(
                  thickness: 1.0,
                  indent: 30.0,
                  endIndent: 30.0,
                ),
              ),
              Expanded(
                flex: 20,
                child: Text('Write Every Thing Whenever You Want',
                  style: TextStyle(
                    color: Colors.grey,
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

