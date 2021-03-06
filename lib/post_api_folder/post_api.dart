import 'dart:convert';
import "package:news_mobile_application/post_api_folder/post_model.dart";
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
class PostApi {
  //we need to create list of post_model to fill that will represent single row ... then we will fill it by using constructor
  List<Post> postList = [];

  Future<List<Post>> fetchWhatsNew() async {
    var whats_new_response = await http.get("http://10.0.2.2:8000/api/posts");
 //var recent_updates_api=await http.get("http://10.0.2.2:8000/api/posts/categories/2");
    if (whats_new_response.statusCode == 200) {
      var jsonData = jsonDecode(whats_new_response.body);
      var data = jsonData["data"]; //the var data will be  an array ua_amer
      for (var item in data) {
        print(item["title"]);
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          date_written: item["date_written"].toString(),
          featured_image: item["featured_image"].toString(),
          votesUp: item["votesUp"],
          votesDown: item["votesDown"],
          votersUp: (item["votersUp"] == null) ? List<int>() : jsonDecode(item["votersUp"]),
          votersDown: (item["votersDown"] == null) ? List<int>() : jsonDecode(item["votersDown"]),
          userId: item["userId"].toString(),
          categoryId: item["categoryId"].toString(),
        );

        postList.add(post);
      }
    }
    return postList;
    //return [];
  }

  Future<List<Post>> fetchRecentUpdate() async {
    //var whats_new_response = await http.get("http://10.0.2.2:8000/api/posts");
    var recent_updates_api=await http.get("http://10.0.2.2:8000/api/posts/categories/2");
    if (recent_updates_api.statusCode == 200) {
      var jsonData = jsonDecode(recent_updates_api.body);
      var data = jsonData["data"]; //the var data will be  an array ua_amer
      for (var item in data) {
        print(item["title"]);
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          date_written: item["date_written"].toString(),
          featured_image: item["featured_image"].toString(),
          votesUp: item["votesUp"],
          votesDown: item["votesDown"],
          votersUp: (item["votersUp"] == null) ? List<int>() : jsonDecode(item["votersUp"]),
          votersDown: (item["votersDown"] == null) ? List<int>() : jsonDecode(item["votersDown"]),
          userId: item["userId"].toString(),
          categoryId: item["categoryId"].toString(),
        );

        postList.add(post);
      }
    }
    return postList;
    //return [];
  }
  Future<List<Post>> fetchPopular() async {
    //var whats_new_response = await http.get("http://10.0.2.2:8000/api/posts");
//    var recent_updates_api=await http.get("http://10.0.2.2:8000/api/posts/categories/2");
    var popular_post_api=await http.get("http://10.0.2.2:8000/api/posts/categories/3");

    if (popular_post_api.statusCode == 200) {
      var jsonData = jsonDecode(popular_post_api.body);
      var data = jsonData["data"]; //the var data will be  an array ua_amer
      for (var item in data) {
        print(item["title"]);
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          date_written: item["date_written"].toString(),
          featured_image: item["featured_image"].toString(),
          votesUp: item["votesUp"],
          votesDown: item["votesDown"],
          votersUp: (item["votersUp"] == null) ? List<int>() : jsonDecode(item["votersUp"]),
          votersDown: (item["votersDown"] == null) ? List<int>() : jsonDecode(item["votersDown"]),
          userId: item["userId"].toString(),
          categoryId: item["categoryId"].toString(),
        );

        postList.add(post);
      }
    }
    return postList;
    //return [];
  }

  Future<List<Post>> fetchPostsByCategories() async {
    //var whats_new_response = await http.get("http://10.0.2.2:8000/api/posts");
//    var recent_updates_api=await http.get("http://10.0.2.2:8000/api/posts/categories/2");
    var popular_post_api=await http.get("http://10.0.2.2:8000/api/posts/categories/4");

    if (popular_post_api.statusCode == 200) {
      var jsonData = jsonDecode(popular_post_api.body);
      var data = jsonData["data"]; //the var data will be  an array ua_amer
      for (var item in data) {
        print(item["title"]);
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          date_written: item["date_written"].toString(),
          featured_image: item["featured_image"].toString(),
          votesUp: item["votesUp"],
          votesDown: item["votesDown"],
          votersUp: (item["votersUp"] == null) ? List<int>() : jsonDecode(item["votersUp"]),
          votersDown: (item["votersDown"] == null) ? List<int>() : jsonDecode(item["votersDown"]),
          userId: item["userId"].toString(),
          categoryId: item["categoryId"].toString(),
        );

        postList.add(post);
      }
    }
    return postList;
    //return [];
  }
}
