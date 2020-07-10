import 'package:flutter/material.dart';
import 'package:news_mobile_application/screens/home_screen.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
//some essential methods for this class ua amer
  Widget _CardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Christina Meyers'),
              SizedBox(
                height: 8,
              ),
              Text("Fri, Mars 2020 "),
            ],
          ),
        ),
        Text("@gmail.com ")
      ],
    );
  }

  Widget _CardBody() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "mohamed amer mohamed amermohamed amermohamed amermohamed amermohamed amermohamed amer",style: TextStyle(
                fontSize:15,letterSpacing: 1.5,height: 1.25,color: Colors.grey.shade900
              ),),
            )),
      ],
    );
  }

  Widget _CardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.repeat,size: 28,),
              color: Colors.deepOrange,
              onPressed: () {},
            ),
            Text("25",style: TextStyle(fontSize: 16),),
          ],
        ),
        Row(
          children: <Widget>[
            Text("Check",style:TextStyle(color: Colors.orange)),
            SizedBox(width:16,),
            Text("Update",style:TextStyle(color: Colors.orange)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "twitter Feed",
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print("what is the coming");
            },
          ),
          _drawMenu() ,
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 8,bottom: 8),
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              children: <Widget>[
                _CardHeader(),
                _CardBody(),
                _drawLine() ,
                _CardFooter(),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }

Widget _drawLine(){
    return Container(
      width: double.infinity,
      height: 1,
margin: EdgeInsets.only(top: 16,bottom:4),
      color: Colors.grey.shade400,
    );
}

 Widget _drawMenu (){
    return PopupMenuButton<mohamed>(itemBuilder: (context){
      return[
        PopupMenuItem<mohamed>(
        value:mohamed.About,
        child:Text("what about"),
      ),
        PopupMenuItem<mohamed>(
          value:mohamed.About,
          child:Text("what about"),
        ),PopupMenuItem<mohamed>(
          value:mohamed.About,
          child:Text("what about"),
        ),
      ] ;
    },color: Colors.teal,
    ) ;

 }


  }



//so we have to create some functions to use it inside our cards ua NavigatorUserMediaError
 //the end of the class ya amer problem solved
