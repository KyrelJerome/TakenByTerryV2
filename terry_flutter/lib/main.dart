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

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainImagePath;
  List<String> sideImagePath = List();
  List<String> sideImageURLs = List();

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  void loadImages() async {
    dynamic sPath = await getSideImages();
    dynamic mPath = await getMainImage();
    dynamic sURLs = await getSideImageUrl();
    setState(() {
      sideImagePath = sPath;
      mainImagePath = mPath;
      sideImageURLs = sURLs;
    });
  }

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
        backgroundColor: Colors.black,
        drawer: Drawer(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Sidebar(widget.title),
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
              Sidebar(widget.title),
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
              Sidebar(widget.title),
              Expanded(
                flex: 3,
                child: RollingJumbotron(
                  imagePath: mainImagePath,
                ),
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
        height: MediaQuery.of(context).size.height - 40,
        child: Stack(
          children: <Widget>[
            RollingJumbotron(
              imagePath: mainImagePath,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.all(32),
                  child: Icon(Icons.arrow_downward,
                      color: Colors.white, size: 64)),
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
        color: Colors.black,
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 40,
        child: Stack(
          children: <Widget>[
            Center(
              child: RollingJumbotron(
                imagePath: mainImagePath,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.all(32),
                  child: Icon(Icons.arrow_downward,
                      color: Colors.white, size: 64)),
            ),
          ],
        ),
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
  const RollingJumbotron({Key key, this.imagePath}) : super(key: key);

  @override
  _RollingJumbotronState createState() => _RollingJumbotronState();
  final String imagePath;
}

class _RollingJumbotronState extends State<RollingJumbotron> {
  List<Image> images = List();
  @override
  Widget build(BuildContext context) {
    if (widget.imagePath == null) {
      return Container(height: double.infinity);
    }
    return Container(
      child: Image.asset(
        widget.imagePath,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ActiveHref(
                    title,
                    "https://terrymanzi.me/assets/Terry_Resume.pdf",
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
                  padding: EdgeInsets.only(bottom: 16),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                      minRadius: 45,
                      maxRadius: 75,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Icon(FontAwesomeIcons.instagram, size: 50),
                          onTap: () {
                            navigate("https://www.instagram.com/takenbyterry/");
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Icon(FontAwesomeIcons.youtube, size: 50),
                          onTap: () {
                            navigate("https://www.youtube.com/user/fewcrank");
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Icon(FontAwesomeIcons.envelope, size: 50),
                          onTap: () {
                            navigate("mailto:terrymanzi@yahoo.com");
                          },
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
