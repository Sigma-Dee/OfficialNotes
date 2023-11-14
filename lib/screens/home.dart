import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:official_app/components/hero_carousel.dart';
import 'package:official_app/components/user_card.dart';
import 'package:official_app/widgets/saved_icon_button.dart';

import '../components/main_body.dart';
import '../pages/add_update_agenda.dart';
import '../pages/add_update_memo.dart';
import '../pages/add_update_note.dart';
import '../pages/add_update_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpen = false;
  // update ui
  void updateUI() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isOpen = false;
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
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.white,
        onOpen: () {
          setState(() {
            isOpen = true;
          });
        },
        onClose: () {
          setState(() {
            isOpen = false;
          });
        },
        spacing: 30,
        overlayOpacity: 0.0,
        shape: isOpen
            ? CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            backgroundColor: Colors.blue.shade200,
            label: 'New Note',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotePage(
                    initialTitle: '',
                    initialContent: '',
                    stateCheck: 'false',
                    updateUI: updateUI,
                  ),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.add_task),
            backgroundColor: Colors.green.shade200,
            label: 'New Task',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskPage(
                    stateCheck: 'false',
                    updateUI: updateUI,
                    initialTitle: '',
                    initialDetails: '',
                  ),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.add_photo_alternate_outlined),
            backgroundColor: Colors.brown.shade200,
            label: 'New Memo',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MemoPage(
                    stateCheck: 'false',
                  ),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.calendar_month_rounded),
            backgroundColor: Colors.orange.shade200,
            label: 'New Agenda',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AgendaPage(
                    stateCheck: 'false',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      /*
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

       */
    );
  }
}
