import 'package:flutter/material.dart';

class AllAgendasPage extends StatelessWidget {
  const AllAgendasPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color hardColor = Colors.orange.shade300;
    Color softColor = Colors.orange.shade100;
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
                  'Agenda Box Empty',
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
