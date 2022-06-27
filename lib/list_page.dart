import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            const ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            const ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              onTap: () {
                // TODO: Do something when this row tapped.
                // Transition to another page, etc...
              },
            ),
            const Text('test'),
          ],
        ),
      ),
    );
  }
}