import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:official_app/components/navigation.dart';
import 'package:official_app/model/data_model.dart';

// initialize Box
late Box noteBox;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  noteBox = await Hive.openBox<Note>('noteBox');
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const NavigationManager(),
    );
  }
}
