import 'package:flutter/material.dart';

class ItemsAdded extends StatefulWidget {
  @override
  _ItemsAddedState createState() => _ItemsAddedState();
}

class _ItemsAddedState extends State<ItemsAdded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Items Selected'),
        actions: <Widget>[
          Text('field1'),
        ],
      ),
      // body: ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},

      ),
      // drawer: ,
    );
  }
}
