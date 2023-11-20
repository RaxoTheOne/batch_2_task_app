import 'package:flutter/material.dart';

class S5133 extends StatelessWidget {
  const S5133({super.key}); // Füge ein Fragezeichen nach Key hinzu, um einen optionalen Parameter zu machen
  @override
  Widget build(BuildContext context) {
    // Erstelle einen Container mit den gewünschten Eigenschaften
    return Container(
      // Setze einen Schatten mit der BoxShadow-Klasse
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 75, 74, 74).withOpacity(0.5), // Die Farbe und Opazität des Schattens
            spreadRadius: 5, // Die Ausbreitung des Schattens
            blurRadius: 7, // Die Unschärfe des Schattens
            offset: const Offset(0, 10), // Die Verschiebung des Schattens
          ),
        ],
      ),
      // Setze abgerundete Ecken mit der BorderRadius-Klasse
      clipBehavior: Clip.antiAlias, // Verhindere, dass der Inhalt über die Ecken hinausgeht
      child: Container(
        
        padding: const EdgeInsets.all(10), // Setze einen Innenabstand von 10 Pixeln
        width: 200, // Setze eine Breite von 200 Pixeln
        height: 200, // Setze eine Höhe von 100 Pixeln
        color: const Color.fromARGB(255, 0, 140, 255), // Setze eine Hintergrundfarbe von Blau
        child: const Text(
          'This is a stylish container with a shadow, rounded corners, padding, background color and a text content.', // Setze einen Textinhalt
          style: TextStyle(
            color: Colors.white, // Setze eine Textfarbe von Weiß
            fontSize: 16, // Setze eine Schriftgröße von 16 Pixeln
          ),
        ),
      ),
    );
  }
}