import 'package:flutter/material.dart';
class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {

  TextStyle _HashTagStyle=TextStyle(color: Colors.orange);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "Instagram Feed",
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
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 8,bottom: 8),
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _CardHeader(),
                _CardBody(),
                _drawHashTags() ,
                _drawImage(),
               // _drawLine() ,
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

  Widget _CardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       Row(
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
         ],
       ),
        IconButton(icon: Icon(Icons.favorite,),color:Colors.grey,onPressed: (){},),

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
                "some idioms and podiums up to speed , take something to conclusions   ",style: TextStyle(
                  fontSize:15,letterSpacing: 1.5,height: 1.25,color: Colors.grey.shade900
              ),),
            )),
      ],
    );
  }

  Widget _drawHashTags(){
    return Container(
      child: Wrap(
      children: <Widget>[
        FlatButton(onPressed: (){},child: Text("#Advanced",style: _HashTagStyle,),),
        FlatButton(onPressed: (){},child: Text("#Advanced",style: _HashTagStyle,),)
      ],
      ),
    );
  }
  Widget _CardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(child: Text("commits",style:TextStyle(color: Colors.orange),),onPressed:(){}),
        FlatButton(child: Text("SHARE",style:TextStyle(color: Colors.orange)),onPressed:(){}),
        FlatButton(child: Text("OPEN",style:TextStyle(color: Colors.orange)),onPressed:(){}),
      ],
    );
  }

//this is just a method ua amer
  Widget _drawImage(){
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.15,
      child: Image(
        image: ExactAssetImage('assets/images/bg3.png',),
        fit: BoxFit.cover,
      ),
    );
  }


}
