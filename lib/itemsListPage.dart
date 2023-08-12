import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final Map _items = {'man': 'sudharshan', 'women': 'Miss Harini'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items List'),
        leading: const Text('EasyPisy'),
        centerTitle: true,
        leadingWidth: 100.0,
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0.0,
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
                title: Text("${_items['man']}"),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
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
            onSubmitted: (String value) {
              print('$value');
            },
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}
