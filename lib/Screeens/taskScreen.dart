import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_architech/GlobalHolder.dart';
import 'package:todo_architech/MyTask_Bloc/taskState.dart';
import 'package:todo_architech/repository/Objectbox.dart';

import '../MyTask_Bloc/taskController.dart';
import '../MyTask_Bloc/taskEvents.dart';

class taskscreen extends StatefulWidget{
  createState() => taskscreenState();
}

class taskscreenState extends State<taskscreen>{

  GlobalKey buttonkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    context.read<TaskController>().add(fetchuserTasks(id: user.id));
   return Scaffold(
   appBar: AppBar(
     backgroundColor: const Color(0XFFF2A6F7f),
     centerTitle: false,
     title: const Text("My Tasks",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
   actions: [
     InkWell(
       onTap: (){
         Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
       },
       child: Container(
         padding: const EdgeInsets.only(left: 6,right: 6,top: 4,bottom: 4),
         child: const Text("Logout",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),
       ),
     ),
     const SizedBox(width: 10,),
     InkWell(
         onTapUp: (detail){
          final offset = detail.globalPosition;
           showMenu(
               context: context,
               initialValue: "Show All",
               position:  RelativeRect.fromLTRB(
                 offset!.dx,
                 offset!.dy,
                 MediaQuery.of(context).size.width - offset!.dx,
                 MediaQuery.of(context).size.height - offset!.dy,
               ),
               items: [
                  PopupMenuItem(
                   onTap: (){
                     Navigator.pushNamed(context, "AllTask");
                   },
                   child: Text("Show All"),
                 ),
               ]);
         },
         child: Icon(key:buttonkey,Icons.menu,color: Colors.white,)),
     const SizedBox(width: 6,),
   ],
   ),
     body: SafeArea(
       bottom: true,
       child: BlocConsumer<TaskController,taskState>(
         buildWhen: (previousstate,newstate){
           if(newstate is onfetchtask){
             // print("newstate.mytask.length: "+newstate.mytask.length.toString());
             // Navigator.pop(context);
             return true;
           }
            else if(previousstate is initstate_task && newstate is oncreatesucess){
               // print("newstate.mytask.length: "+newstate.mytask.length.toString());
               // Navigator.pop(context);
               return true;
             }
             else if (previousstate is oncreatesucess && newstate is oncreatesucess){
               // print("previousstate.mytask.length: "+previousstate.mytask.length.toString());
               // print("newstate.mytask.length: "+newstate.mytask.length.toString());
               return previousstate.mytask.length  != newstate.mytask.length;
             }
             else{
               return false;
             }
         },
         builder: (context,state){
          int count = 0;
          List<Tasks>? list= [];
          if(state is oncreatesucess){
            // print("state.mytask.length: "+state.mytask.length.toString());
            count = state.mytask.length;
            list = state.mytask;
          }
          else if(state is onfetchtask){
            print(state.mytask.length);
            count = state.mytask.length;
            list = state.mytask;
          }
          return Column(
             children: [
               Expanded(
                   child:ListView.builder(
                       itemCount: count,
                       padding: const EdgeInsets.only(top: 8,bottom: 8),
                       prototypeItem: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(color: Colors.black87)
                         ),
                         margin: const EdgeInsets.only(left: 8,right: 8,top: 16,bottom: 16),
                         padding: const EdgeInsets.only(left: 8,right: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           verticalDirection: VerticalDirection.down,
                           children: [
                             Checkbox(
                               value: false,
                               onChanged: (bool? value) {

                               },
                             ),
                             const SizedBox(width: 8,),
                             const Expanded(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Cook Food",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black87),),
                                   Text("Make chienes Food",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87),)
                                 ],
                               ),
                             ),
                             Container(
                                 padding: EdgeInsets.all(8),
                                 child: Icon(Icons.delete)),
                             Container(
                                 padding: EdgeInsets.all(8),
                                 child: Icon(Icons.edit)),
                           ],
                         ),
                       ),
                       itemBuilder: (context,index){
                         Tasks? task = list?[index];
                         return Container(
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               border: Border.all(color: Colors.black87)
                           ),
                           margin: const EdgeInsets.only(left: 8,right: 8,top: 10),
                           padding: const EdgeInsets.only(left: 8,right: 8),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             verticalDirection: VerticalDirection.down,
                             children: [
                               Checkbox(
                                 value: false,
                                 onChanged: (bool? value) {

                                 },
                               ),
                               const SizedBox(width: 8,),
                               Expanded(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(task!.Title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black87),),
                                     Text(task.dispriction,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87),)
                                   ],
                                 ),
                               ),
                               InkWell(
                                 onTap: (){
                                   context.read<TaskController>().add(taskdelete(id:task.id));
                                 },
                                 child: Container(
                                     padding: const EdgeInsets.all(8),
                                     child: const Icon(Icons.delete,size: 24,color: Colors.red,)),
                               ),
                               InkWell(
                                 onTap: (){

                                 },
                                 child: Container(
                                     padding: const EdgeInsets.all(8),
                                     child: const Icon(Icons.edit,size: 24,color: Colors.blue,)),
                               ),
                             ],
                           ),
                         );
                       })),
               InkWell(
                 onTap: (){
                   Navigator.pushNamed(context, "createtask").whenComplete((){
                     context.read<TaskController>().add(fetchuserTasks(id: user.id));
                   });
                 },
                 child: Container(
                   margin: const EdgeInsets.only(top: 10,bottom: 10),
                   padding: const EdgeInsets.symmetric(vertical: 30/2,horizontal: 67/2),
                   decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: const Color(0XFFF2A6F7f),
                   ),
                   child: const Text("Add Task",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 18),),
                 ),
               )
             ],
           );
         },
         listener: (BuildContext context, taskState state) {
           if(state is ondeletesucess){
             context.read<TaskController>().add(fetchuserTasks(id: user.id));
           }
         },
       ),
     ),
   );
  }

}