import 'package:flutter/material.dart';
class S5132 extends StatelessWidget {
  const S5132({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyExampleBox(),
    );
  }
}
class MyExampleBox extends StatefulWidget {
  const MyExampleBox({super.key});
  @override
  State<MyExampleBox> createState() => _MyExampleBoxState();
}
class _MyExampleBoxState extends State<MyExampleBox> {
    bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 200,
            height: 30,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                "This is a very long text that should overflow the box and be clipped by the ClipRect widget.",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
          );
  }
}