import 'package:flutter/material.dart';
import 'package:news_mobile_application/post_api_folder/post_api.dart';
import 'package:news_mobile_application/utilities/data_utilities.dart';
import 'dart:async';
import 'package:news_mobile_application/post_api_folder/post_model.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostApi postApi = PostApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postApi.fetchPopular(),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return loading();
          case ConnectionState.none:
            return noConnection("Connection Failed ua_amer");
          case ConnectionState.active:
            return loading();
          case ConnectionState.done:
            if (snapShot.hasError) {
              //TO HANDLE THIS ERROR UA_AMER
              return error("Error happened here ua_amer ");
            } else if (snapShot.hasData) {
              List<Post> post = snapShot.data;
              return (ListView.builder(
                itemBuilder: (context, position) {
                  return (Card(
                    child: _drawSingleRow(post[position]),
                  ));
                },
                itemCount: post.length,
              ));
            }
        }
      return null;
      },
    );
  }

//calling the method to draw the row ya amer solved
  Padding _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 125,
            height: 125,
            child:Image.network(post.featured_image),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  post.content,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Transform.translate(
                  offset: Offset(0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(post.id),
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
}
