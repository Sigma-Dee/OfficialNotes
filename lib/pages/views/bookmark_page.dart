import 'package:flutter/material.dart';
import 'package:official_app/data/handler.dart';

class Bookmarked extends StatefulWidget {
  const Bookmarked({super.key});

  @override
  State<Bookmarked> createState() => _BookmarkedState();
}

class _BookmarkedState extends State<Bookmarked> {
  // check list
  bool isListEmpty() {
    if (savedNotes.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

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
      appBar: AppBar(
        title: Text('Bookmarked'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Remove All'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: isListEmpty()
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
                          'Bookmark Empty',
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
                itemCount: savedNotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: softColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          savedNotes[index].noteTitle.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            height: 1.5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        subtitle: Text(
                          savedNotes[index].noteContent,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        trailing: Icon(
                          Icons.bookmark,
                          color: hardColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
