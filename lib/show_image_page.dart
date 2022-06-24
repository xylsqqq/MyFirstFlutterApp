import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String _imageURL = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM1cDnT1Q5ZrkfLfxiSgFvC2ZsjpngynJGvg&usqp=CAU';
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image View'),
      ),
      body: Container(
        color: Colors.black12,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(_imageURL),
            ),
            Image.asset('images/cat.jpeg'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                      '画像だよ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Icon(Icons.add_a_photo)
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
