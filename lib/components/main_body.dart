import 'package:flutter/material.dart';
import 'package:official_app/pages/views/all_agendas.dart';
import 'package:official_app/pages/views/all_memos.dart';
import 'package:official_app/pages/views/all_notes.dart';
import 'package:official_app/pages/views/all_tasks.dart';

import '../data/handler.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    super.key,
    required this.updateUI,
  });

  final VoidCallback updateUI;

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  // selected index
  int selectedIndex = 0;
  var pageController = PageController(initialPage: 0);
  // list of pages
  final pages = const [
    AllNotesPage(),
    AllTasksPage(),
    AllMemosPage(),
    AllAgendasPage(),
  ];

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    // build widget
    return DraggableScrollableSheet(
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              // Draggable Scrollable Sheet handle
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 130,
                ),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // category selector
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(buttonText.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              switch (buttonText[index]) {
                                case 'Note':
                                  goToPage(index);
                                  break;
                                case 'Task':
                                  goToPage(index);
                                  break;
                                case 'Memo':
                                  goToPage(index);
                                  break;
                                case 'Agenda':
                                  goToPage(index);
                                  break;
                              }
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Colors.grey.shade300
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Text(
                                buttonText[index],
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    // toggle layout change
                    InkWell(
                      onTap: () {
                        setState(() {
                          isToggled = !isToggled;
                        });
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
                        child: Icon(
                          isToggled
                              ? Icons.grid_view_rounded
                              : Icons.view_agenda_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              // Page Viewer
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 390,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (int pageIndex) {
                      setState(() {
                        selectedIndex = pageIndex;
                      });
                    },
                    itemCount: pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return pages[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      initialChildSize: 0.65,
      minChildSize: 0.65,
      maxChildSize: 1,
    );
  }
}
