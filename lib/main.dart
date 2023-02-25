import 'package:auto_scroll/vertical_autoscroll_screen.dart';
import 'package:auto_scroll/horizontal_autoscroll_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool  isVertical = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Scroll Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: isVertical ? const Text("Vertical Auto Scroll") : const Text("Horizontal Auto Scroll"),
          actions: [ Center(
            child: TextButton(
              child: const Text("Switch",style: TextStyle(color: Colors.black),),
              onPressed: () {
                setState(() {
                  isVertical = !isVertical;
                });
              },
            ),
          )],
        ),
        body: isVertical ? const VerticalAutoScrollScreen() : const HorizontalAutoScrollScreen(),
      ),
    );
  }
}

