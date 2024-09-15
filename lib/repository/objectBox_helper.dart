import 'package:objectbox/objectbox.dart';
import '../objectbox.g.dart';
import 'Objectbox.dart';
 // Import the generated code

class ObjectBoxhelper {
  late final Store store;
  late final Box<User> userBox;
  late final Box<Tasks> taskBox;

  ObjectBoxhelper._create(this.store) {
    userBox = store.box<User>();
    taskBox = store.box<Tasks>();
  }

  // Open and create the store
  static Future<ObjectBoxhelper> create() async {
    final store = await openStore();
    return ObjectBoxhelper._create(store);
  }

  // Add a new user
  void addUser(User user) {
    userBox.put(user);
  }

  void addUsernew(String name,String email,String pswd) {
    User user = User(password: pswd, name: name, email: email);
    userBox.put(user);
  }

  void addUserTask(int id,String title,String username,String discription){
    Tasks task = Tasks(userId:id,Title:title,username: username,dispriction: discription, status:"Incomplete");
    taskBox.put(task);
  }

  List<Tasks> getUserTasks(int id){
    Query<Tasks> query = taskBox.query(Tasks_.userId.equals(id)).build();
    if(query.count() != 0){
      return query.find();
    }
    else{
      return [];
    }
  }

    getuserby(String name, String email, String pswd){
    Query<User> query = userBox.query(User_.name.equals(name).and(User_.email.equals(email).and(User_.password.equals(pswd)))).build();
    if(query.count() != 0){
      return query.find();
    }
    else{
      return null;
    }
  }

  removeTask(int id){
    taskBox.remove(id);
  }

  // Get all users
  List<User> getAllUsers() {
    return userBox.getAll();
  }
  List<Tasks> getAlltask() {
    return taskBox.getAll();
  }
  // Remove a user by ID
  void removeUser(int id) {
    userBox.remove(id);
  }
}