import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_application/post_api_folder/post_model.dart';

// ignore: must_be_immutable
class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Amer"),
            centerTitle: true,
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.post.featured_image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, position) {
          if (position == 0) {
            return Container(
              color: Colors.purple,
              height: 50,
            );
          } else {
            return Container(
              color: Colors.yellow.shade900,
              height: 50,
            );
          }
        }, childCount: 20),
      )
    ]);
  }
}
/*
* CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300.0,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              background: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.post.featured_image),
                  fit: BoxFit.cover),
            ),
            child: Text(
              "What is the coming ua_amer",
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.red),
            ),
          )),
        ),
        // SliverToBoxAdapter(),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              height: 400,
              width: 400,
              color: Colors.lightBlue,
            );
          },),
        ),
        // SliverGrid()
      ],
    );*/
