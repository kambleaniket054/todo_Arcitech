import 'package:todo_architech/Screeens/Login.dart';

abstract class loginstate{}

class logininitState extends loginstate{}

class logindataReceive extends loginstate{
  String response = "";
}
class logindataReceiveError extends loginstate{
  String Errormsg = "";
  String errorCode = "0";
  logindataReceiveError({this.Errormsg = "",this.errorCode = "0"});
}
class loginloading extends loginstate{}

class usercreatesucesss extends loginstate{}
class usercreatefail extends loginstate{}