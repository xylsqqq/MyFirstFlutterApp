import 'package:flutter/material.dart';

class TransitionByNavigatorPage extends StatelessWidget {
  const TransitionByNavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("next_page"),
      ),
      body: Container(
        color: Colors.blue,
        height: double.infinity,
        child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('戻る(Navigator)'),
            )
        ),
      ),
    );
  }
}

class TransitionByRouteNamePage extends StatelessWidget {
  const TransitionByRouteNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("next_page"),
      ),
      body: Container(
        color: Colors.blue,
        height: double.infinity,
        child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('戻る(RouteName)'),
            )
        ),
      ),
    );
  }
}

