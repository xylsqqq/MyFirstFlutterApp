import 'package:flutter/material.dart';
import 'show_image_page.dart';
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
  String _navigatorButtonText = 'Go To Next Page use Navigator';
  String _routeNameButtonText = 'Go To Next Page use Route Name';
  final String _imagePage = 'Go To Image Page';
  final double _buttonPadding = 32.0;

  void _clearButtonTapped() {
    setState(() {
      _navigatorButtonText = '次へ(Navigator)';
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

  void _onImagePageButtonTapped() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ImagePage())
    );
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
              padding: EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _nextPageButtonByNavigatorTapped,
                child: Text(_navigatorButtonText),
              ),
            )
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _nextPageButtonByRouteNameTapped,
                child: Text(_routeNameButtonText),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _onImagePageButtonTapped,
                child: Text(_imagePage),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearButtonTapped,
        tooltip: 'Increment',
        child: const Icon(Icons.restore_from_trash),
      ),
    );
  }
}
