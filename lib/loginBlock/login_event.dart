import 'package:flutter/cupertino.dart';
import 'package:todo_architech/Screeens/Login.dart';

abstract class loginEvent {}

class reinitlogin extends loginEvent{

}

class onLoginClicked extends loginEvent{
  String username;
  String email;
  String pswd;
  onLoginClicked(this.username,this.email, this.pswd);
}

class createuser extends loginEvent{
  String username;
  String email;
  String pswd;
  createuser(this.username,this.email, this.pswd);
}