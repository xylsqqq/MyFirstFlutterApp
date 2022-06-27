import 'package:flutter/material.dart';

class GridListPage extends StatelessWidget {
  const GridListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid List Page'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(100, (index) {
          return Column(
            children: [
              Expanded(
                  child: Image.asset('images/cat.jpeg')
              ),
              Text(
                'Item $index',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        }),
      ),
    );
  }
}
