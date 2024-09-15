import 'package:todo_architech/repository/Objectbox.dart';

abstract class taskEvent {}

class taskEdit extends taskEvent{}
class taskdelete extends taskEvent{
  int id;
  taskdelete({required this.id});
}
class fetchuserTasks extends taskEvent{
  int id;
  fetchuserTasks({required this.id});
}
class taskcreate extends taskEvent{
  int id;
  String task_tile;
  String username;
  String task_description;
  taskcreate({required this.id,required this.task_tile,required this.username,required this.task_description});
}

class reinitTask extends taskEvent{}

class fetchalltask extends taskEvent{}