import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class S5131 extends StatelessWidget {
  const S5131({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'This is Roboto',
          style: GoogleFonts.roboto(fontSize: 24),
          selectionColor: Colors.black,
        ),
        Text(
          'This is Pacifico',
          style: GoogleFonts.pacifico(fontSize: 24),
          selectionColor: Colors.black,
        ),
        Text(
          'This is Indie Flower',
          style: GoogleFonts.indieFlower(fontSize: 24),
          selectionColor: Colors.black,
        ),
        Text(
          'This is Lobster',
          style: GoogleFonts.lobster(fontSize: 24),
          selectionColor: Colors.black,
        ),
      ],
    );
  }
}