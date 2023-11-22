import 'package:flutter/material.dart';

class S5421 extends StatefulWidget {
  const S5421({Key? key}) : super(key: key);

  @override
  _S5421State createState() => _S5421State();
}

class _S5421State extends State<S5421> {
  final List<String> begriffe = ['Begriff 1', 'Begriff 2', 'Begriff 3', 'Begriff 4', 'Begriff 5'];
  TextEditingController _controller = TextEditingController();
  int selectedIdx = -1;

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
        Container(
          height: 200, // Anpassen Sie die Höhe nach Bedarf
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
              if (value.isNotEmpty) {
                try {
                  int index = int.parse(value);
                  if (index >= 0 && index < begriffe.length) {
                    setState(() {
                      selectedIdx = index;
                    });
                  } else {
                    setState(() {
                      selectedIdx = -1;
                    });
                    zeigeFehlermeldung('Index außerhalb des Bereichs');
                  }
                } catch (e) {
                  setState(() {
                    selectedIdx = -1;
                  });
                  zeigeFehlermeldung('Keine gültige Zahl');
                  print('Fehler beim Parsen der Eingabe: $e');
                }
              } else {
                setState(() {
                  selectedIdx = -1;
                });
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