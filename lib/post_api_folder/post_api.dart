import "dart:convert";
import 'package:http/http.dart' as http;
import 'post_utility.dart';
import 'post_model.dart';

class Post {
  /*some properties for this class ua_amer*/
  //String postUrl = base + postSecondPart;
  List<PostModel2> amerList = [];

/*
[
PostModel(this.title,this.id,this.content,this.date_written) ,
 PostModel(this.title,this.id,this.content,this.date_written) ,
 PostModel(this.title,this.id,this.content,this.date_written) ,]
*/

  /*some methods for this class like fetching some data from the api*/
  Future <List<PostModel2>>   fetchingWhatsNew() async {
    var whatsNewApi = await http.get("http://10.0.2.2:8000/posts/categories/10");
    if (whatsNewApi.statusCode == 200) {
      var response_map = jsonDecode(whatsNewApi.body);
      var api_data =
          response_map["data"]; //this will give us two dimensional array
      for (var item in api_data) {
        PostModel2 amer = PostModel2(
          id:item["id"].toString(),
          title:item["title"].toString(),
          content:item["content"].toString(),
          date_written:item["date_written"].toString(),
          featured_image:item["featured_image"].toString(),
          votesUp:item["votesUp"],
          votesDown:item["votesDown"],
          votersUp: (item["votersUp"]==null)? List<int>() :jsonDecode(item["votersUp"]) ,
          votersDown: (item["votersDown"]==null)? List<int>():jsonDecode(item["votersDown"]) ,
         userId: item["userId"].toString(),
          categoryId: item["categoryId"].toString(),
        );
        amerList.add(amer);
      }
    }
    for (var item in amerList) {
      print(item.title);
    }

return amerList;
  }
}
