import 'package:flutter/material.dart';

class FlagsProvider with ChangeNotifier {
  bool _flagListPost = false;
  getflagListPost() => _flagListPost;
  setflagListPost() {
    _flagListPost = !_flagListPost;
    notifyListeners();
  }
}
