import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:work/bloc/authentication/registration/bloc.dart';

import '../bloc/authentication/bloc.dart';
import 'home.dart';




class Register extends StatelessWidget {
 
  final firstnameController=TextEditingController();
  final lastnameController=TextEditingController();
  final emailController=TextEditingController();
  final newPasswordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/gadalogo.jpg"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Join GADA ",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //      topRight: Radius.elliptical(200,100),
                  //  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 275,
                              child: TextFormField(
                                controller: firstnameController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 0),
                                  labelText: "First Name",
                                  labelStyle: TextStyle(fontSize: 16),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This filed can not be empty';
                                  } else if (GetUtils.isAlphabetOnly(value) ==
                                      false) {
                                    return 'Please use alphabetic letters only ';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 275,
                              child: TextFormField(
                                controller: lastnameController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 0),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(fontSize: 16),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  // suffixIcon: GestureDetector(
                                  //   onTap: (){},
                                  // ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 275,
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "joinus@gada.com",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 0),
                                  labelText: "E-Mail",
                                  labelStyle: TextStyle(fontSize: 16),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field can not be empty ';
                                  } else if (GetUtils.isEmail(value) == false) {
                                    return 'Invalid E-MAIL';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 275,
                              child: BlocBuilder<PassBloc, PassState>(
                                builder: (_, PassState state) {
                                  Widget buttonChild = Icon(Icons.visibility);
                                  if (state is Visible) {
                                    buttonChild = Icon(Icons.visibility_off);
                                  }
                                  if (state is Obscure) {
                                    buttonChild = Icon(Icons.visibility);
                                  }
                                  return TextFormField(
                                    controller: newPasswordController,
                                    obscureText:
                                        BlocProvider.of<PassBloc>(context)
                                            .isObscure,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 0),
                                      labelText: "New Password",
                                      labelStyle: TextStyle(fontSize: 16),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.redAccent),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          final passBlock =
                                              BlocProvider.of<PassBloc>(
                                                  context);
                                          passBlock.add(PassEvent());
                                        },
                                        child: buttonChild,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.length < 8) {
                                        return 'minimum password length 8 ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 275,
                              child: BlocBuilder<PassBloc, PassState>(
                                builder: (_, PassState state) {
                                  Widget buttonChild = Icon(Icons.visibility);
                                  if (state is Visible) {
                                    buttonChild = Icon(Icons.visibility_off);
                                  }
                                  if (state is Obscure) {
                                    buttonChild = Icon(Icons.visibility);
                                  }
                                  return TextFormField(
                                    controller: confirmPasswordController,
                                    obscureText:
                                        BlocProvider.of<PassBloc>(context)
                                            .isObscure,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 0),
                                      labelText: "Confirm Password",
                                      labelStyle: TextStyle(fontSize: 16),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.redAccent),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          final passBlock =
                                              BlocProvider.of<PassBloc>(
                                                  context);
                                          passBlock.add(PassEvent());
                                        },
                                        child: buttonChild,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.length < 8) {
                                        return 'minimum password length 8 ';
                                      } else if(newPasswordController.text!=confirmPasswordController.text) {
                                        return 'Unmatching confirmation password';
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BlocConsumer<RegBloc,RegState>(
                              listenWhen:(_,current){
                                return current is Registerd;
                              },

                              listener: (_,RegState state){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_)=>HomeScreen()),
                                );
                              },
                              builder: (_,RegState state){
                                Widget buttonChild=Text("Register");
                                if(state is NoAttempt){
                                  buttonChild=Text("Register",);
                                }
                                if(state is Registration){
                                  buttonChild=Text("Registering");
                                }
                                 if(state is NotRegisterd){
                                  buttonChild=Text("Registration Failed",style: TextStyle(color: Colors.red),);
                                }
                              
                              return ElevatedButton(
                                onPressed: state is Registration
                                    ?null:() {
                                  final formValid = formKey.currentState!.validate();
                                  if (!formValid) return;
                                  final regbloc=context.read<RegBloc>();
                                  regbloc.add(RegEvent(firstnameController.text, lastnameController.text, emailController.text, newPasswordController.text));

                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple,
                                  onPrimary: Colors.white,
                                  fixedSize: Size(275, 20),
                                ),
                                child: buttonChild,
                              );
                              },),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
