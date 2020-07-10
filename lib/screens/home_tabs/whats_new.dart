import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        _drawerHeader(context),
        _drawerTopStories(context),
      ]),
    );
  }

  Widget _drawerTopStories(BuildContext context) {
    return Container(
      //color: Colors.amber,
      color: Color(0xfafa),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 2.0,
      // height: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: _drawSectionTopTitle("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: <Widget>[
                  _drawSingleRow(),
                  _draweDivider(),
                  _drawSingleRow(),
                  _draweDivider(),
                  _drawSingleRow(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2),
            child: _drawSectionTopTitle('Recent Updates'),
          ),
          Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  _drawRecentUpdatesCard(Colors.amber),
                  _drawRecentUpdatesCard(Colors.deepPurple),
                ],
              )),
        ],
      ),

      //color:Color(0xfafa),
    );
  }

  Widget _drawRecentUpdatesCard(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/bg6.png'),
                    fit: BoxFit.cover),
              ),
              height: MediaQuery.of(context).size.height * 0.20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 4, left: 0, right: 16),
            padding: EdgeInsets.only(left: 32, top: 4, bottom: 4, right: 32),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'SPORT',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0,right: 8,top: 8,bottom: 8),
            child: Text(
              "i don't know this is not the end of the game ya amer and i will kill you soon",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.timer),
              SizedBox(width:8,),
              Text('15 min',style: TextStyle(fontSize: 16),),
          ],)
        ],
      ),
    );
  }

  Text _drawSectionTopTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _draweDivider() {
    return Divider(
      height: 0,
      color: Colors.grey.shade800,
      thickness: 0.5,
    );
  }

  Padding _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
              width: 125,
              height: 125,
              child: Image(
                image: ExactAssetImage('assets/images/bg6.png'),
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  'The World global Warming Annual Summit',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Transform.translate(
                  offset: Offset(0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Mohamed Alaa'),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text('15 min'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _drawerHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/bg7.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Text(
              "This is S21 project,That is awesome",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 45),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
              child: Text(
                "This is the content of the page and we get the s21 project leader",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
} //end of the method
