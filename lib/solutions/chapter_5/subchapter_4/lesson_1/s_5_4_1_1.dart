import 'package:flutter/material.dart';

class S5411 extends StatelessWidget {
  const S5411({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          try {
            // Hier wird ein Laufzeitfehler erzeugt
            throw Exception('[meinException-Name]');
          } catch (e) {
            // Hier wird der Fehler in einer SnackBar ausgegeben
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Fehler aufgetreten: $e'),
              ),
            );
          }
        },
        child: Text('Klicke mich'),
      ),
    );
  }
}
