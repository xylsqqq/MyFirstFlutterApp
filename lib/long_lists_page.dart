import 'package:flutter/material.dart';

class LongListsPage extends StatefulWidget {
  const LongListsPage({Key? key}) : super(key: key);

  @override
  State<LongListsPage> createState() => _LongListsPageState();
}

class _LongListsPageState extends State<LongListsPage> {
  final items = List<String>.generate(10000, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Long Lists Page"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          }
      ),
    );
  }
}
