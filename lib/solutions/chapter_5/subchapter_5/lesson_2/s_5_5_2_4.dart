import 'dart:math';
import 'package:flutter/material.dart';

class S5524 extends StatefulWidget {
  const S5524({Key? key}) : super(key: key);

  @override
  _S5524State createState() => _S5524State();
}

class _S5524State extends State<S5524> {
  // Erstellen Sie eine Variable, um die Future zu speichern
  Future<String>? diceFuture;

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
            onPressed: () {
              // Erstellen Sie eine neue Future, wenn Sie die Schaltfläche drücken
              diceFuture = _rollDice();
              // Aktualisieren Sie den Zustand des Widgets, um die FutureBuilder neu zu erstellen
              setState(() {});
            },
            child: Text('Würfeln'),
          ),
          SizedBox(height: 16),
          FutureBuilder(
            // Verwenden Sie die Future-Variable, die Sie erstellt haben
            future: diceFuture,
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Würfel wird geworfen...');
              } else if (snapshot.hasError) {
                return Text('Fehler: ${snapshot.error}');
              } else {
                return Text(
                  snapshot.data!,
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
