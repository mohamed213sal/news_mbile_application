import 'package:flutter/material.dart';
import 'package:news_mobile_application/onBoardingModule.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'home_screen.dart';

class OnBoardingPages extends StatefulWidget {
  @override
  _OnBoardingPagesState createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  //some properties for this class (properties section )-----------------------------------
  List<PageModule> pages = List<PageModule>();
  ValueNotifier<int> mohamed = ValueNotifier(0);
  List<Widget> ComingWidgets;

  //some methods that we need for this class ya amer
  void _add_pages() {
    //note that method is used to fill the content of the list ya amer
    pages = [
      PageModule(
        'welcome number six',
        'making friends is easy as waving your hand forth and back',
        Icons.add,
        "assets/images/bg1.png",
      ),
      PageModule(
        'welcome two',
        ' do not be here ya amer solved making friends is easy as waving your hand forth and back',
        Icons.account_balance,
        "assets/images/bg2.png",
      ),
      PageModule(
        'welcome three',
        'making friends is easy as waving your hand forth and back',
        Icons.menu,
        "assets/images/bg3.png",
      ),
      PageModule(
        ' S21 with you ',
        'making friends is easy as waving your hand forth and back',
        Icons.translate,
        "assets/images/bg4.png",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //just calling the function for setting constructors of the class

    ComingWidgets = List<Widget>();
    _add_pages();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView.builder(
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(pages[index].images),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Transform.translate(
                      child: Icon(
                        pages[index].icons,
                        color: Colors.white,
                        size: 150,
                      ),
                      offset: Offset(0, -50),
                    ),
                    Text(
                      pages[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 48, left: 48, top: 18),
                      child: Text(
                        pages[index].description,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            );
          },
          itemCount: pages.length,
          onPageChanged: (index) {
            mohamed.value = index;
          },
        ),
        Center(
          child: Transform.translate(
              offset: Offset(0, 140),
              child: _displayPageIndicators(pages.length)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red.shade800,
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _displayPageIndicators(int length) {
    //this is the ready plugin used from the internet to shorten our work ya amer
    return PageViewIndicator(
      pageIndexNotifier: mohamed,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

//creating method to connect pages with circles
  pageIndicatorMohamed(Color color) {
    List<Container> widgets = List<Container>();
    for (int i = 0; i < pages.length; i++) {
      //_drawerCircle(Colors.amberAccent);
      widgets.add(_drawerCircle(color));
    }
    return widgets;
  }

  _drawerCircle(Color myColor) {
    return Container(
      width: 15,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, color: myColor),
    );
  }
}
