import 'package:flutter/material.dart';
import 'package:terry_flutter/utils.dart';

class HrefText extends StatelessWidget {
  final String url;
  final String text;
  final TextStyle style;
  HrefText(this.text, this.style, this.url);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text("text", style: style),
      onTap: () => navigate(url),
    );
  }
}
