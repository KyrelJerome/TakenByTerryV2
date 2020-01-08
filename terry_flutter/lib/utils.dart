import 'package:flutter/cupertino.dart';
import 'dart:html' as html;

enum ScreenSize { small, medium, large }

ScreenSize getScreenSize(context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 500) {
    return ScreenSize.small;
  } else if (width < 1024) {
    return ScreenSize.medium;
  } else { 
    return ScreenSize.large;
  }
}

void navigate(String url) {
  html.window.location.href = url; // or any website your want
}
