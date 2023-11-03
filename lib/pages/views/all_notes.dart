import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:official_app/model/data_model.dart';
import 'package:official_app/pages/add_update_note.dart';

import '../../constants/time.dart';
import '../../data/handler.dart';
import '../../main.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({
    super.key,
  });

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  // check list
  bool isListEmpty() {
    if (noteBox.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // initialize state
  @override
  void initState() {
    super.initState();
  }

  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color hardColor = Colors.blue.shade300;
    Color softColor = Colors.blue.shade100;

    return Scaffold(
      body: isListEmpty()
          ? ClipRRect(
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
                        'Note Box Empty',
                        style: TextStyle(
                          color: hardColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: noteBox.length,
              itemBuilder: (context, index) {
                Note noteData = noteBox.getAt(index);
                String noteKey = noteBox.keyAt(index);
                final createdAt = noteData.noteCreatedAt;
                final formattedTime = formatTimeDifference(createdAt);
                return Card(
                  color: softColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        noteData.noteTitle.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          height: 1.5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noteData.noteContent,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'Created: $formattedTime',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            Note bookMarked = noteBox.getAt(index);
                            if (savedNotes.contains(bookMarked)) {
                              savedNotes.remove(bookMarked);
                            } else {
                              savedNotes.add(bookMarked);
                            }
                            noteData.isSaved = !noteData.isSaved;
                          });
                          // toast message
                          Fluttertoast.showToast(
                            msg: noteData.isSaved
                                ? 'Added to favorites'
                                : 'Removed from favorites',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: noteData.isSaved
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        icon: Icon(
                          Icons.bookmark_rounded,
                          color: noteData.isSaved
                              ? hardColor
                              : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotePage(
                              initialTitle: noteData.noteTitle,
                              initialContent: noteData.noteContent,
                              noteKey: noteKey,
                              stateCheck: 'true',
                              updateUI: updateUI,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
