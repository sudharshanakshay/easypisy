import 'package:flutter/material.dart';
import 'dart:math' as math;

class ItemsList extends StatefulWidget {
  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

  Map _items = {'man':'sudharshan', 'women':'Miss Harini'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
        leading: Text('EasyPisy'),
        centerTitle: true,
        leadingWidth: 100.0,
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index){
            return Card(
              elevation: 0.0,
              margin: EdgeInsets.all(1.0),
              child: ListTile(
                title: Text("${_items['man']}"),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      );
  }
}

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  late TextEditingController _controller;

  @override
  void initState(){
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 50,
          child: TextField(
            controller: _controller,
            onSubmitted: (String value){
              print('$value');
            },
          ),
        ),
        FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.search),
        ),
      ],
    );

  }
}
