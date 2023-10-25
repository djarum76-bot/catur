import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData theme(){
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true
    );
  }

  static const brownColor = Color(0xFF794839);
  static const darkBrownColor = Color(0xFF5E3231);
  static const greenColor = Color(0xff37c878);
}