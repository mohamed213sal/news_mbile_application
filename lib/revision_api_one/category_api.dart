import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as moh_http;
import 'dart:convert';
import 'category_utility.dart';
import 'category_model.dart';

class Categories {
  /*some properties needed for this class like URL and List for returned
  * comments*/
  String categoryU = base + categoryPart;
  String category_link = "http://10.0.2.2:8000/api/categories";

  List<CategoryModel> categList = [];

  /*some functions used for this class ua_amer*/

  /*the First method we have here will be used to get single item like id , name , title ..., from one row of our table ua amer */

  fetchingAllCategories() async {
    var response = await moh_http.get(categoryU);
    var jsonData = json.decode(response.body);
    var values = jsonData["data"];
    if (response.statusCode == 200) {
      for (var item in values) {
        CategoryModel categoryModel = CategoryModel(
          item["title"].toString(),
        );
        categList.add(categoryModel);
      }
    }
  for (var item in categList){
  print(item.title);
}

  }
}
