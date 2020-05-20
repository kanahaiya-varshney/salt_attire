import 'package:flutter/material.dart';
import 'package:saltattire/constants/ColorsConstants.dart';
import 'package:saltattire/ui_pages/splash_screen.dart';

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    primaryColor: primaryColor,
    fontFamily: 'DancingScript'
  ),
  home: new SplashScreen(),
  debugShowCheckedModeBanner: false,
));
