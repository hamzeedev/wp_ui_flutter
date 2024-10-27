import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension MyExt on BuildContext {


  void openScreen(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  }

  void pop(){
    Navigator.pop(this);
  }
}

extension DateFormateExt on int{
  String formatDate(String pattern){
    return DateFormat(pattern).format(DateTime.fromMillisecondsSinceEpoch(this));
  }
}