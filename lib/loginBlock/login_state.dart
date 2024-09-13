import 'package:todo_architech/Login.dart';

abstract class loginstate{}

class logininitState extends loginstate{

}

class logindataReceive extends loginstate{}
class logindataReceiveError extends loginstate{}
class loginloading extends loginstate{}