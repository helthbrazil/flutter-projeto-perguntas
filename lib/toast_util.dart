import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static toast(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }
}
