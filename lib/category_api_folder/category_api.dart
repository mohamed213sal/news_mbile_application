import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'category_model.dart';

class Categories {
  /*some properties needed for this class like URL and List for returned
  * comments*/
 //this  is the url for getting data from api
  List<CategoryModel> categoryList = []; //=====> hint each item of this list contains ===> id,title

/*some functions used for this class ua_amer*/
  Future<List<CategoryModel>> fetchingAllCategories() async {
    var coming_response = await http.get("http://10.0.2.2:8000/api/categories");
    if (coming_response.statusCode == 200) {
      var api_data_map = jsonDecode(coming_response.body);
      var api_map_values = api_data_map["data"];
      print(api_map_values);
      for (var item in api_map_values) {
        CategoryModel categoryModel = CategoryModel(
            id: item["id"].toString(), title: item["title"].toString());
        categoryList.add(categoryModel);
      }
      for (var item in categoryList) {
        //print(item.title);
        print(item.id);
      }
    }
/*the First method we have here will be used to get single item like id , name , title ..., from one row of our table ua amer */

    return categoryList;
  }
} //that is great ua_amer problem solved for now got talent
