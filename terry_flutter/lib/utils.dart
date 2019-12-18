import 'dart:html';

import 'package:flutter/cupertino.dart';

enum ScreenSize { small, medium, large }

ScreenSize getScreenSize(context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return ScreenSize.small;
  } else if (width < 900) {
    return ScreenSize.medium;
  } else {
    return ScreenSize.large;
  }
}


void navigate(String url){

}