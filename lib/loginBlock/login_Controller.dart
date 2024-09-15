import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_architech/loginBlock/login_event.dart';

import '../GlobalHolder.dart';
import '../main.dart';
import '../objectbox.g.dart';
import '../repository/Objectbox.dart';
import '../repository/objectBox_helper.dart';
import 'login_state.dart';

class login_Controller extends Bloc<loginEvent,loginstate>{
  login_Controller() : super(logininitState()){
    on<onLoginClicked>(callloginapi);
    on<createuser>(createUser);
    on<reinitlogin>(logininit);
  }


  FutureOr<void> callloginapi(onLoginClicked event, Emitter<loginstate> emit) async {
    if(event.email == "" || event.pswd == "" || event.username == ""){
      emit(logindataReceiveError(Errormsg: "Username, Password and Email Field can not be Empty",errorCode: "-1"));
    return;
    }
    final isUser = await objectBoxhelper.getuserby(event.username,event.email,event.pswd);
    if(isUser == null){
      emit(logindataReceiveError(Errormsg: "User does not Exist \n Do you like to Create",errorCode: "-2"));
      return;
    }
    user = isUser[0];

    emit(logindataReceive());
  }


 FutureOr<void> createUser(createuser event, Emitter<loginstate> emit) async {
    if(event.email == "" || event.pswd == "" || event.username == ""){
      emit(logindataReceiveError(Errormsg: "Username, Password and Email Field can not be Empty",errorCode: "-1"));
      return;
    }
    // emit(loginloading());
    var isUser = await objectBoxhelper.addUsernew(event.username,event.email,event.pswd);
    // if(!isUser){
    //   emit(logindataReceiveError(Errormsg: "User does not Exist \n Do you like to Create",errorCode: "-2"));
    //   return;
    // }
    emit(usercreatesucesss());
  }

  FutureOr<void> logininit(reinitlogin event, Emitter<loginstate> emit) {
    emit(logininitState());
  }
}