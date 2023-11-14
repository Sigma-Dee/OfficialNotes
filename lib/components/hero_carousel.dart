import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:official_app/pages/add_update_agenda.dart';
import 'package:official_app/pages/add_update_memo.dart';
import 'package:official_app/pages/add_update_note.dart';
import 'package:official_app/pages/add_update_task.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../data/handler.dart';

class HeroCarousel extends StatefulWidget {
  const HeroCarousel({super.key});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  // active index
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    // hero color
    getHeroColor(int index) {
      if (index >= 0 && index < listColors.length) {
        return listColors[index];
      } else {
        return AppColors.accentColorOne;
      }
    }

    // accent color
    getAccentColor(int index) {
      if (index >= 0 && index < listAccentColors.length) {
        return listAccentColors[index];
      } else {
        return AppColors.accentColorOne;
      }
    }

    void updateUI() {
      setState(() {});
    }

    return Container(
      decoration: BoxDecoration(
        color: getHeroColor(activeIndex),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          CarouselSlider.builder(
            itemCount: buttonIcons.length,
            itemBuilder: (context, index, realIndex) {
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
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 260,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.4),
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
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              height: 120,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => setState(() {
                activeIndex = index;
              }),
            ),
          ),
          AnimatedSmoothIndicator(
            effect: ExpandingDotsEffect(
              dotWidth: 15,
              dotColor: Colors.grey.shade600.withOpacity(0.4),
              activeDotColor: getAccentColor(activeIndex),
            ),
            activeIndex: activeIndex,
            count: buttonIcons.length,
          ),
        ],
      ),
    );
  }
}
