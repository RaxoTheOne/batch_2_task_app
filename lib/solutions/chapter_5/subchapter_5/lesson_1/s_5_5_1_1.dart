import 'package:flutter/material.dart';

class S5511 extends StatefulWidget {
  const S5511({Key? key}) : super(key: key);

  @override
  _S5511State createState() => _S5511State();
}

class _S5511State extends State<S5511> {
  int counter1 = 0;
  int counter2 = 0;

  Future<void> warteKurz() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> asyncMethode1() async {
    await warteKurz();
    print('Methode 1: $counter1');
    setState(() {
      counter1++;
    });
  }

  Future<void> asyncMethode2() async {
    await warteKurz();
    print('Methode 2: $counter2');
    setState(() {
      counter2++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await asyncMethode1();
              await asyncMethode2();
              print('Fertig');
            },
            child: Text('Click me'),
          ),
          SizedBox(height: 20),
          Text('Counter 1: $counter1'),
          Text('Counter 2: $counter2'),
        ],
      ),
    );
  }
}
