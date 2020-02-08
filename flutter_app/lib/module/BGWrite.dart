import 'package:flutter/material.dart';

class BGWrite extends StatelessWidget {
  const BGWrite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded( //선이 들어갈 배경
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
    );
  }
}
