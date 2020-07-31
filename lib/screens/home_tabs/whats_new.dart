import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_application/models/author.dart';
import 'dart:math';
import 'package:news_mobile_application/post_api_folder/post_api.dart';
import 'package:news_mobile_application/category_api_folder/category_api.dart';
import 'package:news_mobile_application/category_api_folder/category_model.dart';
import 'dart:async';
import 'package:news_mobile_application/utilities/data_utilities.dart';
import 'package:news_mobile_application/screens/home_tabs/single_post.dart';
import 'package:news_mobile_application/post_api_folder/post_model.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  Random _randomIndex = Random();
  CategoryModel categoryModel =
      CategoryModel(); //hint we Must make the constructor optional and named by using {}
  Categories categories =
      Categories(); //just taking an instance or an object of this class
  PostApi postApi = PostApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        _drawHeader(context),
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
                child: FutureBuilder(
              future: postApi.fetchWhatsNew(),
              // ignore: missing_return
              builder: (context, AsyncSnapshot SnapShot) {
                switch (SnapShot.connectionState) {
                  case ConnectionState.none:
                    return noConnection("Connection Failed");
                  case ConnectionState.active:
                    return loading();
                  case ConnectionState.waiting:
                    return loading();
                  // TO DO HANDLE THE NONE RETURNING DATA OR RESPONSE
                  case ConnectionState.done:
                    if (SnapShot.error != null) {
                      return error(
                          " Error Cannot Connect To Server"); // TO HANDLE THE ERROR
                    } else {
                      // that is mean that every thing is going well ua_amer ,solved
                      if (SnapShot.hasData) {
                        List<Post> post = SnapShot.data;
                        if (post.length >= 3) {
                          Post post1 = SnapShot.data[0];
                          Post post2 = SnapShot.data[2];
                          Post post3 = SnapShot.data[0];
                          return Column(
                            children: <Widget>[
                              _drawSingleRow(post1),
                              _draweDivider(),
                              _drawSingleRow(post2),
                              _draweDivider(),
                              _drawSingleRow(post3),
                            ],
                          );
                        } else if (post.length == 0) {
                          return noData();
                        }
                      } else {
                        return noData(); //TO HANDLE SOME ERROR ON DATA
                      }
                    }
                }
              },
            )),
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
        child: FutureBuilder(
          future: postApi.fetchRecentUpdate(),
          builder: (context, AsyncSnapshot snapShot) {
            switch (snapShot.connectionState) {
              case ConnectionState.waiting:
                return loading();
              case ConnectionState.active:
                return loading();
              case ConnectionState.none:
                return noConnection("Connection Not Found ");
              case ConnectionState.done:
                if (snapShot.error != null) {
                  return error("Error Found UA_Amer");
                } else if (snapShot.hasData) {
                  List<Post> post = snapShot.data;
                  if (post.length >= 2) {
                    Post post1 = snapShot.data[2];
                    Post post2 = snapShot.data[0];
                    return Column(
                      children: <Widget>[
                        _drawRecentUpdatesCard(Colors.amber, post1),
                        _drawRecentUpdatesCard(Colors.deepPurple, post2),
                      ],
                    );
                  }
                } else {
                  return error("Error Found");
                }
              // ignore: missing_return

            }
            return null;
          },
        ));
  }

  Widget _drawRecentUpdatesCard(Color color, Post post) {
    return Card(
      child: InkWell(
        onLongPress: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SinglePost(post);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
                child: Image.network(post.featured_image, fit: BoxFit.cover),
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
                post.title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
              child: Text(
                post.content,
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
                  post.date_written,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
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

  Padding _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SinglePost(post);
          }));
        },
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 125,
              height: 125,
              child: Image.network(
                post.featured_image,
                fit: BoxFit.cover,
              ),
            ),
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
                        Text(post.date_written.toString()),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.timer),
                            Text("15 Mins"),
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
      ),
    );
  }

  Widget _drawHeader(BuildContext context) {
    return FutureBuilder(
        future: postApi.fetchPostsByCategories(),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.active:
              return loading();
            case ConnectionState.waiting:
              return loading();
            case ConnectionState.none:
              return noData();
            case ConnectionState.done:
              if (snapShot.hasError) {
                return error(
                    "we Found some error while Loading these Information");
              } else if (snapShot.hasData){
                List<Post> posts = snapShot.data;
                Random random = Random();
                int randIndex = random.nextInt(posts.length);
                Post post = posts[randIndex];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SinglePost(post);
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(post.featured_image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100),
                          child: Expanded(
                            child: Text(
                              post.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, 45),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16, right: 8, left: 8),
                            child: Expanded(
                              child: Text(
                                post.content,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          }
          return Text("error");
        });
  }
} //end of the method

/*
*
*
* Container(
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
    );*/
