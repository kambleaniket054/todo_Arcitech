import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_architech/loginBlock/login_Controller.dart';
import 'package:todo_architech/loginBlock/login_event.dart';
import 'package:todo_architech/loginBlock/logincontroll.dart';
import 'package:url_launcher/url_launcher.dart';

import '../loginBlock/login_state.dart';

class login extends StatefulWidget{
  createState() => loginviewstate();
}

class loginviewstate extends State<login>{

  TextEditingController pswdcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  FocusNode usernameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     key: _scaffoldkey,
     body: BlocConsumer<login_Controller,loginstate>(
       builder: (BuildContext context, loginstate state) {
         return Padding(
           padding: const EdgeInsets.only(left: 24.0,right: 24),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextFormField(
                 controller: usernamecontroller,
                 keyboardType: TextInputType.text,
                 style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
                 decoration: InputDecoration(
                   hintText: "Name",
                   hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black87),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                     borderSide: const BorderSide(color: Colors.grey),
                   ),
                 ),
               ),
               const SizedBox(height: 20,),
               TextFormField(
                 controller: emailcontroller,
                 keyboardType: TextInputType.text,
                 style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
                 decoration: InputDecoration(
                   hintText: "Email",
                   hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black87),
                   border: OutlineInputBorder(
                     gapPadding: 100,
                     borderRadius: BorderRadius.circular(12),
                     borderSide: const BorderSide(color: Colors.grey,width: 1.2),
                   ),
                 ),
               ),
               SizedBox(height: 20,),
               TextFormField(
                 controller: pswdcontroller,
                 obscureText:true,
                 keyboardType: TextInputType.text,
                 style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
                 decoration: InputDecoration(
                   hintText: "Password",
                   hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black87),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                     borderSide: BorderSide(color: Colors.grey),
                   ),
                 ),
               ),
               const SizedBox(height: 60,),
               InkWell(
                 onTap: (){
                   context.read<login_Controller>().add(onLoginClicked(usernamecontroller.text, emailcontroller.text, pswdcontroller.text));
                   // launchRawHtml(context);
                 },
                 child: Container(
                   margin: const EdgeInsets.only(left: 60,right: 60),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                     color: const Color(0XFFF2A6F7f),
                   ),
                   padding: const EdgeInsets.all(12),
                   child: const Center(child: Text("SignIn / SignUp",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),)),
                 ),
               ),
             ],
           ),
         );
       },
       listener: (BuildContext context, loginstate state) {
         if(state is loginloading){
           showDialog(context: context, builder: (context){
             return const AlertDialog(
               elevation: 0,
               backgroundColor: Colors.transparent,
               content: Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent,)),
             );
           });
         }
         else if(state is logindataReceiveError && state.Errormsg != ""){

           if(state.errorCode == "-2"){
             // Navigator.pop(context);
             showModalBottomSheet(
                 context: context,
                 builder: (contex){
                   return Container(
                     color: const Color(0XFFF2A6F7f),
                     margin:const EdgeInsets.only(bottom: 10),
                     padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 20),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text(state.Errormsg,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                         const SizedBox(height: 16,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             InkWell(
                               onTap: (){
                                 Navigator.pop(context);
                               },
                               child: Container(
                                 margin: EdgeInsets.only(top: 10),
                                 padding: const EdgeInsets.symmetric(vertical: 30/2,horizontal: 67/2),
                                 decoration:  BoxDecoration(
                                   borderRadius: BorderRadius.circular(8),
                                   border: Border.all(color: Colors.white),
                                   color: Color(0XFFF2A6F7f),
                                 ),
                                 child: const Text("Cancle",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 18),),
                               ),
                             ),
                             SizedBox(width: 10,),
                             InkWell(
                               onTap: (){
                                 // Navigator.pushNamed(context, "createtask");
                                 context.read<login_Controller>().add(createuser(usernamecontroller.text, emailcontroller.text, pswdcontroller.text));
                               },
                               child: Container(
                                 margin: EdgeInsets.only(top: 10),
                                 padding: const EdgeInsets.symmetric(vertical: 30/2,horizontal: 67/2),
                                 decoration:  BoxDecoration(
                                   borderRadius: BorderRadius.circular(8),
                                   color: Colors.white,
                                 ),
                                 child: const Text("Create",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0XFFF2A6F7f),fontSize: 18),),
                               ),
                             )
                           ],
                         ),
                       ],
                     ),
                   );
                 });
             return;
           }
           showModalBottomSheet(
               context: context,
               builder: (contex){
                 return Container(
                   color: const Color(0XFFF2A6F7f),
                   margin:const EdgeInsets.only(bottom: 10),
                   padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 20),
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text(state.Errormsg,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
                     ],
                   ),
                 );
               });
         }
         if(state is usercreatesucesss){
           Navigator.pop(context);
           context.read<login_Controller>().add(onLoginClicked(usernamecontroller.text, emailcontroller.text, pswdcontroller.text));
         }
         else if(state is logindataReceive){
           // state.response;
           // Navigator.pop(context);
           Navigator.pushReplacementNamed(_scaffoldkey.currentState!.context, "mytask");
           // context.read<login_Controller>().close()
           print("success");
         }
       },
     ),
   );
  }

}




