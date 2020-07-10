import 'package:flutter/material.dart';
import 'package:news_mobile_application/screens/home_tabs/favourited.dart';
import 'package:news_mobile_application/screens/home_tabs/popular.dart';
import 'package:news_mobile_application/screens/home_tabs/whats_new.dart';
import 'package:news_mobile_application/shared_ui/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//this should be out of the class ua amer problem solved
enum mohamed { help, Setting, About, Find, CONTACT }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController
  _tabController; //note that this should be used as a property to be seen for all methods
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          "Home",
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('go one');
            },
          ),
          _DrawPopOut(),
        ],
        bottom: TabBar(
          indicatorColor: Colors.black,
          //this is the scrolling tab we have there
          //isScrollable: false,
          tabs: [
            Tab(
              child: Text("WHAT'S NEW"),
              //text: "What's New",
            ),
            Tab(
              child: Text('POPULAR'),
            ),
            Tab(
              child: Text('FAVOURITED'),
            )
          ],
          controller: _tabController,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: <Widget>[
            WhatsNew(),
            Popular(),
            Favourites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _DrawPopOut() {
    return PopupMenuButton<mohamed>(itemBuilder: (context) {
      return [
        PopupMenuItem<mohamed>(
          value: mohamed.About,
          child: Text("ABOUT "),
        ),
        PopupMenuItem<mohamed>(
          value: mohamed.Setting,
          child: Text("SETTING"),
        ),
        PopupMenuItem<mohamed>(
          value: mohamed.CONTACT,
          child: Text("CONTACT"),
        ),
        PopupMenuItem<mohamed>(
          value: mohamed.Find,
          child: Text("FIND"),

        ),
        PopupMenuItem<mohamed>(
          value: mohamed.help,
          child: Text("HELP"),
        ),
      ];
    },
      onSelected: (mohamed menu) {},
      icon: Icon(Icons.more_vert),
    );
  }


}

