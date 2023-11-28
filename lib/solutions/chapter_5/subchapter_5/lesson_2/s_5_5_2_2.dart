import 'dart:math';
import 'package:flutter/material.dart';

class S5522 extends StatefulWidget {
  const S5522({Key? key}) : super(key: key);

  @override
  _S5522State createState() => _S5522State();
}

class _S5522State extends State<S5522> {
  String _resultText = '';

  void _rollDice() {
    setState(() {
      _resultText = 'Würfel wird geworfen...';
    });

    // Simuliere das Würfeln mit einer Verzögerung von 2 Sekunden
    Future.delayed(Duration(seconds: 2), () {
      // Zufällig entscheiden, ob ein Fehler auftritt
      bool hasError = Random().nextBool();

      if (hasError) {
        throw Exception('Ein Fehler ist aufgetreten!');
      } else {
        int diceResult = Random().nextInt(6) + 1;
        setState(() {
          _resultText = 'Ergebnis: $diceResult';
        });
      }
    }).catchError((error) {
      setState(() {
        _resultText = 'Fehler: $error';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _rollDice,
            child: Text('Würfeln'),
          ),
          SizedBox(height: 16),
          Text(
            _resultText,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
