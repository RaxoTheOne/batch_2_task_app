import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class S5531 extends StatelessWidget {
  const S5531({super.key});
  @override
  Widget build(BuildContext context) {
    return RandomUserWidget();
  }
}

class RandomUserWidget extends StatefulWidget {
  @override
  _RandomUserWidgetState createState() => _RandomUserWidgetState();
}

class _RandomUserWidgetState extends State<RandomUserWidget> {
  late Future<RandomUser> futureRandomUser;

  @override
  void initState() {
    super.initState();
    futureRandomUser = fetchRandomUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RandomUser>(
      future: futureRandomUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Zeige einen CircularProgressIndicator, während die Daten geladen werden.
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Zeige ein Icon und einen IconButton für den Fehlerfall.
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 50.0,
                  color: Colors.red,
                ),
                SizedBox(height: 30.0),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      futureRandomUser = fetchRandomUser();
                    });
                  },
                ),
                Text('Fehler beim Laden des Benutzers.'),
              ],
            ),
          );
        } else {
          // Zeige die Daten des geladenen Benutzers an.
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(snapshot.data!.imageUrl),
              ),
              SizedBox(height: 10.0),
              Text('Vorname: ${snapshot.data!.firstName}'),
              Text('Nachname: ${snapshot.data!.lastName}'),
            ],
          );
        }
      },
    );
  }
}

/// gibt ein Future eines [RandomUser] zurück
Future<RandomUser> fetchRandomUser() async {
  // API-Call
  final response = await http.get(Uri.parse('https://randomuser.me/api'));

  // Wenn der API-Call erfolgreich war, wird das JSON-Objekt in eine RandomUser-Instanz konvertiert.
  if (response.statusCode == 200) {
    final userJson = json.decode(response.body)['results'][0];
    return RandomUser.fromJson(userJson);
  } else {
    throw Exception('Konnte Random User nicht laden.');
  }
}

/// eine Model-Klasse für einen Random User
class RandomUser {
  final String firstName;
  final String lastName;
  final String imageUrl;

  RandomUser({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  // Konvertiert das JSON-Objekt aus dem API-Call in eine RandomUser-Instanz.
  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      imageUrl: json['picture']['large'],
    );
  }
}
