import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:official_app/components/navigation.dart';
import 'package:official_app/model/data_model.dart';

// initialize Box
late Box noteBox;
late Box taskBox;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(TaskAdapter());
  noteBox = await Hive.openBox<Note>('noteBox');
  taskBox = await Hive.openBox<Task>('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Build Material App Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Official Notes App',
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const NavigationManager(),
    );
  }
}
