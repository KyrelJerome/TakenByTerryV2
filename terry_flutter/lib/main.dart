import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terry_flutter/utils.dart';

import 'HrefText.dart';

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

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
      ),
    );
    if (getScreenSize(context) == ScreenSize.small) {
      return Scaffold(
        drawer: Drawer(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Sidebar(),
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
          child: Column(
            children: <Widget>[
              Expanded(
                child: RollingJumbotron(),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Sidebar(),
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
              Sidebar(),
              Expanded(
                flex: 3,
                child: RollingJumbotron(),
              ),
            ],
          ),
        ),
      );
    }
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
        "https://live.staticflickr.com/65535/47856049872_ac67730cdd_h.jpg",
        fit: BoxFit.cover,
        height: double.infinity,
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 288),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: ActiveHref(
                    "Terry Manzi",
                    "https://kyreljero.me/Assets/KyrelJeromeResume.pdf",
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
                        style: Theme.of(context).textTheme.title,
                      ),
                      ActiveHref(
                        "Film-maker",
                        "https://www.youtube.com/playlist?list=PL3sj-yrxWlPd2ZYIjY5qppwMzhdMWYEng",
                        style: Theme.of(context).textTheme.title,
                      ),
                      ActiveHref(
                        "Graphic Editor",
                        "https://www.youtube.ca",
                        style: Theme.of(context).textTheme.title,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Currently in"),
                      Text(
                        "London,",
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        "Ontario",
                        style: Theme.of(context).textTheme.title,
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
