import 'package:easypisy/Screens/Home/easypisy_(add)panel.dart';
import 'package:easypisy/models/easypisy.dart';
import 'package:easypisy/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';

import 'easypisy_tile.dart';

class EasypisyPosts extends StatefulWidget {
  const EasypisyPosts({super.key, required this.user, required this.camera});

  final CameraDescription camera;
  final UserObject user;

  @override
  createState() => _EasypisyPostsState();
}

class _EasypisyPostsState extends State<EasypisyPosts> {
  @override
  Widget build(BuildContext context) {
    final easypisys = Provider.of<List<Easypisy>?>(context) ?? [];
    print('printing easypisy');
    print(easypisys);

    // final user = Provider.of<UserObject>(context);
    print('In easypisy_list ');
    print(widget.user.uid);

    void showAddeasypisyPannel() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return EasypisyAddPanel(
            user: widget.user,
            camera: widget.camera,
          );
        },
      );
    }

    return easypisys.isEmpty
        ? Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 60.0,
              child: FilledButton(
                onPressed: () {
                  showAddeasypisyPannel();
                },
                child: const Text(
                  'Add items',
                  style: TextStyle(color: Colors.white),
                ),
                // color: appButtonColor,
              ),
            ),
          )
        : GridView.builder(
            itemCount: easypisys.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              print(index);
              print('length of list' + easypisys.length.toString());
              return EasypisyTile(
                easypisy: easypisys[index],
                isPost: true,
              );
            },
          );
  }
}
