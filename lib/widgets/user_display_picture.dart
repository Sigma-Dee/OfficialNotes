import 'package:flutter/material.dart';

class UserDisplayPicture extends StatelessWidget {
  const UserDisplayPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.all(10),
      child: const Icon(
        Icons.person,
        color: Colors.grey,
      ),
    );
  }
}
