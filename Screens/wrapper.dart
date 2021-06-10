import 'package:camera/camera.dart';
import 'package:easypisy/Screens/Authenticate/Authenticate.dart';
import 'package:easypisy/Screens/Home/camera_controller.dart';
import 'package:easypisy/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home/home.dart';

class Wrapper extends StatelessWidget {

  CameraDescription camera;

  Wrapper({required this.camera});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserObject?>(context);
    // return either home or authenticate widget
    if(user == null){
      print(' redirecting to Authenticate page');
      return Authenticate();
    }else{
      print('redirected to Home page');
      print('printing user_id from Wrapper Widget');
      print(user.uid);
      return Home(camera: camera,);
    }
  }
}
