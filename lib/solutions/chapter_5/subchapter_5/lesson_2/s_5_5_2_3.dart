import 'dart:math';
import 'package:flutter/material.dart';

class S5523 extends StatefulWidget {
  const S5523({Key? key}) : super(key: key);

  @override
  _S5523State createState() => _S5523State();
}

class _S5523State extends State<S5523> {
  String _resultText = '';

  Future<void> _rollDice() async {
    setState(() {
      _resultText = 'Würfel wird geworfen...';
    });

    try {
      // Simuliere das Würfeln mit einer Verzögerung von 2 Sekunden
      await Future.delayed(Duration(seconds: 2));

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
    } catch (error) {
      setState(() {
        _resultText = 'Fehler: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _rollDice();
            },
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
