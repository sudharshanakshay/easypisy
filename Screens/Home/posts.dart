import 'package:easypisy/Screens/Home/easypisy_(add)panel.dart';
import 'package:easypisy/models/easypisy.dart';
import 'package:easypisy/models/user.dart';
import 'package:easypisy/shared/colors.dart';
import 'package:easypisy/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:easypisy/services/database.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';

import 'easypisy_tile.dart';

class EasypisyPosts extends StatefulWidget {

  CameraDescription camera;
  UserObject user;
  EasypisyPosts({required this.user, required this.camera});

  @override
  _EasypisyPostsState createState() => _EasypisyPostsState();
}

class _EasypisyPostsState extends State<EasypisyPosts> {
  @override
  Widget build(BuildContext context) {

    final SliverGridDelegate _gridDelegate;

    final easypisys = Provider.of<List<Easypisy>?>(context) ?? [];
    print('printing easypisy');
    print(easypisys);

    // final user = Provider.of<UserObject>(context);
    print('In easypisy_list ');
    print(widget.user.uid);

    void _showAddeasypisyPannel(){
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context){
          return EasypisyAddPanel(user: widget.user, camera: widget.camera,);
        },
      );
    }

    return easypisys.isEmpty ? Container(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/3,
          height: 60.0,
          child: FlatButton(
            onPressed: (){
              _showAddeasypisyPannel();
            },
            child: Text(
              'Add items',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: appButtonColor,
          ),
        ),
      ),
    ) :
    GridView.builder(
      itemCount: easypisys.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      itemBuilder: (context, index){
        print(index);
        print('length of list'+ easypisys.length.toString());
        return EasypisyTile(easypisy: easypisys[index], isPost: true,);
      },
    );
  }
}

