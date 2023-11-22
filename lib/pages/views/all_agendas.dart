import 'package:flutter/material.dart';
import 'package:official_app/components/main_body.dart';
import 'package:official_app/main.dart';
import 'package:official_app/model/data_model.dart';
import 'package:provider/provider.dart';

class AllAgendasPage extends StatefulWidget {
  const AllAgendasPage({super.key});

  @override
  State<AllAgendasPage> createState() => _AllAgendasPageState();
}

class _AllAgendasPageState extends State<AllAgendasPage> {
  // check list
  bool isListEmpty() {
    if (agendaBox.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color hardColor = Colors.orange.shade300;
    Color softColor = Colors.orange.shade100;
    return Scaffold(
      body: isListEmpty()
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
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
            )
          : SwitchAgendaLayout(
              hardColor: hardColor,
              softColor: softColor,
              updateUI: updateUI,
            ),
    );
  }
}

class SwitchAgendaLayout extends StatefulWidget {
  const SwitchAgendaLayout({
    super.key,
    required this.hardColor,
    required this.softColor,
    required this.updateUI,
  });

  final Color hardColor;
  final Color softColor;
  final VoidCallback updateUI;

  @override
  State<SwitchAgendaLayout> createState() => _SwitchAgendaLayoutState();
}

class _SwitchAgendaLayoutState extends State<SwitchAgendaLayout> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<LayoutChangerState>();
    if (appState.isToggled == true) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(28),
        ),
        child: Container(
          color: widget.softColor,
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
                  'Grid View',
                  style: TextStyle(
                    color: widget.hardColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: taskBox.length,
        itemBuilder: (context, index) {
          Agenda agendaData = agendaBox.getAt(index);
          String agendaKey = agendaBox.keyAt(index);
          return Card(
            color: agendaData.pinColor,
            clipBehavior: Clip.hardEdge,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Placeholder(),
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => Placeholder(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        agendaData.subjectTitle.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          height: 1.5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        agendaData.startTime.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        agendaData.endTime.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
