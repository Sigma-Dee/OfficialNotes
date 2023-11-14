import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:official_app/data/handler.dart';

import '../constants/colors.dart';
import 'add_update_agenda.dart';
import 'add_update_memo.dart';
import 'add_update_note.dart';
import 'add_update_task.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({
    super.key,
    this.updateUI,
  });

  final VoidCallback? updateUI;

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    // card color
    getColor(int index) {
      if (index >= 0 && index < listAccentColors.length) {
        return listAccentColors[index];
      } else {
        return AppColors.accentColorOne;
      }
    }

    void updateUI() {
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          'Create',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 10,
            ),
            child: InkWell(
              onTap: () {},
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
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
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
                    Icons.delete,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: buttonIcons.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  switch (buttonIcons[index]) {
                    case Icons.add:
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
                      break;
                    case Icons.add_task:
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
                      break;
                    case Icons.add_photo_alternate_outlined:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MemoPage(
                            stateCheck: 'false',
                          ),
                        ),
                      );
                      break;
                    case Icons.calendar_month_rounded:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AgendaPage(
                            stateCheck: 'false',
                          ),
                        ),
                      );
                      break;
                  }
                },
                child: Card(
                  elevation: 0,
                  color: getColor(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 310,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                right: 15,
                                left: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Icon(
                                      buttonIcons[index],
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      width: 3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Add',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'New ${buttonText[index]}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
