
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../GlobalHolder.dart';
import '../MyTask_Bloc/taskController.dart';
import '../MyTask_Bloc/taskEvents.dart';
import '../MyTask_Bloc/taskState.dart';
import '../repository/Objectbox.dart';

class showAllTask extends StatefulWidget{
  createState() => alltaskState();
}

class alltaskState extends State<showAllTask>{
  @override
  Widget build(BuildContext context) {
    context.read<TaskController>().add(fetchalltask());
   return Scaffold(
     appBar: AppBar(
       backgroundColor: const Color(0XFFF2A6F7f),
       foregroundColor: Colors.white,
       centerTitle: true,
       automaticallyImplyLeading: true,
       title: const Text("All Tasks",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
     ),
     body: SafeArea(
       bottom: true,
       child: BlocConsumer<TaskController,taskState>(
         buildWhen: (previousstate,newstate){
           if(newstate is onfetchalltask){
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
           else if(state is onfetchalltask){
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
                         height: 120,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(color: Colors.black87)
                         ),
                         margin: const EdgeInsets.only(left: 8,right: 8,top: 16,bottom: 16),
                         padding: const EdgeInsets.only(left: 8,right: 8),
                         child: const Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           verticalDirection: VerticalDirection.down,
                           children: [
                             SizedBox(width: 8,),
                             Expanded(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Cook Food",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black87),),
                                   Text("Make chienes Food",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87),)
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                       itemBuilder: (context,index){
                         Tasks? task = list?[index];
                         return Container(
                           height: 22,
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
                               const SizedBox(width: 8,),
                               Expanded(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(task!.Title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black87),),
                                     Text(task.dispriction,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87),),
                                   Row(
                                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                                       Text(task.username ?? "",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black87),),
                                       const Spacer(),
                                       Text(task.status,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87),),
                                     ],
                                   ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         );
                       })),
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