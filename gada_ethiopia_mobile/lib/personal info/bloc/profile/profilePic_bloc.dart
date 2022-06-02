import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/bloc/profile/bloc.dart';


class ProfileBloc extends Bloc<ProfileClicked,ProfileState>{
  ProfileBloc():super(NotClicked()){
    
    on<ProfileClicked>(_pickProfile);}

    File?  profileImage;
    void _pickProfile(ProfileClicked event, Emitter) async {
      final image= await ImagePicker().pickImage(source:ImageSource.gallery);
    if(image==null){
       return
      emit(NotClicked());
      }
    final temporary=File(image.path);
     profileImage=temporary;
     emit(Clicked());
    }

    
  }


