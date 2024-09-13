import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_architech/loginBlock/login_event.dart';

import 'login_state.dart';

class login_Controller extends Bloc<loginEvent,loginstate>{
  login_Controller() : super(logininitState()){
    on<onLoginClicked>(callloginapi);
  }

  FutureOr<void> callloginapi(onLoginClicked event, Emitter<loginstate> emit) async {
    emit(loginloading());
    Future.delayed(const Duration(seconds: 2,),() async {
      emit(logindataReceive());
    });
  }

}