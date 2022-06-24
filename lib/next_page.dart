import 'package:flutter/material.dart';

class TransitionByNavigatorPage extends StatelessWidget {
  final String name;

  const TransitionByNavigatorPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("next_page"),
      ),
      body: Container(
        color: Colors.greenAccent,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: const TextStyle(color: Colors.black, fontSize: 18.0),),
            Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, name);
                  },
                  child: const Text('戻る(Navigator)'),
                )
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text('Go To Image Page')
            )
          ],
        ),
      ),
    );
  }
}

class TransitionByRouteNamePage extends StatelessWidget {
  final String name;

  const TransitionByRouteNamePage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("next_page"),
      ),
      body: Container(
        color: Colors.blue,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(name),
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, name);
                      },
                      child: const Text('戻る(RouteName)'),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

