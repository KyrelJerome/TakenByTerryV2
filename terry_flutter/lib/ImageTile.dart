import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatefulWidget {
  @override
  _ImageTileState createState() => _ImageTileState();
  ImageTile(
    this.text,
    this.imageurl, {
    this.textStyle,
    this.hoverColor = Colors.black,
  });

  final String text;
  final hoverColor;
  final textStyle;
  final String imageurl;
}

class _ImageTileState extends State<ImageTile> {
  bool hovering;
  final double hoverOpacity = 0.75;

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
      child: Container(
        child: Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: Duration(milliseconds: 150),
              opacity: hovering ? hoverOpacity : 0.0,
              child: Container(
                color: widget.hoverColor,
                child: Text(widget.text),
              ),
            ),
            Image.network(widget.imageurl),
          ],
        ),
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
