import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextFieldUIPage extends StatelessWidget {
  const TextFieldUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextFieldPage();
  }
}

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final myFocusNode = FocusNode();
  final myController = TextEditingController();
  late String name;

  void _onShowEmailButtonTapped() {
    String text = myController.text.isEmpty ? 'Empty' : myController.text;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Your Email is $text'),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Page'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.redAccent,
                Colors.blueGrey,
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Your Name',
                ),
                onChanged: (text) {
                  name = text;
                  if (kDebugMode) {
                    print(name);
                  }
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
              child: TextField(
                focusNode: myFocusNode,
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Your Email',
                ),
                onChanged: (text) {
                  if (kDebugMode) {
                    print(text);
                  }
                },
                onEditingComplete: () {
                  if (kDebugMode) {
                    print('Done Button Tapped');
                  }
                  myFocusNode.unfocus();
                },
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  myFocusNode.requestFocus();
                  if (kDebugMode) {
                    print('Your Email is ${myController.text}');
                  }
                },
                child: const Text('Focus 2nd TextField')
            ),
            ElevatedButton(
                onPressed: _onShowEmailButtonTapped,
                child: const Text('show your Email on dialog'),
            )
          ],
        ),
      ),
    );
  }
}

