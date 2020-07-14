import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_application/post_api_folder/post_api.dart';
import 'package:news_mobile_application/category_api_folder/category_api.dart';
import 'package:news_mobile_application/category_api_folder/category_model.dart';

import 'dart:async';

import 'package:news_mobile_application/post_api_folder/post_model.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostModel2 postModel = PostModel2(); //just creating an object of this class
 CategoryModel categoryModel=CategoryModel(); //hint we Must make the constructor optional and named by using {}
  Post post=Post();
  Categories categories=Categories(); //just taking an instance or an object of this class


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        _drawerHeader(context),
        _drawerTopStories(context),
        _drawRecentUpdate(context),
      ]),
    );
  }

  Widget _drawerTopStories(BuildContext context) {
    return Container(
      //color: Colors.amber,
      color: Color(0xfafa),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
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
              child:FutureBuilder(
                future:post.fetchingWhatsNew(),
                builder: (context,AsyncSnapshot snapShot) {
                  PostModel2 post1=snapShot.data[7];
                  PostModel2 post2=snapShot.data[4];
                  PostModel2 post3=snapShot.data[5];
                  return Column(
                    children: <Widget>[
                      _drawSingleRow(post1),
                      _draweDivider(),
                      _drawSingleRow(post2),
                      _draweDivider(),
                      _drawSingleRow(post3),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2),
            child: _drawSectionTopTitle('Recent Updates'),
          ),
        ],
      ),

      //color:Color(0xfafa),
    );
  }

  Padding _drawRecentUpdate(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            _drawRecentUpdatesCard(Colors.amber),
            _drawRecentUpdatesCard(Colors.deepPurple),
          ],
        ));
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
            padding:
                const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
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
              SizedBox(
                width: 8,
              ),
              Text(
                '15 min',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
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

  Padding _drawSingleRow(PostModel2 post) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
              width: 125,
              height: 125,
              child: Image.network(post.featured_image,fit: BoxFit.cover,),),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                 post.title,
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
