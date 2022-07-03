import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'SizeConfig.dart';

enum ToastType { Info, Success, Error }

class AppSnackBar {
  static BuildContext? appContext;
  // static GlobalKey<ScaffoldState> scaffoldKey;
  static Color warningColor = Color(0xffFAE6CD);
  static Color successDark = Color(0xFF16C79A);
  static Color errorDark = Color(0xFFF05454);
  static Color infoDark = Color(0xFF3282B8);
  static Color success = Color(0xFFD0F0E8);
  static Color error = Color(0xFFF8DBDB);
  static Color info = Color(0xFFD5E3ED);
  static void show(BuildContext context, String text, ToastType type) {
    Color backgroundColor;
    Color textColor;
    Icon icon;
    switch (type) {
      case ToastType.Success:
        backgroundColor = success;
        textColor = successDark;
        icon = Icon(
          Icons.done,
          color: textColor,
        );
        break;
      case ToastType.Error:
        backgroundColor = error;
        textColor = errorDark;
        icon = Icon(
          Icons.error_outline,
          color: textColor,
        );
        break;
      default:
        {
          backgroundColor = info;
          textColor = infoDark;
          icon = Icon(
            Icons.info_outline,
            color: textColor,
          );
        }
    }
    Flushbar(
      duration: Duration(seconds: 4),
      icon: icon,
      messageText: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontSize: SizeConfig.h(13),
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.BOTTOM,
    )..show(appContext!);
    // scaffoldKey.currentState.showSnackBar(SnackBar(
    //     backgroundColor: backgroundColor,
    //     content: Text(
    //       text,
    //       style: TextStyle(color: Colors.white),
    //     )));
  }

  // static void showWithUndo(String text, ToastType type, Function undoCallback,
  //     Function deleteCallback, BuildContext context) {
  //   Color backgroundColor;
  //   Color textColor;
  //   Icon icon;

  //   switch (type) {
  //     case ToastType.Success:
  //       backgroundColor = success;
  //       textColor = successDark;
  //       icon = Icon(
  //         Icons.done,
  //         color: textColor,
  //       );
  //       break;
  //     case ToastType.Error:
  //       backgroundColor = error;
  //       textColor = errorDark;
  //       icon = Icon(
  //         Icons.error_outline,
  //         color: textColor,
  //       );
  //       break;
  //     default:
  //       {
  //         backgroundColor = info;
  //         textColor = infoDark;
  //         icon = Icon(
  //           Icons.info_outline,
  //           color: textColor,
  //         );
  //       }
  //   }

  //   bool isUndone = false;
  //   Flushbar flush;
  //   flush = Flushbar(
  //     icon: icon,
  //     duration: Duration(seconds: 4),
  //     messageText: Text(
  //       text,
  //       style: TextStyle(
  //           color: textColor,
  //           fontSize: SizeConfig.h(13),
  //           fontWeight: FontWeight.bold),
  //     ),
  //     backgroundColor: backgroundColor,
  //     flushbarPosition: FlushbarPosition.BOTTOM,
  //     mainButton: FlatButton(
  //       child: Text(
  //         S.current.undo,
  //         style: TextStyle(
  //             color: textColor,
  //             fontSize: SizeConfig.h(13),
  //             fontWeight: FontWeight.bold),
  //       ),
  //       onPressed: () {
  //         flush.dismiss();
  //         isUndone = true;
  //         undoCallback();
  //       },
  //     ),
  //   );
  //   flush.show(context).then((value) {
  //     if (!isUndone) {
  //       deleteCallback();
  //     }
  //   });
  // }

  static void showPersistantWithAction(String text, String actionText,
      Function actionCallback, BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Icon icon;

    backgroundColor = warningColor;
    textColor = Colors.white;
    icon = Icon(
      Icons.warning_rounded,
      color: textColor,
    );

    Flushbar flush = Flushbar();
    flush = Flushbar(
      icon: icon,
      duration: Duration(seconds: 12),
      messageText: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontSize: SizeConfig.h(13),
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.BOTTOM,
      mainButton: FlatButton(
        child: Text(
          actionText,
          style: TextStyle(
              color: textColor,
              decoration: TextDecoration.underline,
              fontSize: SizeConfig.h(14),
              fontWeight: FontWeight.w800),
        ),
        onPressed: () {
          flush.dismiss();
          actionCallback();
        },
      ),
    );
    flush.show(context);
  }
}
