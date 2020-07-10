import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,position){
      return (Card(child: _drawSingleRow(),));
    },itemCount: 20,
    );
  }

//calling the method to draw the row ya amer solved
  Padding _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
              width: 125,
              height: 125,
              child: Image(
                image: ExactAssetImage('assets/images/bg3.png'),
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  'The World global Warming Annual Summit ',
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
}
