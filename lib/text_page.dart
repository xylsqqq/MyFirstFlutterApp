import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                  'Text Style',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.overline,
                ),
              ),
              Text(
                  'Hello World!',
                textAlign: TextAlign.start, // not work
                style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..shader = const LinearGradient(colors: [
                      Colors.red,
                      Colors.yellow
                    ]).createShader(
                        const Rect.fromLTWH(0, 0, 250, 70)
                    )
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'This is a ',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20
                  ),
                  children: [
                    TextSpan(
                        text: 'RICH ',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                    ),
                    TextSpan(
                      text: 'TEXT',
                      style: TextStyle(
                          color: Colors.black,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.lineThrough,
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
