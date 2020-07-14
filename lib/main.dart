import 'package:flutter/material.dart';
import 'package:news_mobile_application/screens/home_screen.dart';
import 'package:news_mobile_application/screens/onBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:news_mobile_application/utilities/app_theme.dart';
import 'package:news_mobile_application/screens/onBoarding.dart';
import 'package:news_mobile_application/utilities/app_theme.dart';
main() {
runApp(NewsApp());
}

class NewsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:OnBoardingPages(),
      theme: AppTheme.appTheme,
    );
  }

}


/*
async {
SharedPreferences helper = await SharedPreferences.getInstance();
bool seenWidget = helper.getBool('done');
Widget userWidget=OnBoardingPages();


 */