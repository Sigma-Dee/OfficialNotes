import 'package:flutter/material.dart';
import 'package:official_app/components/hero_carousel.dart';
import 'package:official_app/components/user_card.dart';
import 'package:official_app/pages/options.dart';
import 'package:official_app/widgets/saved_icon_button.dart';

import '../components/main_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // update ui
  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.blue,
        leading: const UserCard(),
        leadingWidth: 190,
        toolbarHeight: 80,
        actions: const [
          Saved(),
        ],
      ),
      // Stack
      body: const Stack(
        children: [
          HeroCarousel(),
          MainBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OptionsPage(
                updateUI: updateUI,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
