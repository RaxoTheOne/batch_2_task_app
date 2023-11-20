import 'package:flutter/material.dart';

class S5132 extends StatelessWidget {
  const S5132({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 200,
        height: 30,
        child: Text(
            'This is a very long text that should overflow the box and be clipped by the ClipRect widget.'),
      ),
    );
  }
}
