import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showAwesomeDailog(BuildContext context, DialogType dialogType,
    AnimType animType, String title, String desc, Function onOkPress) {
  var btnColor;
  var buttonText;

  switch (dialogType) {
    case DialogType.ERROR:
      btnColor = Colors.red;
      buttonText = 'Try again';
      break;
    case DialogType.INFO:
      //TODO
      break;
    case DialogType.INFO_REVERSED:
      //TODO
      break;
    case DialogType.WARNING:
      //TODO
      break;
    case DialogType.SUCCES:
      btnColor = Colors.greenAccent;
      buttonText = 'Continue';
      break;
    case DialogType.QUESTION:
      //TODO
      break;
    case DialogType.NO_HEADER:
      //TODO
      break;
  }

  AwesomeDialog(context: context,
    dialogType: dialogType,
    animType: animType,
    title: title,
    desc: desc,
    btnOkOnPress: onOkPress,
    btnOkText: buttonText,
    btnOkColor: btnColor,
    headerAnimationLoop: false
  )..show();
}
