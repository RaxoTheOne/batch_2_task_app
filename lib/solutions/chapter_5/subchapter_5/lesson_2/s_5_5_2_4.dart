import 'dart:math';
import 'package:flutter/material.dart';

class S5524 extends StatefulWidget {
  const S5524({Key? key}) : super(key: key);

  @override
  _S5524State createState() => _S5524State();
}

class _S5524State extends State<S5524> {
  Future<String> _rollDice() async {
    // Simuliere das Würfeln mit einer Verzögerung von 2 Sekunden
    await Future.delayed(Duration(seconds: 2));

    // Zufällig entscheiden, ob ein Fehler auftritt
    bool hasError = Random().nextBool();

    if (hasError) {
      throw Exception('Ein Fehler ist aufgetreten!');
    } else {
      int diceResult = Random().nextInt(6) + 1;
      return 'Ergebnis: $diceResult';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Würfeln'),
          ),
          SizedBox(height: 16),
          FutureBuilder(
            future: _rollDice(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Würfel wird geworfen...');
              } else if (snapshot.hasError) {
                return Text('Fehler: ${snapshot.error}');
              } else {
                return Text(
                  snapshot.data as String,
                  style: TextStyle(fontSize: 18),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
