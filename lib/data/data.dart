import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  late int _income;
  late int _balance;

  get getIncome {
    return _income;
  }

  void addIncome() {
    _balance  = _balance + _income;
    ChangeNotifier();
  }
}
