import 'package:flutter/material.dart';
import 'package:todo_architech/Login.dart';
import 'package:todo_architech/main.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name) {
      case "/":
    return MaterialPageRoute(
        builder: (context) => MyHomePage(title: "new Home"));
      case "login":
        return MaterialPageRoute(
            builder: (context) => login());
      default:
        return MaterialPageRoute(
            builder: (context) => MyHomePage(title: "new Home"));
    }
    }
}
