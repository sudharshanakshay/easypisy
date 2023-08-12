import 'package:easypisy/Screens/Home/easypisy_(add)panel.dart';
import 'package:easypisy/models/easypisy.dart';
import 'package:easypisy/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';

import 'easypisy_tile.dart';

class EasypisyList extends StatefulWidget {
  const EasypisyList({super.key, required this.user, required this.camera});

  final CameraDescription camera;
  final UserObject user;

  @override
  createState() => _EasypisyListState();
}

class _EasypisyListState extends State<EasypisyList> {
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
        : ListView.builder(
            itemCount: easypisys.length,
            itemBuilder: (context, index) {
              return EasypisyTile(
                easypisy: easypisys[index],
                isPost: false,
              );
            });
  }
}

// GridView.builder(
// itemCount: easypisys.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2
// ),
// itemBuilder: (context, index){
// print(index);
// print('length of list'+ easypisys.length.toString());
// return EasypisyTile(easypisy: easypisys[index]);
// },
// );