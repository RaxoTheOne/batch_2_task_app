import 'package:flutter/material.dart';

class S4523 extends StatefulWidget {
  const S4523({Key? key}) : super(key: key);

  @override
  _MyNameWidgetState createState() => _MyNameWidgetState();
}

class _MyNameWidgetState extends State<S4523> {
  String _currentName = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_currentName), // Zeigt den aktuellen State an
        ElevatedButton(
          onPressed: () {
            // Setzt den State auf deinen Namen
            setState(() {
              _currentName = 'Benney Der Gott'; // Hier deinen Namen einfügen
            });
          },
          child: Text('Name anzeigen'),
        ),
      ],
    );
  }
}
