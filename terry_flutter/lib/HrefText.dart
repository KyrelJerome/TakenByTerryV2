import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:terry_flutter/utils.dart';

class HrefText extends StatelessWidget {
  final String url;
  final String text;
  final TextStyle style;
  HrefText(this.text, this.url, {this.style});
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        child: Text(this.text, style: style),
        onTap: () => navigate(url),
      ),
    );
  }
}

class ActiveHref extends StatefulWidget {
  final String url;
  final String text;
  final TextStyle style;
  final Color hoverColor;
  @override
  _ActiveHrefState createState() => _ActiveHrefState();

  ActiveHref(
    this.text,
    this.url, {
    this.style,
    this.hoverColor = Colors.grey,
  });
}

class _ActiveHrefState extends State<ActiveHref> {
  bool hovering;

  @override
  void initState() {
    this.hovering = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: onEnterCallback,
      onExit: onExitCallback,
      child: HrefText(
        widget.text,
        widget.url,
        style: hovering
            ? widget.style.apply(color: widget.hoverColor)
            : widget.style,
      ),
    );
  }

  void onEnterCallback(PointerHoverEvent e) {
    setState(() {
      this.hovering = true;
    });
  }

  void onExitCallback(PointerExitEvent e) {
    setState(() {
      this.hovering = false;
    });
  }
}
