import 'package:camera/camera.dart';
import 'package:easypisy/Screens/wrapper.dart';
import 'package:easypisy/models/user.dart';
import 'package:easypisy/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras =  await availableCameras();
  final backCam = cameras.first;
  await Firebase.initializeApp();
  runApp(MyApp(camera : backCam));
}

class MyApp extends StatelessWidget {
  CameraDescription camera;
  MyApp({required this.camera});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserObject?>.value(
      initialData: null,
      value: AuthService().getUser,
      catchError: (_, err) => null,
      child: MaterialApp(
        home: Wrapper(camera: camera,),
      ),
    );
  }
}