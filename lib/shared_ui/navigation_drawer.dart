import 'package:flutter/material.dart';
import 'package:news_mobile_application/models/nav_menu.dart';
import 'package:news_mobile_application/screens/home_screen.dart';
import 'package:news_mobile_application/screens/headline_news.dart';
import 'package:news_mobile_application/screens/twitter_feed.dart';
import 'package:news_mobile_application/screens/instagram_feed.dart';
import 'package:news_mobile_application/screens/facebook_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  //note that the state is just widget like other widgets ya amer
  //and our class is going to inherit from this widget in order to complete
  //the work of the previous screen or widget ua amer ...
  //and build method is coming from the State widget which contains
  //some additional properties to trace the old or previous widget
  List<String> NavMenu = [
    "Explore",
    "headLines News",
    "Twitter Feed",
    "videos",
    "Photos",
    "Settings",
    "Logout",
  ];

  //this for the items of list components ya amer { i mean when you press the tap where you want to go next this the question? payomy }
  List<NavMenuItem> navigationMenu = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("HeadLines", () => HeadLineNews()),
    NavMenuItem("Twitter feed", () => TwitterFeed()),
    NavMenuItem("Instagram feed", () => InstagramFeed()),
    NavMenuItem("Facebook feed", () => FaceBookFeed()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(top: 64, left: 16),
      child: ListView.builder(
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: (ListTile(
              title: Text(
                navigationMenu[position].title,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 22,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade700,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return navigationMenu[position].destination();
                }));
              },
            )),
          );
        },
        itemCount: navigationMenu.length,
      ),
    ));
  }
}

//that is awesome ya amer problem solved ua amer this is easy to draw your interface ua amer
