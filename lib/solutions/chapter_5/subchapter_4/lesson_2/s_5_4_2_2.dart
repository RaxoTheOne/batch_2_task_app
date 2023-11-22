import 'package:flutter/material.dart';

class AgeException implements Exception {
  String errorMessage() => 'Alter muss zwischen 0 und 100 liegen';
}

class S5422 extends StatefulWidget {
  const S5422({Key? key}) : super(key: key);

  @override
  _S5422State createState() => _S5422State();
}

class _S5422State extends State<S5422> {
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Alter'),
        ),
        SizedBox(height: 16),
        TextButton(
          onPressed: () {
            _handleButtonClick(context);
          },
          child: Text('Alter bestätigen'),
        ),
      ],
    );
  }

  void _handleButtonClick(BuildContext context) {
    try {
      int age = int.parse(_ageController.text);

      if (age <= 0 || age >= 100) {
        throw AgeException();
      } else {
        // Zeige das Alter in einer SnackBar an
        _showSnackBar(context, 'Alter: $age');
      }
    } catch (e) {
      if (e is FormatException) {
        // Ungültiger Wert, zeige entsprechende Fehlermeldung
        _showSnackBar(context, 'Ungültiges Alter');
      } else if (e is AgeException) {
        // Alter außerhalb des gültigen Bereichs, zeige entsprechende Fehlermeldung
        _showSnackBar(context, e.errorMessage());
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
