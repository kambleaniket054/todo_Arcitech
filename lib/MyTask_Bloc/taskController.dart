import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_architech/GlobalHolder.dart';
import 'package:todo_architech/MyTask_Bloc/taskEvents.dart';
import 'package:todo_architech/MyTask_Bloc/taskState.dart';

import '../main.dart';

class TaskController extends Bloc<taskEvent,taskState>{
  TaskController() : super(initstate_task()){
    on<taskEdit>(editTask);
    on<taskcreate>(createtask);
    on<taskdelete>(deletetask);
    on<fetchuserTasks>(fetchusertaska);
    on<reinitTask>(initTask);
    on<fetchalltask>(fetchtasks);
    add(fetchuserTasks(id: user.id ?? 0));
  }

  FutureOr<void> editTask(taskEdit event, Emitter<taskState> emit) {
  }

  Future<FutureOr<void>> createtask(taskcreate event, Emitter<taskState> emit) async {
    final addtask = await objectBoxhelper.addUserTask(event.id,event.task_tile,event.username,event.task_description);
    final tasklist = await objectBoxhelper.getUserTasks(event.id);
  if(tasklist != []) {
    emit(oncreatesucess(mytask: tasklist));
  }
  else{
    emit(oncreatesucess(mytask: []));
  }
  }

  FutureOr<void> deletetask(taskdelete event, Emitter<taskState> emit) {
    if(event.id == null || event.id == ""){
      return null;
    }
    else{
      final task = objectBoxhelper.removeTask(event.id);
      emit(ondeletesucess());
    }
  }

  Future<FutureOr<void>> fetchusertaska(fetchuserTasks event, Emitter<taskState> emit) async {
    final tasklist = await objectBoxhelper.getUserTasks(event.id);
    if(tasklist != null) {
      emit(onfetchtask(mytask: tasklist));
    }
    else{
      emit(onfetchtask(mytask: []));
    }
  }

  FutureOr<void> initTask(event, Emitter<taskState> emit) {
    // emit(fetchuserTasks(id: user.id));
    fetchuserTasks(id: user.id);
  }

  Future<FutureOr<void>> fetchtasks(fetchalltask event, Emitter<taskState> emit) async {
    final tasklist = await objectBoxhelper.getAlltask();
    emit(onfetchalltask(mytask: tasklist));
  }
}