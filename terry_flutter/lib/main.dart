import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terry_flutter/utils.dart';

import 'HrefText.dart';
import 'ImageTile.dart';

void main() => runApp(PortfolioApp());

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme(
      title: GoogleFonts.workSans(
        textStyle: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: GoogleFonts.workSans(
        textStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body1: GoogleFonts.workSans(
        textStyle: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
    return MaterialApp(
      title: 'Taken By Terry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: textTheme,
      ),
      home: HomePage(title: 'Terry Manzi'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  final List<String> sideImagePath = [
    "assets/side_1.jpg",
    "assets/side_2.jpg",
    "assets/side_3.jpg",
    "assets/side_4.jpg",
  ];
  final List<String> sideImageURLs = [
    "",
    "",
    "",
    "",
  ];
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
      ),
    );
    if (getScreenSize(context) == ScreenSize.small) {
      return Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Sidebar(title),
            ],
          ),
        ),
        appBar: appbar,
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: RollingJumbotron(),
              ),
            ],
          ),
        ),
      );
    } else if (getScreenSize(context) == ScreenSize.medium) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar,
        body: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: RollingJumbotron(),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemBuilder: buildTiles,
                  itemCount: sideImageURLs.length,
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Sidebar(title),
            ],
          ),
        ),
      );
    } else {
      //Return large or XL
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Sidebar(title),
              Expanded(
                flex: 3,
                child: RollingJumbotron(),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemBuilder: buildTiles,
                  itemCount: sideImageURLs.length,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget buildTiles(BuildContext context, int item) {
    return ImageTile(
      "View Album",
      sideImagePath[item],
      sideImageURLs[item],
    );
  }
}

class RollingJumbotron extends StatefulWidget {
  @override
  _RollingJumbotronState createState() => _RollingJumbotronState();
}

class _RollingJumbotronState extends State<RollingJumbotron> {
  List<Image> images = List();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "assets/main_1",
        fit: BoxFit.cover,
        height: double.infinity,
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  final String title;

  Sidebar(this.title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 270),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: ActiveHref(
                    title,
                    "https://terrymanzi.me/Assets/KyrelJeromeResume.pdf",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ActiveHref(
                        "Photographer",
                        "https://flic.kr/s/aHsmKizHYo",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      ActiveHref(
                        "Film-maker",
                        "https://www.youtube.com/playlist?list=PL3sj-yrxWlPd2ZYIjY5qppwMzhdMWYEng",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      ActiveHref(
                        "Graphic Editor",
                        "https://flic.kr/s/aHsmKqpnPz",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Currently in",
                        style: Theme.of(context).textTheme.body1,
                      ),
                      Text(
                        "London,",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Text(
                        "Ontario",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              // Use the FontAwesomeIcons class for the IconData
                              icon: new Icon(FontAwesomeIcons.instagram),
                              iconSize: 50,
                              onPressed: () {
                                navigate(
                                    "https://www.instagram.com/takenbyterry/");
                              },
                            ),
                            IconButton(
                              // Use the FontAwesomeIcons class for the IconData
                              icon: new Icon(FontAwesomeIcons.youtube),
                              iconSize: 50,
                              onPressed: () {
                                navigate(
                                    "https://www.youtube.com/user/fewcrank");
                              },
                            ),
                            IconButton(
                              // Use the FontAwesomeIcons class for the IconData
                              icon: new Icon(FontAwesomeIcons.envelope),
                              iconSize: 50,
                              onPressed: () {
                                navigate("mailto:terrymanzi@yahoo.com");
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/profile.jpg"),
                              minRadius: 45,
                              maxRadius: 75,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      flex: 1,
    );
  }
}
