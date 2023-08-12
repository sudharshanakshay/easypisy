import 'package:easypisy/models/easypisy.dart';
import 'package:flutter/material.dart';

class EasypisyTile extends StatelessWidget {
  const EasypisyTile({super.key, required this.easypisy, required this.isPost});

  final bool isPost;
  final Easypisy easypisy;

  final double left = 4.0;
  final double right = 4.0;
  final double top = 10.0;
  final double bottom = 0.0;

  @override
  Widget build(BuildContext context) {
    return isPost
        ? Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Card(
              margin: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: SizedBox(
                  height: 80.0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green[200],
                      ),
                      Text(
                        easypisy.easypisyName,
                        style: const TextStyle(
                          fontSize: 18.0,
//color: Colors.white
                        ),
                      ),
                    ],
                  )),
            ),
          )
        : Padding(
            padding: EdgeInsets.fromLTRB(left, top, right, bottom),
            child: Card(
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                  contentPadding:
                      const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                  // tileColor: Colors.blue[50],
                  leading: CircleAvatar(
                    backgroundColor: Colors.green[200],
                  ),
                  title: Text(
                    easypisy.easypisyName,
                    style: const TextStyle(
                      fontSize: 18.0,
//color: Colors.white
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  )),
            ),
          );
  }
}
