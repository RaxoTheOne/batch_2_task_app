import 'package:flutter/material.dart';

class S4522 extends StatelessWidget {
  const S4522({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Hallo Benney'),
        ElevatedButton(
          onPressed: () {
            // Hier kann die Funktion für den Button hinzugefügt werden
          },
          child: Text('Klick mich'),
        ),
      ],
    );
  }
}
