import 'package:flutter/material.dart';

class S5521 extends StatefulWidget {
  const S5521({Key? key}) : super(key: key);

  @override
  _S5521State createState() => _S5521State();
}

class _S5521State extends State<S5521> {
  double _progressValue = 0.0;
  bool _isButtonEnabled = true;

  void _startAsyncOperation() {
    if (!_isButtonEnabled) {
      return;
    }

    setState(() {
      _progressValue = 0.0;
      _isButtonEnabled = false;
    });

    // Simuliere eine asynchrone Operation
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _progressValue = 1.0;
        _isButtonEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgressIndicator(
          value: _progressValue,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 16),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 30,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Text(
              '${(_progressValue * 100).toStringAsFixed(0)}%',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _startAsyncOperation,
          child: Text('Start Async Operation'),
        ),
      ],
    );
  }
}
