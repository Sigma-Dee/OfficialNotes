import 'package:flutter/material.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color hardColor = Colors.green.shade300;
    Color softColor = Colors.green.shade100;
    return Scaffold(
      body: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(28),
        ),
        child: Container(
          color: softColor,
          child: Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                color: Colors.white,
                child: Text(
                  'Task Box Empty',
                  style: TextStyle(
                    color: hardColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
