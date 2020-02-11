import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AtText extends SpecialText {
  static const String flag = "@MI";
  final int start;

  // whether show background for @MI
  final bool showAtBackground;

  AtText(TextStyle textStyle, SpecialTextGestureTapCallback onTap,
      {this.showAtBackground: false, this.start})
      : super(flag, "#", textStyle, onTap: onTap);

  @override
  InlineSpan finishText() {
    TextStyle textStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
      String temp = toString();
/*
      if(temp.startsWith("@MI ")){
        temp = temp.split("@MI ")[1];
      } else {
        temp = temp.split("@MI")[1];
      }

      if(temp.endsWith(" #")){
        temp = temp.split((" #"))[0];
      } else {
        temp = temp.split(("#"))[0];
      }
*/

    final String atText = temp;
    return showAtBackground
        ? BackgroundTextSpan(
        background: Paint()..color = Colors.blue.withOpacity(0.0),
        text: atText,
        actualText: atText,
        start: start,

        ///caret can move into special text
        deleteAll: true,
        style: textStyle,
        recognizer: (TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) onTap(atText);
          }))
        : SpecialTextSpan(
        text: atText,
        actualText: atText,
        start: start,
        style: textStyle,
        recognizer: (TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) onTap(atText);
          }));
  }
}
