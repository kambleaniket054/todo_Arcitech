import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_architech/GlobalHolder.dart';
import 'package:todo_architech/MyTask_Bloc/taskController.dart';
import 'package:todo_architech/MyTask_Bloc/taskEvents.dart';

class createtask extends StatefulWidget{
  createState() => createtaskState();
}

class createtaskState extends State<createtask>{
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController discriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF2A6F7f),
        centerTitle: true,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        title: const Text("Create/Edit",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24,right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: titlecontroller,
              obscureText:false,
              keyboardType: TextInputType.text,
              style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black87),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: discriptioncontroller,
              obscureText:false,
              keyboardType: TextInputType.text,
              style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
              decoration: InputDecoration(
                hintText: "Discription",
                hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black87),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                context.read<TaskController>().add(taskcreate(id:user.id,task_tile: titlecontroller.text,username: user.name,task_description: discriptioncontroller.text));
                Navigator.pop(context);
              },
              child:  Container(
                margin: EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 30/2,horizontal: 67/2),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0XFFF2A6F7f),
                ),
                child: const Text("Save",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 18),),
              )
            ),
          ],
        ),
      ),
    );
  }
}