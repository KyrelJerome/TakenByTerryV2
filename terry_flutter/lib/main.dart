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
    "assets/images/side_1.jpg",
    "assets/images/side_2.jpg",
    "assets/images/side_3.jpg",
    "assets/images/side_4.jpg",
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
        body: ListView.builder(
          itemBuilder: buildSmallTile,
          itemCount: sideImageURLs.length + 1,
        ),
      );
    } else if (getScreenSize(context) == ScreenSize.medium) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar,
        body: ListView.builder(
          itemBuilder: buildMediumTile,
          itemCount: sideImageURLs.length + 1,
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
                  itemBuilder: buildLargeTile,
                  itemCount: sideImageURLs.length,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget buildSmallTile(BuildContext context, int item) {
    item = item - 1;
    if (item == -1) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 32,
        child: Stack(
          children: <Widget>[
            RollingJumbotron(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Icon(Icons.arrow_downward, size: 32),
            ),
          ],
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 250,
      child: ImageTile(
        "View Album",
        sideImagePath[item],
        sideImageURLs[item],
      ),
    );
  }

  Widget buildMediumTile(BuildContext context, int item) {
    item = item - 1;
    if (item == -1) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 32,
        child: RollingJumbotron(),
      );
    }
    return Container(
      width: double.infinity,
      height: 350,
      child: ImageTile(
        "View Album",
        sideImagePath[item],
        sideImageURLs[item],
      ),
    );
  }

  Widget buildLargeTile(BuildContext context, int item) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      child: ImageTile(
        "View Album",
        sideImagePath[item],
        sideImageURLs[item],
      ),
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
      child: Image.asset(
        "assets/images/main_1.jpg",
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
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
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
