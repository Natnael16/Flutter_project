import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/Information.dart';
import 'package:work/bloc/profile/bloc.dart';

class Profile extends StatelessWidget{


  

  bool isEnabled=false;
  String profile_name="Betselot";
  List<Information> details = [
    Information(icon:Icon(Icons.support,color: Colors.purple,) , title: Text("Donation",style: TextStyle(fontSize: 18.7),)),
     Information(icon: Icon(Icons.edit_note, color: Colors.purple,) , title: Text("List of Posts",style: TextStyle(fontSize: 18.7),)),
     Information(icon: Icon(Icons.edit,color: Colors.purple,) , title:Text("Edit profile",style: TextStyle(fontSize: 18.7),)),
    Information(icon: Icon(Icons.logout, color: Colors.red,) , title:Text( "Logout",style: TextStyle(fontSize: 18.7,color: Colors.red),)),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
      children:<Widget> [ Container(
            decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), ),
          ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 200,),

          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(60, 30),topRight: Radius.elliptical(60, 30) ),
              
            ),
          padding: EdgeInsets.only(top: 90),

          child:ListView.builder(itemCount: details.length,
            itemBuilder: (context,index)
            {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
                child: ListTile(
                  onTap: (){},
                  title: details[index].title,
                  leading: details[index].icon,
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              );

            },
          ),          ),
          ),],
      ),

      ),
      BlocBuilder<ProfileBloc,ProfileState>(
        builder: (_,ProfileState state){
          Widget buttonchild=CircleAvatar(radius: 60,);
          if(state is NotClicked){
            buttonchild=CircleAvatar(child: Text(
             profile_name[0].toUpperCase(),style: TextStyle(
             fontSize: 40,fontWeight: FontWeight.bold),),backgroundColor: Colors.blueGrey,

            radius: 60,
          );
          }
          else if (state is Clicked){
            buttonchild=CircleAvatar( child:  ClipOval(child: Image.file(BlocProvider.of<ProfileBloc>(context).profileImage!,width:120,height: 120,fit: BoxFit.cover,)),radius: 60, );
          }
          return 
          Positioned(

            top: 135,
           right:MediaQuery.of(context).size.width * (0.5-(60/MediaQuery.of(context).size.width)),
           child:buttonchild,
          );},),
         Positioned(
           top: 260,
           right: 0,
           left:0,
             child: Center(child: Text(profile_name, style: TextStyle(fontSize: 24,color: Colors.black),
                ),
         ),)

        ,Positioned(
          top: 200,
          right:0,
          left:60,
          child:Center(
            child:IconButton(
              onPressed:() {
               final profileBloc=BlocProvider.of<ProfileBloc>(context);
               profileBloc.add(ProfileClicked());
              },
              icon: Icon(Icons.camera_alt,color: Colors.purple,),
            )
          )
        ),
    ],),
    );

  }
}