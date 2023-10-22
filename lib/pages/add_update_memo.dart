import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({
    super.key,
    this.updateUI,
    this.stateCheck,
  });

  final VoidCallback? updateUI;
  final String? stateCheck;
  //final String initialTitle;
  //final String initialContent;
  //final String? noteKey;

  @override
  State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  // Text Editing Controllers
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  // Initialize State
  @override
  void initState() {
    super.initState();
  }

  // dispose
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Color hardColor = Colors.brown.shade300;
  Color softColor = Colors.brown.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: hardColor,
          ),
        ),
        title: Text(
          'Create Memo',
          style: TextStyle(
            color: hardColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                setState(() {});
                // toast message
                Fluttertoast.showToast(
                  msg: 'Saved',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: softColor.withOpacity(0.2),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.inbox_rounded,
                  color: hardColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(28),
          ),
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(10),
            color: softColor,
            child: Center(
              child: Stack(
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: contentController,
                        maxLines: 6,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: const EdgeInsets.only(
                            bottom: 12,
                            top: 120,
                            left: 20,
                            right: 20,
                          ),
                          hintText: 'Memo',
                          hintStyle: TextStyle(
                            color: hardColor,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: titleController,
                    onChanged: null,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: hardColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}