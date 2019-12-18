import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terry_flutter/utils.dart';

void main() => runApp(PortfolioApp());

class PortfolioApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taken By Terry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
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
        ),
      ),
      home: HomePage(title: 'Taken By Terry'),
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
    if (getScreenSize(context) == ScreenSize.small) {
    } else if (getScreenSize(context) == ScreenSize.medium) {
    } else {
      //Return large or XL
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              LargeSidebar(),
              Expanded(
                flex: 3,
                child: Container(
                  child: Image.network(
                      "https://live.staticflickr.com/65535/47856049872_ac67730cdd_h.jpg",
                      fit: BoxFit.cover,
                      height: double.infinity),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

class LargeSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child:
                  Text("Terry Manzi", style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Photographer",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    "Film-Maker",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    "Graphic Editor",
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
            ),
            Expanded(
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
            Expanded(
              child: Container(
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        IconButton(
                          // Use the FontAwesomeIcons class for the IconData
                          icon: new Icon(FontAwesomeIcons.instagram),
                          onPressed: () {
                            navigate("https://www.instagram.com/takenbyterry/");
                          },
                        ),
                        IconButton(
                          // Use the FontAwesomeIcons class for the IconData
                          icon: new Icon(FontAwesomeIcons.youtube),
                          onPressed: () {
                            navigate("Pressed");
                          },
                        ),
                        IconButton(
                          // Use the FontAwesomeIcons class for the IconData
                          icon: new Icon(FontAwesomeIcons.envelope),
                          onPressed: () {
                            navigate("Pressed");
                          },
                        ),
                      ],
                    )),
                    Expanded(child: CircleAvatar(child: FlutterLogo()))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      flex: 1,
    );
  }
}
