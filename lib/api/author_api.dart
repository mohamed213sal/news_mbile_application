import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_mobile_application/utilities/api_utilities.dart';
import 'package:news_mobile_application/models/author.dart';

//==================very important file=====================

class AuthorApi {
  /*some functions needed here one of them is fetchAllAuthors
  * but this method needs model that represents the Author table with All
  * of its attributes ... so we have to make model for Author.... we have a lot of work ya amer this is awesome
  * fuck to android ua amer
  * */

  /* Look this method is running in another thread this is not running in the main thread
  * with UI thread which is responsible for drawing the main User interface
  * =========Brief==================
  * By using async with any function that is mean you are creating new thread
  * in the background ua_amer
  * In our case====>
  * now we have two Threads [1]==>for UI
  *                 Thread [2]===>for http response ua_amer
  *
  * ==============Future=================
  * when using Future keyword that's mean we don't know when the response
  * from the internet will come
  * */
  Future<List<Author>> fetchAllAuthor() async {
    List<Author> authors = [];
    String mohamedApi = baseApi + allAuthorsApi;
    String all_authors_api = "http://" + mohamedApi;
    /*===============using mohamedApi variable ==================
    * to make sure of using the above line use print(mohamedApi); to
    * understand the output and use it correctly */
    //but hint this route may changed in the future ua_amer
    var response = await http.get(all_authors_api);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      /*now we need to get the values of the Map because the returned
      * table content from the API is a Map===>and it contains key and
      * values ... so in our case the jsonData variable is a Map*/
      var data = jsonData["data"];
      /*and the data variable wil be an array====>but note that each item
      * in the data array will represent single user and every user=[name,email,....]*/
      for (var item in data) {
        Author author = Author(
          item["id"].toString(),
          item["name"].toString(),
          item["email"].toString(),
          item["avatar"].toString(),
        );
        authors.add(author);
      }
    }

    for (var item in authors) {
      print(item.email);
    }
    return authors;
  }
}
