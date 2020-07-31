import 'package:flutter/material.dart';

Widget noConnection(var none) {
  return Container(
    width: 200,
    height: 200,
    child: Center(
        child: Text(
          none.toString(),
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        )),
  );
}

Widget error(var error) {
  return Container(
    height: 200,
    width: 200,
    child: Center(
      child: Text(
        error.toString(),
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget noData() {
  return Container(
    height: 100,
    width: 100,
    child: Center(
      child: Text(
        "No Data Available",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.only(top: 16, bottom: 16),
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.yellow,
      ),
    ),
  );
}