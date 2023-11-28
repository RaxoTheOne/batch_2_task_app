import 'package:flutter/material.dart';

class S4524 extends StatefulWidget {
  const S4524({Key? key}) : super(key: key);

  @override
  _ShowHideNameWidgetState createState() => _ShowHideNameWidgetState();
}

class _ShowHideNameWidgetState extends State<S4524> {
  String _currentName = '';
  String _buttonText = 'Name anzeigen';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_currentName),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_currentName.isEmpty) {
                _currentName = 'Dein Name'; // Hier deinen Namen einfügen
                _buttonText = 'Name verstecken';
              } else {
                _currentName = '';
                _buttonText = 'Name anzeigen';
              }
            });
          },
          child: Text(_buttonText),
        ),
      ],
    );
  }
}
