import 'package:flutter/material.dart';
import 'package:flutter_univer/list_page.dart';
import 'package:flutter_univer/long_lists_page.dart';
import 'package:flutter_univer/text_field_page.dart';
import 'package:flutter_univer/text_page.dart';
import 'grid_list_page.dart';
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
  static const String _imagePage = 'Go To Image Page';
  static const String _textPage = 'Go To Text Page';
  static const String _textFieldPage = 'Go To Text Field Page';
  static const String _listPage = 'Go To List Page';
  static const String _longListsPage = 'Go To Long Lists Page';
  static const String _gridList = 'Go To Grid List Page';
  static const double _buttonPadding = 12.0;

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

  void _onTextPageButtonTapped() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const TextPage()));
  }

  void _onTextFieldButtonTapped() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const TextFieldUIPage()));
  }

  void _onListPageButtonTapped() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ListPage()));
  }

  void _onLongListsButtonTapped() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LongListsPage()));
  }

  void _onGridListPageButtonTapped() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const GridListPage()));
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
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _nextPageButtonByNavigatorTapped,
                child: Text(_navigatorButtonText),
              ),
            )
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _nextPageButtonByRouteNameTapped,
                child: Text(_routeNameButtonText),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _onImagePageButtonTapped,
                child: Text(_imagePage),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _onTextPageButtonTapped,
                child: Text(_textPage),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _onTextFieldButtonTapped,
                child: const Text(_textFieldPage),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _onListPageButtonTapped,
                child: const Text(_listPage),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _onLongListsButtonTapped,
                child: const Text(_longListsPage),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: _buttonPadding),
              child: ElevatedButton(
                onPressed: _onGridListPageButtonTapped,
                child: const Text(_gridList),
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
