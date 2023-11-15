import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class S5331 extends StatefulWidget {
  const S5331({Key? key}) : super(key: key);
  @override
  State<S5331> createState() => _S5331State();
}
class _S5331State extends State<S5331> {
  String imgPath = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                setState(() {
                  imgPath = image?.path ?? "";
                });
              },
              icon: const Icon(Icons.camera),
            ),
            IconButton(
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  imgPath = image?.path ?? "";
                });
              },
              icon: const Icon(Icons.browse_gallery),
            ),
          ],
        ),
      ],
    );
  }
}