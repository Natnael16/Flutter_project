
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/bloc/authentication/login/bloc.dart';


class LoginBloc extends Bloc<LoginEvent,LoginState>{

  
  LoginBloc():super(NoAttempt()){
  on<LoginEvent>(_loginAttempt);}

  


  void _loginAttempt(LoginEvent event, Emitter emit) async {
    emit(Logingin());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginFailed());
    
      
  }
}