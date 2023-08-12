import 'package:camera/camera.dart';
import 'package:easypisy/Screens/Home/easypisy_(add)panel.dart';
import 'package:easypisy/Screens/Home/easypisy_list.dart';
import 'package:easypisy/Screens/Home/search_page.dart';
import 'package:easypisy/models/easypisy.dart';
import 'package:easypisy/models/user.dart';
import 'package:easypisy/services/auth.dart';
import 'package:easypisy/services/database.dart';
import 'package:easypisy/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.camera});

  final CameraDescription camera;

  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final AuthService _auth = AuthService();

  final String _tempUserId = '';

  @override
  Widget build(BuildContext context) {
    void showAddeasypisyPannel() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return EasypisyAddPanel(
            user: UserObject(uid: _tempUserId),
            camera: widget.camera,
          );
        },
      );
    }

    return StreamProvider<List<Easypisy>?>(
      create: (context) => DatabaseService(uid: _tempUserId).easypisys,
      initialData: null,
      catchError: (_, err) => null,
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Text('easypisy'),
          elevation: 0.0,
          actions: [
            // ignore: deprecated_member_use
            FilledButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: appBarColor,
                ),
                child: CircleAvatar(
                  radius: 25.0,
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
              if (value == 1) {
                showAddeasypisyPannel();
              }
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add items'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          ],
        ),
        body: _currentIndex == 0 || _currentIndex == 1
            ? EasypisyList(
                user: UserObject(uid: _tempUserId),
                camera: widget.camera,
              )
            : SearchPage(
                user: UserObject(uid: _tempUserId),
                camera: widget.camera,
              ),
      ),
    );
  }
}
// _currentIndex == 2? null:

