import 'package:flutter/cupertino.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

enum ScreenSize { small, medium, large }

ScreenSize getScreenSize(context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 500) {
    return ScreenSize.small;
  } else if (width < 1120) {
    return ScreenSize.medium;
  } else {
    return ScreenSize.large;
  }
}

void navigate(String url) {
  html.window.location.href = url; // or any website your want
}

dynamic getSideImages() async {
  String yaml = await rootBundle.loadString('imageFiles.yaml');
  List<String> urls = [];
  loadYaml(yaml)["side"].forEach((element)=>urls.add(element));
  return urls;
  }

dynamic getMainImage() async {
  String yaml = await rootBundle.loadString('imageFiles.yaml');
  return loadYaml(yaml)["main"].toString();
}

dynamic getSideImageUrl() async {
  String yaml = await rootBundle.loadString('imageUrls.yaml');
  List<String> urls = [];
  dynamic parsed = loadYaml(yaml);
  parsed["sideUrls"].forEach((element)=>urls.add(element.toString()));
  return urls;
}

dynamic getSidebarInfo() async {
  String yaml = await rootBundle.loadString('imageFiles.yaml');
  List<String> urls = [];
  loadYaml(yaml)["side"].map((element)=>urls.add(element));
  return null;
}
