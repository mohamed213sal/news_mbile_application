import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_application/screens/home_tabs/favourited.dart';
import 'package:news_mobile_application/screens/home_tabs/popular.dart';
import 'package:news_mobile_application/screens/home_tabs/whats_new.dart';
import 'package:news_mobile_application/shared_ui/navigation_drawer.dart';
import 'package:news_mobile_application/category_api_folder/category_api.dart';
import 'package:news_mobile_application/api/author_api.dart';
import 'package:news_mobile_application/post_api_folder/post_api.dart';
import 'package:news_mobile_application/screens/home_tabs/menu_pages/about.dart';
import 'package:news_mobile_application/screens/home_tabs/menu_pages/settings.dart';
import 'package:news_mobile_application/screens/home_tabs/menu_pages/help.dart';
import 'package:news_mobile_application/screens/home_tabs/menu_pages/contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//this should be out of the class ua amer problem solved
enum mohamed { Help, Setting, About, Contact }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  /*====class objects for test only ====== */
  //AuthorApi mohamed_api=AuthorApi();
  //Categories category=Categories();
  //Post post=Post();

  //note that this should be used as a property to be seen for all methods
  TabController _tabController;

  /*class methods needed*/
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
    // ====calling methods for testing not more =======
    //mohamed_api.fetchAllAuthor();
    //category.fetchingAllCategories();
    //post.fetchingWhatsNew() ;

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
          _drawPopOut(),
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

  Widget _drawPopOut() {
    return PopupMenuButton<mohamed>(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(10))),
      elevation: 10,
      color: Colors.deepOrangeAccent,
      itemBuilder: (context) {
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
            value: mohamed.Contact,
            child: Text("CONTACT"),
          ),
          PopupMenuItem<mohamed>(
            value: mohamed.Help,
            child: Text("HELP"),
          ),
        ];
      },
      onSelected: (mohamed menu) {
        // ignore: missing_return
        switch (menu) {
          case mohamed.About:
            return Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return About();
            }));
          case mohamed.Help:
            return Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return Help();
            }));
          case mohamed.Contact:
            return Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return Contact();
            }));
          case mohamed.Setting:
            return Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return Settings();
            }));
        }
        return null;
      },
      icon: Icon(Icons.more_vert),
    );
  }

  Widget _drawMenu() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "Mohamed",
            child: Text("mohamed"),
          ),
          PopupMenuItem(value: "Mohamed", child: Text("mohamed")),
          PopupMenuItem(value: "Mohamed", child: Text("mohamed")),
        ];
      },
      onSelected: (context) {
        print("This is not great idea ua_amer");
      },
    );
  }
}
