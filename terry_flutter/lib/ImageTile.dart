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
      onEnter: onEnterCallback,
      onExit: onExitCallback,
      child: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: Duration(milliseconds: 150),
              opacity: hovering ? hoverOpacity : 0.0,
              child: Container(
                width: double.infinity,
                color: widget.hoverColor,
                child: Center(
                  child: Image.network(
                    widget.imageurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(widget.text,
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white,
                      )),
            ),
          ],
        ),
      ),
    );
  }

  void onEnterCallback(PointerEnterEvent e) {
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
