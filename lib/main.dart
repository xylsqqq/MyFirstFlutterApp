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
        '/routeNameTrans': (context) => const TransitionByRouteNamePage(name: 'ywang-routeName',)
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
  String _navigatorButtonText = '';
  String _routeNameButtonText = '';

  void _clearButton() {
    setState(() {
      _navigatorButtonText = '';
      _routeNameButtonText = '';
    });
  }

  void _nextPageButtonByNavigatorTapped() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TransitionByNavigatorPage(name: 'ywang-navigator',)),
    );
    setState(() {
      _navigatorButtonText = result;
    });
  }

  void _nextPageButtonByRouteNameTapped() async {
    final result = await Navigator.pushNamed(context, '/routeNameTrans', arguments: _routeNameButtonText);
    setState(() {
      _routeNameButtonText = result.toString();
    });
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
                child: Text(_navigatorButtonText),
              ),
            )
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                onPressed: _nextPageButtonByRouteNameTapped,
                child: Text(_routeNameButtonText),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearButton,
        tooltip: 'Increment',
        child: const Icon(Icons.restore_from_trash),
      ),
    );
  }
}
