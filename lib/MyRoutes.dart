import 'package:flutter/material.dart';
import 'package:todo_architech/Screeens/AllTask.dart';
import 'package:todo_architech/Screeens/Login.dart';
import 'package:todo_architech/Screeens/createTask.dart';
import 'package:todo_architech/Screeens/taskScreen.dart';
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
        case "mytask":
        return MaterialPageRoute(
            builder: (context) => taskscreen());
        case "createtask":
        return MaterialPageRoute(
            builder: (context) => createtask());
      case "AllTask":
        return MaterialPageRoute(
            builder: (context) => showAllTask());
      default:
        return MaterialPageRoute(
            builder: (context) => MyHomePage(title: "new Home"));
    }
    }
}
