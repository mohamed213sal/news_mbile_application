import 'package:flutter/material.dart';
import 'package:news_mobile_application/screens/home_screen.dart';
import 'package:news_mobile_application/screens/home_tabs/popular.dart';

import 'home_tabs/favourited.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          "HeadLine News",
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('go one');
            },
          ),
          _buildDrawMenu(),
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
            Favourites(),
            Popular(),
            Favourites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  _buildDrawMenu() {
    return PopupMenuButton<mohamed>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<mohamed>(
            value: mohamed.Find,
            child: Text("find"),
          ),
          PopupMenuItem<mohamed>(
            value: mohamed.help,
            child: Text("help"),
          ),
          PopupMenuItem<mohamed>(
            value: mohamed.CONTACT,
            child: Text("Contact"),
          )
        ];
      },
      onSelected: (mohamed) {
        print("what is the fack");
      },
      icon: Icon(Icons.more_vert),
      //initialValue:mohamed.CONTACT,
      color: Colors.yellow,
    );
  }
}
