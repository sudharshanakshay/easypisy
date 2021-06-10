import 'package:camera/camera.dart';
import 'package:easypisy/Screens/Home/camera_controller.dart';
import 'package:easypisy/models/user.dart';
import 'package:easypisy/services/database.dart';
import 'package:easypisy/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EasypisyAddPanel extends StatefulWidget {

  CameraDescription camera;
  UserObject user;
  EasypisyAddPanel({required this.user, required this.camera});

  @override
  _EasypisyAddPanelState createState() => _EasypisyAddPanelState();
}

class _EasypisyAddPanelState extends State<EasypisyAddPanel> {

  String _easypisyName = '';
  String _tag = '';
  double _sidePixel = 4.0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    Size _size = MediaQuery
        .of(context)
        .size;
    double _width = _size.width-(2*_sidePixel);




    // final user = Provider.of<UserObject>(context);

    return Form(
      key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _sidePixel,0.0,_sidePixel,MediaQuery.of(context).viewInsets.bottom
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.0,),
              Text(
                'Add Items',
                style: TextStyle(
                    fontSize: 18.0
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  SizedBox(
                    width: (_width)/3,
                    height: 250.0,
                    child: CameraWidget(camera: widget.camera,)
                  ),
                  SizedBox(
                    width: 2*((_width)/3),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'Item name'),
                          onChanged: (val){
                            setState(() => _easypisyName = val);
                          },
                          validator: (val)=> val!.isEmpty ? 'Enter Item name' : null,
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: '#tag'),
                          onChanged: (val){
                            setState(() => _tag = val);
                          },
                          validator: (val) => val!.isEmpty ? 'Enter #tag' : null,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate())
                    DatabaseService(uid: widget.user.uid).uploadUserData(_easypisyName, _tag);
                  Navigator.pop(context);
                },
                child: Text('Add'),
                // color: appBarColor,
              )
            ],
          ),
        )
    );
  }
}