import 'package:camera/camera.dart';
import 'package:easypisy/Screens/Home/easypisy_list.dart';
import 'package:easypisy/Screens/Home/posts.dart';
import 'package:easypisy/models/user.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  CameraDescription camera;
  UserObject user;
  SearchPage({required this.user, required this.camera});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.pinkAccent,
              child: SafeArea(
                child: TabBar(
                  tabs: [
                    Text('MYLIST'),
                    Text('POSTS')
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              EasypisyList(user: widget.user, camera: widget.camera,),
              EasypisyPosts(user: widget.user, camera: widget.camera,)
             ],
          ),
        )
    );
  }
}