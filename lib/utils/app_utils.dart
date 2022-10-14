import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void showToast(String msg, Color color) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: msg, backgroundColor: color);
  }
}
