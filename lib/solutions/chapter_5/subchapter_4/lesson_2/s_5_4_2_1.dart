import 'package:flutter/material.dart';

class S5421 extends StatelessWidget {
  const S5421({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> begriffe = ['Begriff 1', 'Begriff 2', 'Begriff 3', 'Begriff 4', 'Begriff 5'];
  int selectedIdx = -1;
  final TextEditingController _controller = TextEditingController();

  void markiereEintrag(int index) {
    setState(() {
      selectedIdx = index;
    });
  }

  void zeigeFehlermeldung(String fehler) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(fehler),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: begriffe.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(begriffe[index]),
                tileColor: index == selectedIdx ? Colors.blue : null,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              try {
                int index = int.parse(value);
                if (index < 0 || index >= begriffe.length) {
                  markiereEintrag(-1);
                  zeigeFehlermeldung('Index außerhalb des Bereichs');
                } else {
                  markiereEintrag(index);
                }
              } catch (e) {
                markiereEintrag(-1);
                zeigeFehlermeldung('Keine gültige Zahl');
                print('Fehler beim Parsen der Eingabe: $e');
              }
            },
            decoration: InputDecoration(
              labelText: 'Listenindex eingeben',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
