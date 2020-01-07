import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:terry_flutter/utils.dart';

class ImageTile extends StatefulWidget {
  @override
  _ImageTileState createState() => _ImageTileState();
  ImageTile(
    this.text,
    this.imageUrl,
    this.navUrl, {
    this.textStyle,
    this.hoverColor = Colors.black,
  });

  final String text;
  final hoverColor;
  final textStyle;
  final String imageUrl;
  final String navUrl;
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
    return GestureDetector(
      onTap: () => navigate(widget.navUrl),
      child: MouseRegion(
        onEnter: onEnterCallback,
        onExit: onExitCallback,
        child: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 150),
                  opacity: hovering ? hoverOpacity : 0.0,
                  child: Container(
                    color: Colors.black,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.text,
                        style: Theme.of(context).textTheme.title.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
