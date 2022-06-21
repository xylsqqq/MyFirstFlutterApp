import 'package:flutter/material.dart';

import 'next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/routeNameTrans': (context) => const TransitionByRouteNamePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _nextPageButtonByNavigatorTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TransitionByNavigatorPage()),
    );
  }

  void _nextPageButtonByRouteNameTapped() {
    Navigator.pushNamed(context, '/routeNameTrans');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                onPressed: _nextPageButtonByNavigatorTapped,
                child: const Text('次へ(Navigator)'),
              ),
            )
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                onPressed: _nextPageButtonByRouteNameTapped,
                child: const Text('次へ(Route Name)'),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
