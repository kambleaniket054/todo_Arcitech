import 'package:todo_architech/repository/Objectbox.dart';

abstract class taskState{}

late List tasks;
class initstate_task extends taskState{
}

class onfetchtask extends taskState{
  List<Tasks> mytask = [];
  onfetchtask({this.mytask = const[]});
}

class onfetchalltask extends taskState{
  List<Tasks> mytask = [];
  onfetchalltask({this.mytask = const[]});
}

class ondeletesucess extends taskState{}
class ondeletefail extends taskState{}
class editsucess extends taskState{}
class oncreatesucess extends taskState{
  List<Tasks> mytask = [];
  oncreatesucess({this.mytask = const[]});
}
class oncreatefail extends taskState{}
