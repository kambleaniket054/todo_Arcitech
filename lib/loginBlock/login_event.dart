import 'package:flutter/cupertino.dart';
import 'package:todo_architech/Login.dart';

abstract class loginEvent {}

class onLoginClicked extends loginEvent{
  String username;
  String email;
  String pswd;
  onLoginClicked(this.username,this.email, this.pswd);
}