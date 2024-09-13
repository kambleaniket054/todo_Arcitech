import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_architech/loginBlock/login_Controller.dart';
import 'package:todo_architech/loginBlock/login_event.dart';
import 'package:todo_architech/loginBlock/logincontroll.dart';

import 'loginBlock/login_state.dart';

class login extends StatefulWidget{
  createState() => loginviewstate();
}

class loginviewstate extends State<login>{
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<login_Controller,loginstate>(
     builder: (BuildContext context, loginstate state) {
       return Scaffold(
         body: Padding(
           padding: const EdgeInsets.only(left: 24.0,right: 24),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextFormField(
                 keyboardType: TextInputType.text,
                 style:Theme.of(context).textTheme.bodyMedium,
                 decoration: InputDecoration(
                   hintText: "Enter Your UserName",
                   hintStyle: Theme.of(context).textTheme.labelSmall,
                   labelText: "UserName",
                   labelStyle: Theme.of(context).textTheme.labelMedium,
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12),
                   borderSide: BorderSide(color: Colors.black87),
                 ),
                 ),
               ),
               SizedBox(height: 20,),
               TextFormField(
                 keyboardType: TextInputType.text,
                 style:Theme.of(context).textTheme.bodyMedium,
                 decoration: InputDecoration(
                   hintText: "Enter Your Email",
                   hintStyle: Theme.of(context).textTheme.labelSmall,
                   labelText: "Email",
                   labelStyle: Theme.of(context).textTheme.labelMedium,
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                     borderSide: BorderSide(color: Colors.black87),
                   ),
                 ),
               ),
               SizedBox(height: 20,),
               TextFormField(
                 keyboardType: TextInputType.text,
                 style:Theme.of(context).textTheme.bodyMedium,
                 decoration: InputDecoration(
                   hintText: "Enter Your Password",
                   hintStyle: Theme.of(context).textTheme.labelSmall,
                   labelText: "Password",
                   labelStyle: Theme.of(context).textTheme.labelMedium,
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                     borderSide: BorderSide(color: Colors.black87),
                   ),
                 ),
               ),
               SizedBox(height: 60,),
               InkWell(
                 onTap: (){
                   context.read<login_Controller>().add(onLoginClicked("", "", ""));
                 },
                 child: Container(
                   // margin: EdgeInsets.only(top: 60),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                   color: Theme.of(context).primaryColorLight
                   ),
                   padding: EdgeInsets.all(12),
                   child: Center(child: Text("LOGIN",style: Theme.of(context).textTheme.titleLarge,)),
                 ),
               ),
             ],
           ),
         ),
       );
     },
     listener: (BuildContext context, loginstate state) {
       if(state is loginloading){
         showDialog(context: context, builder: (context){
           return AlertDialog(
             elevation: 0,
             backgroundColor: Colors.transparent,
             content: Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent,)),
           );
         });
       }
       else if(state.runtimeType is logindataReceive){
         Navigator.pop(context);
         print("success");
       }
     },
   );
  }

}