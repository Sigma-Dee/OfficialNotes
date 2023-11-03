import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:official_app/pages/views/bookmark_page.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Bookmarked(),
            ),
          );
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.grey.shade200,
          ),
          padding: const EdgeInsets.all(10),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(
              top: 0,
              end: 2,
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.green.shade200,
              borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 1.5,
              ),
            ),
            child: const Icon(
              Icons.bookmark,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
