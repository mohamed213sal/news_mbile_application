import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> myColors = [
    Colors.amber,
    Colors.lightGreen,
    Colors.teal,
    Colors.deepOrangeAccent,
    Colors.deepPurple,
    Colors.teal,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigoAccent,
    Colors.teal,
    Colors.amber,
    Colors.black87,
  ];

  Color _getRandomColor() {
    Random randomNumber = Random();
    return myColors[randomNumber.nextInt(myColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return (Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _AuthorRow(_getRandomColor()),
                SizedBox(
                  height: 10,
                ),
                _NewsRow(),
              ],
            ),
          ),
        ));
      },
      itemCount: 40,
    );
  }

  Widget _AuthorRow(Color color) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/bg3.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Mohamed amer",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '15 min.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'lifeStyle',
                      style: TextStyle(color: color),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: () {
            print('this is the bookmark icon ya amer ');
          },
          color: Colors.grey,
        ),
      ],
    ));
  }

  Widget _NewsRow() {
    return (Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/bg6.png'),
                fit: BoxFit.cover),
            shape: BoxShape.rectangle,
          ),
          height: 100,
          width: 100,
          margin: EdgeInsets.only(right:16),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'What is the coming next ya potter future is very bad ya amer',
                style: TextStyle(color: Colors.black87, fontSize: 18,fontWeight: FontWeight.bold),
              ),
              Text('text content ya amer text content ya amer text content ya amer text content ya amer text content ya amer text content ya amer text content ya amer ',style:
              TextStyle(color: Colors.grey,height: 1.5),),
            ],
          ),
        )
      ],
    ));
  }
}
