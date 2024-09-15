import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id;
  String password;
  String name;
  String email;

  User({
    this.id = 0,
   required this.password, // ObjectBox automatically assigns an ID if it's 0
    required this.name,
    required this.email,
  });
}

@Entity()
class Tasks{
  int id;
  int userId;
  String Title;
  String username;
  String dispriction;
  String status;

  Tasks({this.id =0,required this.userId,required this.Title, required this.username,required this.dispriction,required this.status});
}
