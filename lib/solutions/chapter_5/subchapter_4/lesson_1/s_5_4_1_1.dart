import 'package:flutter/material.dart';

class S5411 extends StatelessWidget {
  const S5411({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter-Code'),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    // Verwende die neue Methode, um eine SnackBar anzuzeigen
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handleButtonPress() {
    try {
      // Erzeuge einen Laufzeitfehler, indem du eine Null-Variable verwendest
      var x = null;
      var y = x + 1;
    } catch (e) {
      // Fange den Fehler ab und gib ihn in einer SnackBar aus
      _showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ElevatedButton(
        child: Text('Klicke mich'),
        onPressed: _handleButtonPress,
      ),
    );
  }
}
