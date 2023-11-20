import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class S5131 extends StatelessWidget {
  const S5131({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Fonts Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('This is Roboto',
            style: GoogleFonts.roboto(fontSize: 24),
            ),
            Text('This is Pacifico',
            style: GoogleFonts.pacifico(fontSize: 24),
            ),
            Text('This is Indie Flower',
            style: GoogleFonts.indieFlower(fontSize: 24),
            ),
            Text('This is Lobster',
            style: GoogleFonts.lobster(fontSize: 24),
            ),
            ],
          )
        ),
      ),
    );
  }
}
